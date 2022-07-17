/*
===========================================================================
Copyright (C) 1999-2005 Id Software, Inc.

This file is part of Quake III Arena source code.

Quake III Arena source code is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of the License,
or (at your option) any later version.

Quake III Arena source code is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Quake III Arena source code; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
===========================================================================
*/
// string allocation/management

#include "ui_shared.h"
#include "ui/menudef.h"

#define SCROLL_TIME_START 500
#define SCROLL_TIME_ADJUST 150
#define SCROLL_TIME_ADJUSTOFFSET 40
#define SCROLL_TIME_FLOOR 20

typedef struct scrollInfo_s {
    int nextScrollTime;
    int nextAdjustTime;
    int adjustValue;
    int scrollKey;
    float xStart;
    float yStart;
    itemDef_t* item;
} scrollInfo_t;

static scrollInfo_t scrollInfo;

static void (*captureFunc)(void* p) = 0;
static void* captureData = NULL;
static itemDef_t* itemCapture = NULL; // item that has the mouse captured ( if any )

displayContextDef_t* DC = NULL;

static bool g_waitingForKey = false;
static bool g_editingField = false;

static itemDef_t* g_bindItem = NULL;
static itemDef_t* g_editItem = NULL;

menuDef_t Menus[MAX_MENUS]; // defined menus
int menuCount = 0; // how many

static bool debugMode = false;

#define DOUBLE_CLICK_DELAY 300
static int lastListBoxClickTime = 0;

void Item_RunScript(itemDef_t* item, const char* s);
void Item_SetupKeywordHash(void);
void Menu_SetupKeywordHash(void);
int BindingIDFromName(const char* name);
bool Item_Bind_HandleKey(itemDef_t* item, int key, bool down);
itemDef_t* Menu_SetPrevCursorItem(menuDef_t* menu);
itemDef_t* Menu_SetNextCursorItem(menuDef_t* menu);
static bool Menu_OverActiveItem(menuDef_t* menu, float x, float y);

#ifdef CGAME
#define MEM_POOL_SIZE 128 * 1024
#else
#define MEM_POOL_SIZE 1024 * 1024
#endif

static char memoryPool[MEM_POOL_SIZE];
static int allocPoint, outOfMemory;

void* UI_Alloc(int size)
{
    char* p;

    if (allocPoint + size > MEM_POOL_SIZE) {
        outOfMemory = true;
        if (DC->Print) {
            DC->Print("UI_Alloc: Failure. Out of memory!\n");
        }
        // DC->trap_Print(S_COLOR_YELLOW"WARNING: UI Out of Memory!\n");
        return NULL;
    }

    p = &memoryPool[allocPoint];

    allocPoint += (size + 15) & ~15;

    return p;
}

void UI_InitMemory()
{
    allocPoint = 0;
    outOfMemory = false;
}

bool UI_OutOfMemory()
{
    return outOfMemory;
}

#define HASH_TABLE_SIZE 2048
/*
================
return a hash value for the string
================
*/
static unsigned hashForString(const char* str)
{
    int i;
    unsigned hash;
    char letter;

    hash = 0;
    i = 0;
    while (str[i] != '\0') {
        letter = tolower(str[i]);
        hash += (unsigned)(letter) * (i + 119);
        i++;
    }
    hash &= (HASH_TABLE_SIZE - 1);
    return hash;
}

typedef struct stringDef_s {
    struct stringDef_s* next;
    const char* str;
} stringDef_t;

static int strPoolIndex = 0;
static char strPool[STRING_POOL_SIZE];

static stringDef_t* strHandle[HASH_TABLE_SIZE];

const char* String_Alloc(const char* p)
{
    int len;
    unsigned hash;
    stringDef_t *str, *last;
    static const char* staticNULL = "";

    if (p == NULL) {
        return NULL;
    }

    if (*p == 0) {
        return staticNULL;
    }

    hash = hashForString(p);

    str = strHandle[hash];
    while (str) {
        if (strcmp(p, str->str) == 0) {
            return str->str;
        }
        str = str->next;
    }

    len = strlen(p);
    if (len + strPoolIndex + 1 < STRING_POOL_SIZE) {
        int ph = strPoolIndex;
        strcpy(&strPool[strPoolIndex], p);
        strPoolIndex += len + 1;

        str = strHandle[hash];
        last = str;
        while (str && str->next) {
            last = str;
            str = str->next;
        }

        str = UI_Alloc(sizeof(stringDef_t));
        if (!str) {
            return NULL;
        }
        str->next = NULL;
        str->str = &strPool[ph];
        if (last) {
            last->next = str;
        } else {
            strHandle[hash] = str;
        }
        return &strPool[ph];
    }
    return NULL;
}

void String_Report()
{
    float f;
    Com_Printf("Memory/String Pool Info\n");
    Com_Printf("----------------\n");
    f = strPoolIndex;
    f /= STRING_POOL_SIZE;
    f *= 100;
    Com_Printf("String Pool is %.1f%% full, %i bytes out of %i used.\n", f, strPoolIndex, STRING_POOL_SIZE);
    f = allocPoint;
    f /= MEM_POOL_SIZE;
    f *= 100;
    Com_Printf("Memory Pool is %.1f%% full, %i bytes out of %i used.\n", f, allocPoint, MEM_POOL_SIZE);
}

void String_Init()
{
    int i;
    for (i = 0; i < HASH_TABLE_SIZE; i++) {
        strHandle[i] = NULL;
    }
    strPoolIndex = 0;
    menuCount = 0;
    UI_InitMemory();
    Item_SetupKeywordHash();
    Menu_SetupKeywordHash();
    if (DC && DC->getBindingBuf) {
        Controls_GetConfig();
    }
}

static PRINTF_FUNCTION(2, 3) void PC_SourceError(const int handle, const char* format, ...)
{
    int line;
    char filename[128];
    va_list argptr;
    static char string[4096];

    va_start(argptr, format);
    Q_vsnprintf(string, sizeof(string), format, argptr);
    va_end(argptr);

    filename[0] = '\0';
    line = 0;
    trap_PC_SourceFileAndLine(handle, filename, &line);

    Com_Printf(S_COLOR_RED "ERROR: %s, line %d: %s\n", filename, line, string);
}

void LerpColor(vec4_t a, vec4_t b, vec4_t c, float t)
{
    int i;

    // lerp and clamp each component
    for (i = 0; i < 4; i++) {
        c[i] = a[i] + t * (b[i] - a[i]);
        if (c[i] < 0)
            c[i] = 0;
        else if (c[i] > 1.0)
            c[i] = 1.0;
    }
}

bool Float_Parse(char** p, float* f)
{
    char* token;
    token = COM_ParseExt(p, false);
    if (token && token[0] != 0) {
        *f = atof(token);
        return true;
    } else {
        return false;
    }
}

bool PC_Float_Parse(int handle, float* f)
{
    pc_token_t token;
    int negative = false;

    if (!trap_PC_ReadToken(handle, &token))
        return false;
    if (token.string[0] == '-') {
        if (!trap_PC_ReadToken(handle, &token))
            return false;
        negative = true;
    }
    if (token.type != TT_NUMBER) {
        PC_SourceError(handle, "expected float but found %s", token.string);
        return false;
    }
    if (negative)
        *f = -token.floatvalue;
    else
        *f = token.floatvalue;
    return true;
}

bool Color_Parse(char** p, vec4_t* c)
{
    int i;
    float f;

    for (i = 0; i < 4; i++) {
        if (!Float_Parse(p, &f)) {
            return false;
        }
        (*c)[i] = f;
    }
    return true;
}

bool PC_Color_Parse(int handle, vec4_t* c)
{
    int i;
    float f;

    for (i = 0; i < 4; i++) {
        if (!PC_Float_Parse(handle, &f)) {
            return false;
        }
        (*c)[i] = f;
    }
    return true;
}

bool Int_Parse(char** p, int* i)
{
    char* token;
    token = COM_ParseExt(p, false);

    if (token && token[0] != 0) {
        *i = atoi(token);
        return true;
    } else {
        return false;
    }
}

bool PC_Int_Parse(int handle, int* i)
{
    pc_token_t token;
    int negative = false;

    if (!i)
        return false;
    if (!trap_PC_ReadToken(handle, &token))
        return false;
    if (token.string[0] == '-') {
        if (!trap_PC_ReadToken(handle, &token))
            return false;
        negative = true;
    }
    if (token.type != TT_NUMBER) {
        PC_SourceError(handle, "expected integer but found %s", token.string);
        return false;
    }
    *i = token.intvalue;
    if (negative)
        *i = -*i;
    return true;
}

bool Rect_Parse(char** p, rectDef_t* r)
{
    if (Float_Parse(p, &r->x)) {
        if (Float_Parse(p, &r->y)) {
            if (Float_Parse(p, &r->w)) {
                if (Float_Parse(p, &r->h)) {
                    return true;
                }
            }
        }
    }
    return false;
}

bool PC_Rect_Parse(int handle, rectDef_t* r)
{
    if (PC_Float_Parse(handle, &r->x)) {
        if (PC_Float_Parse(handle, &r->y)) {
            if (PC_Float_Parse(handle, &r->w)) {
                if (PC_Float_Parse(handle, &r->h)) {
                    return true;
                }
            }
        }
    }
    return false;
}

bool String_Parse(char** p, const char** out)
{
    char* token;

    token = COM_ParseExt(p, false);
    if (token && token[0] != 0) {
        *(out) = String_Alloc(token);
        return true;
    }
    return false;
}

bool PC_String_Parse(int handle, const char** out)
{
    pc_token_t token;

    if (!trap_PC_ReadToken(handle, &token))
        return false;

    *(out) = String_Alloc(token.string);
    return true;
}

bool PC_Script_Parse(int handle, const char** out)
{
    char script[1024];
    pc_token_t token;

    memset(script, 0, sizeof(script));
    // scripts start with { and have ; separated command lists.. commands are command, arg..
    // basically we want everything between the { } as it will be interpreted at run time

    if (!trap_PC_ReadToken(handle, &token))
        return false;
    if (Q_stricmp(token.string, "{") != 0) {
        return false;
    }

    while (1) {
        if (!trap_PC_ReadToken(handle, &token))
            return false;

        if (Q_stricmp(token.string, "}") == 0) {
            *out = String_Alloc(script);
            return true;
        }

        if (token.string[1] != '\0') {
            Q_strcat(script, 1024, va("\"%s\"", token.string));
        } else {
            Q_strcat(script, 1024, token.string);
        }
        Q_strcat(script, 1024, " ");
    }
    return false;
}

// display, window, menu, item code
//

/*
==================
Init_Display

Initializes the display with a structure to all the drawing routines
 ==================
*/
void Init_Display(displayContextDef_t* dc)
{
    DC = dc;
}

// type and style painting

static void GradientBar_Paint(rectDef_t* rect, vec4_t color)
{
    // gradient bar takes two paints
    DC->setColor(color);
    DC->drawHandlePic(rect->x, rect->y, rect->w, rect->h, DC->Assets.gradientBar);
    DC->setColor(NULL);
}

/*
==================
Window_Init

Initializes a window structure ( windowDef_t ) with defaults

==================
*/
static void Window_Init(Window* w)
{
    memset(w, 0, sizeof(windowDef_t));
    w->borderSize = 1;
    w->foreColor[0] = w->foreColor[1] = w->foreColor[2] = w->foreColor[3] = 1.0;
    w->cinematic = -1;
}

static void Fade(int* flags, float* f, float clamp, int* nextTime, int offsetTime, bool bFlags, float fadeAmount)
{
    if (*flags & (WINDOW_FADINGOUT | WINDOW_FADINGIN)) {
        if (DC->realTime > *nextTime) {
            *nextTime = DC->realTime + offsetTime;
            if (*flags & WINDOW_FADINGOUT) {
                *f -= fadeAmount;
                if (bFlags && *f <= 0.0) {
                    *flags &= ~(WINDOW_FADINGOUT | WINDOW_VISIBLE);
                }
            } else {
                *f += fadeAmount;
                if (*f >= clamp) {
                    *f = clamp;
                    if (bFlags) {
                        *flags &= ~WINDOW_FADINGIN;
                    }
                }
            }
        }
    }
}

static void Window_Paint(Window* w, float fadeAmount, float fadeClamp, float fadeCycle)
{
    // float bordersize = 0;
    vec4_t color = { 0 };
    rectDef_t fillRect;

    if (w == NULL) {
        return;
    }

    if (debugMode) {
        color[0] = color[1] = color[2] = color[3] = 1;
        DC->drawRect(w->rect.x, w->rect.y, w->rect.w, w->rect.h, 1, color);
    }

    if (w->style == 0 && w->border == 0) {
        return;
    }

    fillRect = w->rect;

    if (w->border != 0) {
        fillRect.x += w->borderSize;
        fillRect.y += w->borderSize;
        fillRect.w -= w->borderSize + 1;
        fillRect.h -= w->borderSize + 1;
    }

    if (w->style == WINDOW_STYLE_FILLED) {
        // box, but possible a shader that needs filled
        if (w->background) {
            Fade(&w->flags, &w->backColor[3], fadeClamp, &w->nextTime, fadeCycle, true, fadeAmount);
            DC->setColor(w->backColor);
            DC->drawHandlePic(fillRect.x, fillRect.y, fillRect.w, fillRect.h, w->background);
            DC->setColor(NULL);
        } else {
            DC->fillRect(fillRect.x, fillRect.y, fillRect.w, fillRect.h, w->backColor);
        }
    } else if (w->style == WINDOW_STYLE_GRADIENT) {
        GradientBar_Paint(&fillRect, w->backColor);
        // gradient bar
    } else if (w->style == WINDOW_STYLE_SHADER) {
        if (w->flags & WINDOW_FORECOLORSET) {
            DC->setColor(w->foreColor);
        }
        DC->drawHandlePic(fillRect.x, fillRect.y, fillRect.w, fillRect.h, w->background);
        DC->setColor(NULL);
    } else if (w->style == WINDOW_STYLE_TEAMCOLOR) {
        if (DC->getTeamColor) {
            DC->getTeamColor(&color);
            DC->fillRect(fillRect.x, fillRect.y, fillRect.w, fillRect.h, color);
        }
    } else if (w->style == WINDOW_STYLE_CINEMATIC) {
        if (w->cinematic == -1) {
            w->cinematic = DC->playCinematic(w->cinematicName, fillRect.x, fillRect.y, fillRect.w, fillRect.h);
            if (w->cinematic == -1) {
                w->cinematic = -2;
            }
        }
        if (w->cinematic >= 0) {
            DC->runCinematicFrame(w->cinematic);
            DC->drawCinematic(w->cinematic, fillRect.x, fillRect.y, fillRect.w, fillRect.h);
        }
    }

    if (w->border == WINDOW_BORDER_FULL) {
        // full
        // HACK HACK HACK
        if (w->style == WINDOW_STYLE_TEAMCOLOR) {
            if (color[0] > 0) {
                // red
                color[0] = 1;
                color[1] = color[2] = .5;

            } else {
                color[2] = 1;
                color[0] = color[1] = .5;
            }
            color[3] = 1;
            DC->drawRect(w->rect.x, w->rect.y, w->rect.w, w->rect.h, w->borderSize, color);
        } else {
            DC->drawRect(w->rect.x, w->rect.y, w->rect.w, w->rect.h, w->borderSize, w->borderColor);
        }
    } else if (w->border == WINDOW_BORDER_HORZ) {
        // top/bottom
        DC->setColor(w->borderColor);
        DC->drawTopBottom(w->rect.x, w->rect.y, w->rect.w, w->rect.h, w->borderSize);
        DC->setColor(NULL);
    } else if (w->border == WINDOW_BORDER_VERT) {
        // left right
        DC->setColor(w->borderColor);
        DC->drawSides(w->rect.x, w->rect.y, w->rect.w, w->rect.h, w->borderSize);
        DC->setColor(NULL);
    } else if (w->border == WINDOW_BORDER_KCGRADIENT) {
        // this is just two gradient bars along each horz edge
        rectDef_t r = w->rect;
        r.h = w->borderSize;
        GradientBar_Paint(&r, w->borderColor);
        r.y = w->rect.y + w->rect.h - 1;
        GradientBar_Paint(&r, w->borderColor);
    }
}

static void Item_SetScreenCoords(itemDef_t* item, float x, float y)
{

    if (item == NULL) {
        return;
    }

    if (item->window.border != 0) {
        x += item->window.borderSize;
        y += item->window.borderSize;
    }

    item->window.rect.x = x + item->window.rectClient.x;
    item->window.rect.y = y + item->window.rectClient.y;
    item->window.rect.w = item->window.rectClient.w;
    item->window.rect.h = item->window.rectClient.h;

    // force the text rects to recompute
    item->textRect.w = 0;
    item->textRect.h = 0;
}

// FIXME: consolidate this with nearby stuff
static void Item_UpdatePosition(itemDef_t* item)
{
    float x, y;
    menuDef_t* menu;

    if (item == NULL || item->parent == NULL) {
        return;
    }

    menu = item->parent;

    x = menu->window.rect.x;
    y = menu->window.rect.y;

    if (menu->window.border != 0) {
        x += menu->window.borderSize;
        y += menu->window.borderSize;
    }

    Item_SetScreenCoords(item, x, y);
}

// menus
static void Menu_UpdatePosition(menuDef_t* menu)
{
    int i;
    float x, y;

    if (menu == NULL) {
        return;
    }

    x = menu->window.rect.x;
    y = menu->window.rect.y;
    if (menu->window.border != 0) {
        x += menu->window.borderSize;
        y += menu->window.borderSize;
    }

    for (i = 0; i < menu->itemCount; i++) {
        Item_SetScreenCoords(menu->items[i], x, y);
    }
}

void Menu_PostParse(menuDef_t* menu)
{
    if (menu == NULL) {
        return;
    }
    if (menu->fullScreen) {
        menu->window.rect.x = 0;
        menu->window.rect.y = 0;
        menu->window.rect.w = 640;
        menu->window.rect.h = 480;
    }
    Menu_UpdatePosition(menu);
}

static itemDef_t* Menu_ClearFocus(menuDef_t* menu)
{
    int i;
    itemDef_t* ret = NULL;

    if (menu == NULL) {
        return NULL;
    }

    for (i = 0; i < menu->itemCount; i++) {
        if (menu->items[i]->window.flags & WINDOW_HASFOCUS) {
            ret = menu->items[i];
        }
        menu->items[i]->window.flags &= ~WINDOW_HASFOCUS;
        if (menu->items[i]->leaveFocus) {
            Item_RunScript(menu->items[i], menu->items[i]->leaveFocus);
        }
    }

    return ret;
}

static bool IsVisible(int flags)
{
    return (flags & WINDOW_VISIBLE && !(flags & WINDOW_FADINGOUT));
}

static bool Rect_ContainsPoint(rectDef_t* rect, float x, float y)
{
    if (rect) {
        if (x > rect->x && x < rect->x + rect->w && y > rect->y && y < rect->y + rect->h) {
            return true;
        }
    }
    return false;
}

static int Menu_ItemsMatchingGroup(menuDef_t* menu, const char* name)
{
    int i;
    int count = 0;
    for (i = 0; i < menu->itemCount; i++) {
        if (Q_stricmp(menu->items[i]->window.name, name) == 0 || (menu->items[i]->window.group && Q_stricmp(menu->items[i]->window.group, name) == 0)) {
            count++;
        }
    }
    return count;
}

static itemDef_t* Menu_GetMatchingItemByNumber(menuDef_t* menu, int index, const char* name)
{
    int i;
    int count = 0;
    for (i = 0; i < menu->itemCount; i++) {
        if (Q_stricmp(menu->items[i]->window.name, name) == 0 || (menu->items[i]->window.group && Q_stricmp(menu->items[i]->window.group, name) == 0)) {
            if (count == index) {
                return menu->items[i];
            }
            count++;
        }
    }
    return NULL;
}

static void Script_SetColor(itemDef_t* item, char** args)
{
    const char* name;
    int i;
    float f;
    vec4_t* out;
    // expecting type of color to set and 4 args for the color
    if (String_Parse(args, &name)) {
        out = NULL;
        if (Q_stricmp(name, "backcolor") == 0) {
            out = &item->window.backColor;
            item->window.flags |= WINDOW_BACKCOLORSET;
        } else if (Q_stricmp(name, "forecolor") == 0) {
            out = &item->window.foreColor;
            item->window.flags |= WINDOW_FORECOLORSET;
        } else if (Q_stricmp(name, "bordercolor") == 0) {
            out = &item->window.borderColor;
        }

        if (out) {
            for (i = 0; i < 4; i++) {
                if (!Float_Parse(args, &f)) {
                    return;
                }
                (*out)[i] = f;
            }
        }
    }
}

static void Script_SetAsset(itemDef_t* item, char** args)
{
    const char* name;
    // expecting name to set asset to
    if (String_Parse(args, &name)) {
        // check for a model
        if (item->type == ITEM_TYPE_MODEL) {
        }
    }
}

static void Script_SetBackground(itemDef_t* item, char** args)
{
    const char* name;
    // expecting name to set asset to
    if (String_Parse(args, &name)) {
        item->window.background = DC->registerShaderNoMip(name);
    }
}

static itemDef_t* Menu_FindItemByName(menuDef_t* menu, const char* p)
{
    int i;
    if (menu == NULL || p == NULL) {
        return NULL;
    }

    for (i = 0; i < menu->itemCount; i++) {
        if (Q_stricmp(p, menu->items[i]->window.name) == 0) {
            return menu->items[i];
        }
    }

    return NULL;
}

static void Script_SetTeamColor(itemDef_t* item, char** args)
{
    if (DC->getTeamColor) {
        int i;
        vec4_t color;
        DC->getTeamColor(&color);
        for (i = 0; i < 4; i++) {
            item->window.backColor[i] = color[i];
        }
    }
}

static void Script_SetItemColor(itemDef_t* item, char** args)
{
    const char* itemname;
    const char* name;
    vec4_t color;
    int i;
    vec4_t* out;
    // expecting type of color to set and 4 args for the color
    if (String_Parse(args, &itemname) && String_Parse(args, &name)) {
        itemDef_t* item2;
        int j;
        int count = Menu_ItemsMatchingGroup(item->parent, itemname);

        if (!Color_Parse(args, &color)) {
            return;
        }

        for (j = 0; j < count; j++) {
            item2 = Menu_GetMatchingItemByNumber(item->parent, j, itemname);
            if (item2 != NULL) {
                out = NULL;
                if (Q_stricmp(name, "backcolor") == 0) {
                    out = &item2->window.backColor;
                } else if (Q_stricmp(name, "forecolor") == 0) {
                    out = &item2->window.foreColor;
                    item2->window.flags |= WINDOW_FORECOLORSET;
                } else if (Q_stricmp(name, "bordercolor") == 0) {
                    out = &item2->window.borderColor;
                }

                if (out) {
                    for (i = 0; i < 4; i++) {
                        (*out)[i] = color[i];
                    }
                }
            }
        }
    }
}

static void Menu_ShowItemByName(menuDef_t* menu, const char* p, bool bShow)
{
    itemDef_t* item;
    int i;
    int count = Menu_ItemsMatchingGroup(menu, p);
    for (i = 0; i < count; i++) {
        item = Menu_GetMatchingItemByNumber(menu, i, p);
        if (item != NULL) {
            if (bShow) {
                item->window.flags |= WINDOW_VISIBLE;
            } else {
                item->window.flags &= ~WINDOW_VISIBLE;
                // stop cinematics playing in the window
                if (item->window.cinematic >= 0) {
                    DC->stopCinematic(item->window.cinematic);
                    item->window.cinematic = -1;
                }
            }
        }
    }
}

static void Menu_FadeItemByName(menuDef_t* menu, const char* p, bool fadeOut)
{
    itemDef_t* item;
    int i;
    int count = Menu_ItemsMatchingGroup(menu, p);
    for (i = 0; i < count; i++) {
        item = Menu_GetMatchingItemByNumber(menu, i, p);
        if (item != NULL) {
            if (fadeOut) {
                item->window.flags |= (WINDOW_FADINGOUT | WINDOW_VISIBLE);
                item->window.flags &= ~WINDOW_FADINGIN;
            } else {
                item->window.flags |= (WINDOW_VISIBLE | WINDOW_FADINGIN);
                item->window.flags &= ~WINDOW_FADINGOUT;
            }
        }
    }
}

menuDef_t* Menus_FindByName(const char* p)
{
    int i;
    for (i = 0; i < menuCount; i++) {
        if (Q_stricmp(Menus[i].window.name, p) == 0) {
            return &Menus[i];
        }
    }
    return NULL;
}

void Menus_OpenByName(const char* p)
{
    Menus_ActivateByName(p);
}

static void Menu_RunCloseScript(menuDef_t* menu)
{
    if (menu && menu->window.flags & WINDOW_VISIBLE && menu->onClose) {
        itemDef_t item;
        item.parent = menu;
        Item_RunScript(&item, menu->onClose);
    }
}

void Menus_CloseByName(const char* p)
{
    menuDef_t* menu = Menus_FindByName(p);
    if (menu != NULL) {
        Menu_RunCloseScript(menu);
        menu->window.flags &= ~(WINDOW_VISIBLE | WINDOW_HASFOCUS);
    }
}

void Menus_CloseAll()
{
    int i;
    for (i = 0; i < menuCount; i++) {
        Menu_RunCloseScript(&Menus[i]);
        Menus[i].window.flags &= ~(WINDOW_HASFOCUS | WINDOW_VISIBLE);
    }
}

static void Script_Show(itemDef_t* item, char** args)
{
    const char* name;
    if (String_Parse(args, &name)) {
        Menu_ShowItemByName(item->parent, name, true);
    }
}

static void Script_Hide(itemDef_t* item, char** args)
{
    const char* name;
    if (String_Parse(args, &name)) {
        Menu_ShowItemByName(item->parent, name, false);
    }
}

static void Script_FadeIn(itemDef_t* item, char** args)
{
    const char* name;
    if (String_Parse(args, &name)) {
        Menu_FadeItemByName(item->parent, name, false);
    }
}

static void Script_FadeOut(itemDef_t* item, char** args)
{
    const char* name;
    if (String_Parse(args, &name)) {
        Menu_FadeItemByName(item->parent, name, true);
    }
}

static void Script_Open(itemDef_t* item, char** args)
{
    const char* name;
    if (String_Parse(args, &name)) {
        Menus_OpenByName(name);
    }
}

static void Script_ConditionalOpen(itemDef_t* item, char** args)
{
    const char* cvar;
    const char* name1;
    const char* name2;
    float val;

    if (String_Parse(args, &cvar) && String_Parse(args, &name1) && String_Parse(args, &name2)) {
        val = DC->getCVarValue(cvar);
        if (val == 0.f) {
            Menus_OpenByName(name2);
        } else {
            Menus_OpenByName(name1);
        }
    }
}

static void Script_Close(itemDef_t* item, char** args)
{
    const char* name;
    if (String_Parse(args, &name)) {
        Menus_CloseByName(name);
    }
}

static void Menu_TransitionItemByName(menuDef_t* menu, const char* p, rectDef_t rectFrom, rectDef_t rectTo, int time, float amt)
{
    itemDef_t* item;
    int i;
    int count = Menu_ItemsMatchingGroup(menu, p);
    for (i = 0; i < count; i++) {
        item = Menu_GetMatchingItemByNumber(menu, i, p);
        if (item != NULL) {
            item->window.flags |= (WINDOW_INTRANSITION | WINDOW_VISIBLE);
            item->window.offsetTime = time;
            memcpy(&item->window.rectClient, &rectFrom, sizeof(rectDef_t));
            memcpy(&item->window.rectEffects, &rectTo, sizeof(rectDef_t));
            item->window.rectEffects2.x = fabs(rectTo.x - rectFrom.x) / amt;
            item->window.rectEffects2.y = fabs(rectTo.y - rectFrom.y) / amt;
            item->window.rectEffects2.w = fabs(rectTo.w - rectFrom.w) / amt;
            item->window.rectEffects2.h = fabs(rectTo.h - rectFrom.h) / amt;
            Item_UpdatePosition(item);
        }
    }
}

static void Script_Transition(itemDef_t* item, char** args)
{
    const char* name;
    rectDef_t rectFrom, rectTo;
    int time;
    float amt;

    if (String_Parse(args, &name)) {
        if (Rect_Parse(args, &rectFrom) && Rect_Parse(args, &rectTo) && Int_Parse(args, &time) && Float_Parse(args, &amt)) {
            Menu_TransitionItemByName(item->parent, name, rectFrom, rectTo, time, amt);
        }
    }
}

static void Menu_OrbitItemByName(menuDef_t* menu, const char* p, float x, float y, float cx, float cy, int time)
{
    itemDef_t* item;
    int i;
    int count = Menu_ItemsMatchingGroup(menu, p);
    for (i = 0; i < count; i++) {
        item = Menu_GetMatchingItemByNumber(menu, i, p);
        if (item != NULL) {
            item->window.flags |= (WINDOW_ORBITING | WINDOW_VISIBLE);
            item->window.offsetTime = time;
            item->window.rectEffects.x = cx;
            item->window.rectEffects.y = cy;
            item->window.rectClient.x = x;
            item->window.rectClient.y = y;
            Item_UpdatePosition(item);
        }
    }
}

static void Script_Orbit(itemDef_t* item, char** args)
{
    const char* name;
    float cx, cy, x, y;
    int time;

    if (String_Parse(args, &name)) {
        if (Float_Parse(args, &x) && Float_Parse(args, &y) && Float_Parse(args, &cx) && Float_Parse(args, &cy) && Int_Parse(args, &time)) {
            Menu_OrbitItemByName(item->parent, name, x, y, cx, cy, time);
        }
    }
}

static void Script_SetFocus(itemDef_t* item, char** args)
{
    const char* name;
    itemDef_t* focusItem;

    if (String_Parse(args, &name)) {
        focusItem = Menu_FindItemByName(item->parent, name);
        if (focusItem && !(focusItem->window.flags & WINDOW_DECORATION) && !(focusItem->window.flags & WINDOW_HASFOCUS)) {
            Menu_ClearFocus(item->parent);
            focusItem->window.flags |= WINDOW_HASFOCUS;
            if (focusItem->onFocus) {
                Item_RunScript(focusItem, focusItem->onFocus);
            }
            if (DC->Assets.itemFocusSound) {
                DC->startLocalSound(DC->Assets.itemFocusSound, CHAN_LOCAL_SOUND);
            }
        }
    }
}

static void Script_SetPlayerModel(itemDef_t* item, char** args)
{
    const char* name;
    if (String_Parse(args, &name)) {
        DC->setCVar("team_model", name);
    }
}

static void Script_SetPlayerHead(itemDef_t* item, char** args)
{
    const char* name;
    if (String_Parse(args, &name)) {
        DC->setCVar("team_headmodel", name);
    }
}

static void Script_SetCvar(itemDef_t* item, char** args)
{
    const char *cvar, *val;
    if (String_Parse(args, &cvar) && String_Parse(args, &val)) {
        DC->setCVar(cvar, val);
    }
}

static void Script_Exec(itemDef_t* item, char** args)
{
    const char* val;
    if (String_Parse(args, &val)) {
        DC->executeText(EXEC_APPEND, va("%s ; ", val));
    }
}

static void Script_Play(itemDef_t* item, char** args)
{
    const char* val;
    if (String_Parse(args, &val)) {
        DC->startLocalSound(DC->registerSound(val, false), CHAN_LOCAL_SOUND);
    }
}

static void Script_playLooped(itemDef_t* item, char** args)
{
    const char* val;
    if (String_Parse(args, &val)) {
        DC->stopBackgroundTrack();
        DC->startBackgroundTrack(val, val);
    }
}

commandDef_t commandList[] = {
    { "fadein", &Script_FadeIn }, // group/name
    { "fadeout", &Script_FadeOut }, // group/name
    { "show", &Script_Show }, // group/name
    { "hide", &Script_Hide }, // group/name
    { "setcolor", &Script_SetColor }, // works on this
    { "open", &Script_Open }, // menu
    { "conditionalopen", &Script_ConditionalOpen }, // menu
    { "close", &Script_Close }, // menu
    { "setasset", &Script_SetAsset }, // works on this
    { "setbackground", &Script_SetBackground }, // works on this
    { "setitemcolor", &Script_SetItemColor }, // group/name
    { "setteamcolor", &Script_SetTeamColor }, // sets this background color to team color
    { "setfocus", &Script_SetFocus }, // sets this background color to team color
    { "setplayermodel", &Script_SetPlayerModel }, // sets this background color to team color
    { "setplayerhead", &Script_SetPlayerHead }, // sets this background color to team color
    { "transition", &Script_Transition }, // group/name
    { "setcvar", &Script_SetCvar }, // group/name
    { "exec", &Script_Exec }, // group/name
    { "play", &Script_Play }, // group/name
    { "playlooped", &Script_playLooped }, // group/name
    { "orbit", &Script_Orbit } // group/name
};

int scriptCommandCount = ARRAY_LEN(commandList);

void Item_RunScript(itemDef_t* item, const char* s)
{
    char script[1024], *p;
    int i;
    bool bRan;
    memset(script, 0, sizeof(script));
    if (item && s && s[0]) {
        Q_strcat(script, 1024, s);
        p = script;
        while (1) {
            const char* command;
            // expect command then arguments, ; ends command, NULL ends script
            if (!String_Parse(&p, &command)) {
                return;
            }

            if (command[0] == ';' && command[1] == '\0') {
                continue;
            }

            bRan = false;
            for (i = 0; i < scriptCommandCount; i++) {
                if (Q_stricmp(command, commandList[i].name) == 0) {
                    (commandList[i].handler(item, &p));
                    bRan = true;
                    break;
                }
            }
            // not in our auto list, pass to handler
            if (!bRan) {
                DC->runScript(&p);
            }
        }
    }
}

static bool Item_EnableShowViaCvar(itemDef_t* item, int flag)
{
    char script[1024], *p;
    memset(script, 0, sizeof(script));
    if (item && item->enableCvar && *item->enableCvar && item->cvarTest && *item->cvarTest) {
        char buff[1024];
        DC->getCVarString(item->cvarTest, buff, sizeof(buff));

        Q_strcat(script, 1024, item->enableCvar);
        p = script;
        while (1) {
            const char* val;
            // expect value then ; or NULL, NULL ends list
            if (!String_Parse(&p, &val)) {
                return (item->cvarFlags & flag) ? false : true;
            }

            if (val[0] == ';' && val[1] == '\0') {
                continue;
            }

            // enable it if any of the values are true
            if (item->cvarFlags & flag) {
                if (Q_stricmp(buff, val) == 0) {
                    return true;
                }
            } else {
                // disable it if any of the values are true
                if (Q_stricmp(buff, val) == 0) {
                    return false;
                }
            }
        }
        return (item->cvarFlags & flag) ? false : true;
    }
    return true;
}

// will optionaly set focus to this item
static bool Item_SetFocus(itemDef_t* item, float x, float y)
{
    int i;
    itemDef_t* oldFocus;
    sfxHandle_t* sfx = &DC->Assets.itemFocusSound;
    bool playSound = false;
    menuDef_t* parent;
    // sanity check, non-null, not a decoration and does not already have the focus
    if (item == NULL || item->window.flags & WINDOW_DECORATION || item->window.flags & WINDOW_HASFOCUS || !(item->window.flags & WINDOW_VISIBLE)) {
        return false;
    }

    // this can be NULL
    parent = (menuDef_t*)item->parent;

    // items can be enabled and disabled based on cvars
    if (item->cvarFlags & (CVAR_ENABLE | CVAR_DISABLE) && !Item_EnableShowViaCvar(item, CVAR_ENABLE)) {
        return false;
    }

    if (item->cvarFlags & (CVAR_SHOW | CVAR_HIDE) && !Item_EnableShowViaCvar(item, CVAR_SHOW)) {
        return false;
    }

    oldFocus = Menu_ClearFocus(item->parent);

    if (item->type == ITEM_TYPE_TEXT) {
        rectDef_t r;
        r = item->textRect;
        r.y -= r.h;
        if (Rect_ContainsPoint(&r, x, y)) {
            item->window.flags |= WINDOW_HASFOCUS;
            if (item->focusSound) {
                sfx = &item->focusSound;
            }
            playSound = true;
        } else {
            if (oldFocus) {
                oldFocus->window.flags |= WINDOW_HASFOCUS;
                if (oldFocus->onFocus) {
                    Item_RunScript(oldFocus, oldFocus->onFocus);
                }
            }
        }
    } else {
        item->window.flags |= WINDOW_HASFOCUS;
        if (item->onFocus) {
            Item_RunScript(item, item->onFocus);
        }
        if (item->focusSound) {
            sfx = &item->focusSound;
        }
        playSound = true;
    }

    if (playSound && sfx) {
        DC->startLocalSound(*sfx, CHAN_LOCAL_SOUND);
    }

    for (i = 0; i < parent->itemCount; i++) {
        if (parent->items[i] == item) {
            parent->cursorItem = i;
            break;
        }
    }

    return true;
}

static int Item_ListBox_MaxScroll(itemDef_t* item)
{
    listBoxDef_t* listPtr = (listBoxDef_t*)item->typeData;
    int count = DC->feederCount(item->special);
    int max;

    if (item->window.flags & WINDOW_HORIZONTAL) {
        max = count - (item->window.rect.w / listPtr->elementWidth) + 1;
    } else {
        max = count - (item->window.rect.h / listPtr->elementHeight) + 1;
    }
    if (max < 0) {
        return 0;
    }
    return max;
}

static int Item_ListBox_ThumbPosition(itemDef_t* item)
{
    float max, pos, size;
    listBoxDef_t* listPtr = (listBoxDef_t*)item->typeData;

    max = Item_ListBox_MaxScroll(item);
    if (item->window.flags & WINDOW_HORIZONTAL) {
        size = item->window.rect.w - (SCROLLBAR_SIZE * 2) - 2;
        if (max > 0) {
            pos = (size - SCROLLBAR_SIZE) / (float)max;
        } else {
            pos = 0;
        }
        pos *= listPtr->startPos;
        return item->window.rect.x + 1 + SCROLLBAR_SIZE + pos;
    } else {
        size = item->window.rect.h - (SCROLLBAR_SIZE * 2) - 2;
        if (max > 0) {
            pos = (size - SCROLLBAR_SIZE) / (float)max;
        } else {
            pos = 0;
        }
        pos *= listPtr->startPos;
        return item->window.rect.y + 1 + SCROLLBAR_SIZE + pos;
    }
}

static int Item_ListBox_ThumbDrawPosition(itemDef_t* item)
{
    int min, max;

    if (itemCapture == item) {
        if (item->window.flags & WINDOW_HORIZONTAL) {
            min = item->window.rect.x + SCROLLBAR_SIZE + 1;
            max = item->window.rect.x + item->window.rect.w - 2 * SCROLLBAR_SIZE - 1;
            if (DC->cursorx >= min + SCROLLBAR_SIZE / 2 && DC->cursorx <= max + SCROLLBAR_SIZE / 2) {
                return DC->cursorx - SCROLLBAR_SIZE / 2;
            } else {
                return Item_ListBox_ThumbPosition(item);
            }
        } else {
            min = item->window.rect.y + SCROLLBAR_SIZE + 1;
            max = item->window.rect.y + item->window.rect.h - 2 * SCROLLBAR_SIZE - 1;
            if (DC->cursory >= min + SCROLLBAR_SIZE / 2 && DC->cursory <= max + SCROLLBAR_SIZE / 2) {
                return DC->cursory - SCROLLBAR_SIZE / 2;
            } else {
                return Item_ListBox_ThumbPosition(item);
            }
        }
    } else {
        return Item_ListBox_ThumbPosition(item);
    }
}

static float Item_Slider_ThumbPosition(itemDef_t* item)
{
    float value, range, x;
    editFieldDef_t* editDef = item->typeData;

    if (item->text) {
        x = item->textRect.x + item->textRect.w + 8;
    } else {
        x = item->window.rect.x;
    }

    if (!editDef || !item->cvar) {
        return x;
    }

    value = DC->getCVarValue(item->cvar);

    if (value < editDef->minVal) {
        value = editDef->minVal;
    } else if (value > editDef->maxVal) {
        value = editDef->maxVal;
    }

    range = editDef->maxVal - editDef->minVal;
    value -= editDef->minVal;
    value /= range;
    // value /= (editDef->maxVal - editDef->minVal);
    value *= SLIDER_WIDTH;
    x += value;
    // vm fuckage
    // x = x + (((float)value / editDef->maxVal) * SLIDER_WIDTH);
    return x;
}

static int Item_Slider_OverSlider(itemDef_t* item, float x, float y)
{
    rectDef_t r;

    r.x = Item_Slider_ThumbPosition(item) - (SLIDER_THUMB_WIDTH / 2);
    r.y = item->window.rect.y - 2;
    r.w = SLIDER_THUMB_WIDTH;
    r.h = SLIDER_THUMB_HEIGHT;

    if (Rect_ContainsPoint(&r, x, y)) {
        return WINDOW_LB_THUMB;
    }
    return 0;
}

static int Item_ListBox_OverLB(itemDef_t* item, float x, float y)
{
    rectDef_t r;
    int thumbstart;

    if (item->window.flags & WINDOW_HORIZONTAL) {
        // check if on left arrow
        r.x = item->window.rect.x;
        r.y = item->window.rect.y + item->window.rect.h - SCROLLBAR_SIZE;
        r.h = r.w = SCROLLBAR_SIZE;
        if (Rect_ContainsPoint(&r, x, y)) {
            return WINDOW_LB_LEFTARROW;
        }
        // check if on right arrow
        r.x = item->window.rect.x + item->window.rect.w - SCROLLBAR_SIZE;
        if (Rect_ContainsPoint(&r, x, y)) {
            return WINDOW_LB_RIGHTARROW;
        }
        // check if on thumb
        thumbstart = Item_ListBox_ThumbPosition(item);
        r.x = thumbstart;
        if (Rect_ContainsPoint(&r, x, y)) {
            return WINDOW_LB_THUMB;
        }
        r.x = item->window.rect.x + SCROLLBAR_SIZE;
        r.w = thumbstart - r.x;
        if (Rect_ContainsPoint(&r, x, y)) {
            return WINDOW_LB_PGUP;
        }
        r.x = thumbstart + SCROLLBAR_SIZE;
        r.w = item->window.rect.x + item->window.rect.w - SCROLLBAR_SIZE;
        if (Rect_ContainsPoint(&r, x, y)) {
            return WINDOW_LB_PGDN;
        }
    } else {
        r.x = item->window.rect.x + item->window.rect.w - SCROLLBAR_SIZE;
        r.y = item->window.rect.y;
        r.h = r.w = SCROLLBAR_SIZE;
        if (Rect_ContainsPoint(&r, x, y)) {
            return WINDOW_LB_LEFTARROW;
        }
        r.y = item->window.rect.y + item->window.rect.h - SCROLLBAR_SIZE;
        if (Rect_ContainsPoint(&r, x, y)) {
            return WINDOW_LB_RIGHTARROW;
        }
        thumbstart = Item_ListBox_ThumbPosition(item);
        r.y = thumbstart;
        if (Rect_ContainsPoint(&r, x, y)) {
            return WINDOW_LB_THUMB;
        }
        r.y = item->window.rect.y + SCROLLBAR_SIZE;
        r.h = thumbstart - r.y;
        if (Rect_ContainsPoint(&r, x, y)) {
            return WINDOW_LB_PGUP;
        }
        r.y = thumbstart + SCROLLBAR_SIZE;
        r.h = item->window.rect.y + item->window.rect.h - SCROLLBAR_SIZE;
        if (Rect_ContainsPoint(&r, x, y)) {
            return WINDOW_LB_PGDN;
        }
    }
    return 0;
}

static void Item_ListBox_MouseEnter(itemDef_t* item, float x, float y)
{
    rectDef_t r;
    listBoxDef_t* listPtr = (listBoxDef_t*)item->typeData;

    item->window.flags &= ~(WINDOW_LB_LEFTARROW | WINDOW_LB_RIGHTARROW | WINDOW_LB_THUMB | WINDOW_LB_PGUP | WINDOW_LB_PGDN);
    item->window.flags |= Item_ListBox_OverLB(item, x, y);

    if (item->window.flags & WINDOW_HORIZONTAL) {
        if (!(item->window.flags & (WINDOW_LB_LEFTARROW | WINDOW_LB_RIGHTARROW | WINDOW_LB_THUMB | WINDOW_LB_PGUP | WINDOW_LB_PGDN))) {
            // check for selection hit as we have exausted buttons and thumb
            if (listPtr->elementStyle == LISTBOX_IMAGE) {
                r.x = item->window.rect.x;
                r.y = item->window.rect.y;
                r.h = item->window.rect.h - SCROLLBAR_SIZE;
                r.w = item->window.rect.w - listPtr->drawPadding;
                if (Rect_ContainsPoint(&r, x, y)) {
                    listPtr->cursorPos = (int)((x - r.x) / listPtr->elementWidth) + listPtr->startPos;
                    if (listPtr->cursorPos >= listPtr->endPos) {
                        listPtr->cursorPos = listPtr->endPos;
                    }
                }
            } else {
                // text hit..
            }
        }
    } else if (!(item->window.flags & (WINDOW_LB_LEFTARROW | WINDOW_LB_RIGHTARROW | WINDOW_LB_THUMB | WINDOW_LB_PGUP | WINDOW_LB_PGDN))) {
        r.x = item->window.rect.x;
        r.y = item->window.rect.y;
        r.w = item->window.rect.w - SCROLLBAR_SIZE;
        r.h = item->window.rect.h - listPtr->drawPadding;
        if (Rect_ContainsPoint(&r, x, y)) {
            listPtr->cursorPos = (int)((y - 2 - r.y) / listPtr->elementHeight) + listPtr->startPos;
            if (listPtr->cursorPos > listPtr->endPos) {
                listPtr->cursorPos = listPtr->endPos;
            }
        }
    }
}

static void Item_MouseEnter(itemDef_t* item, float x, float y)
{
    rectDef_t r;
    if (item) {
        r = item->textRect;
        r.y -= r.h;
        // in the text rect?

        // items can be enabled and disabled based on cvars
        if (item->cvarFlags & (CVAR_ENABLE | CVAR_DISABLE) && !Item_EnableShowViaCvar(item, CVAR_ENABLE)) {
            return;
        }

        if (item->cvarFlags & (CVAR_SHOW | CVAR_HIDE) && !Item_EnableShowViaCvar(item, CVAR_SHOW)) {
            return;
        }

        if (Rect_ContainsPoint(&r, x, y)) {
            if (!(item->window.flags & WINDOW_MOUSEOVERTEXT)) {
                Item_RunScript(item, item->mouseEnterText);
                item->window.flags |= WINDOW_MOUSEOVERTEXT;
            }
            if (!(item->window.flags & WINDOW_MOUSEOVER)) {
                Item_RunScript(item, item->mouseEnter);
                item->window.flags |= WINDOW_MOUSEOVER;
            }

        } else {
            // not in the text rect
            if (item->window.flags & WINDOW_MOUSEOVERTEXT) {
                // if we were
                Item_RunScript(item, item->mouseExitText);
                item->window.flags &= ~WINDOW_MOUSEOVERTEXT;
            }
            if (!(item->window.flags & WINDOW_MOUSEOVER)) {
                Item_RunScript(item, item->mouseEnter);
                item->window.flags |= WINDOW_MOUSEOVER;
            }

            if (item->type == ITEM_TYPE_LISTBOX) {
                Item_ListBox_MouseEnter(item, x, y);
            }
        }
    }
}

static void Item_MouseLeave(itemDef_t* item)
{
    if (item) {
        if (item->window.flags & WINDOW_MOUSEOVERTEXT) {
            Item_RunScript(item, item->mouseExitText);
            item->window.flags &= ~WINDOW_MOUSEOVERTEXT;
        }
        Item_RunScript(item, item->mouseExit);
        item->window.flags &= ~(WINDOW_LB_RIGHTARROW | WINDOW_LB_LEFTARROW);
    }
}

static void Item_SetMouseOver(itemDef_t* item, bool focus)
{
    if (item) {
        if (focus) {
            item->window.flags |= WINDOW_MOUSEOVER;
        } else {
            item->window.flags &= ~WINDOW_MOUSEOVER;
        }
    }
}

static bool Item_OwnerDraw_HandleKey(itemDef_t* item, int key)
{
    if (item && DC->ownerDrawHandleKey) {
        return DC->ownerDrawHandleKey(item->window.ownerDraw, item->window.ownerDrawFlags, &item->special, key);
    }
    return false;
}

static bool Item_ListBox_HandleKey(itemDef_t* item, int key, bool down, bool force)
{
    listBoxDef_t* listPtr = (listBoxDef_t*)item->typeData;
    int count = DC->feederCount(item->special);
    int max, viewmax;

    if (force || (Rect_ContainsPoint(&item->window.rect, DC->cursorx, DC->cursory) && item->window.flags & WINDOW_HASFOCUS)) {
        max = Item_ListBox_MaxScroll(item);
        if (item->window.flags & WINDOW_HORIZONTAL) {
            viewmax = (item->window.rect.w / listPtr->elementWidth);
            if (key == K_LEFTARROW || key == K_KP_LEFTARROW) {
                if (!listPtr->notselectable) {
                    listPtr->cursorPos--;
                    if (listPtr->cursorPos < 0) {
                        listPtr->cursorPos = 0;
                    }
                    if (listPtr->cursorPos < listPtr->startPos) {
                        listPtr->startPos = listPtr->cursorPos;
                    }
                    if (listPtr->cursorPos >= listPtr->startPos + viewmax) {
                        listPtr->startPos = listPtr->cursorPos - viewmax + 1;
                    }
                    item->cursorPos = listPtr->cursorPos;
                    DC->feederSelection(item->special, item->cursorPos);
                } else {
                    listPtr->startPos--;
                    if (listPtr->startPos < 0)
                        listPtr->startPos = 0;
                }
                return true;
            }
            if (key == K_RIGHTARROW || key == K_KP_RIGHTARROW) {
                if (!listPtr->notselectable) {
                    listPtr->cursorPos++;
                    if (listPtr->cursorPos < listPtr->startPos) {
                        listPtr->startPos = listPtr->cursorPos;
                    }
                    if (listPtr->cursorPos >= count) {
                        listPtr->cursorPos = count - 1;
                    }
                    if (listPtr->cursorPos >= listPtr->startPos + viewmax) {
                        listPtr->startPos = listPtr->cursorPos - viewmax + 1;
                    }
                    item->cursorPos = listPtr->cursorPos;
                    DC->feederSelection(item->special, item->cursorPos);
                } else {
                    listPtr->startPos++;
                    if (listPtr->startPos >= count)
                        listPtr->startPos = count - 1;
                }
                return true;
            }
        } else {
            viewmax = (item->window.rect.h / listPtr->elementHeight);
            if (key == K_UPARROW || key == K_KP_UPARROW) {
                if (!listPtr->notselectable) {
                    listPtr->cursorPos--;
                    if (listPtr->cursorPos < 0) {
                        listPtr->cursorPos = 0;
                    }
                    if (listPtr->cursorPos < listPtr->startPos) {
                        listPtr->startPos = listPtr->cursorPos;
                    }
                    if (listPtr->cursorPos >= listPtr->startPos + viewmax) {
                        listPtr->startPos = listPtr->cursorPos - viewmax + 1;
                    }
                    item->cursorPos = listPtr->cursorPos;
                    DC->feederSelection(item->special, item->cursorPos);
                } else {
                    listPtr->startPos--;
                    if (listPtr->startPos < 0)
                        listPtr->startPos = 0;
                }
                return true;
            }
            if (key == K_DOWNARROW || key == K_KP_DOWNARROW) {
                if (!listPtr->notselectable) {
                    listPtr->cursorPos++;
                    if (listPtr->cursorPos < listPtr->startPos) {
                        listPtr->startPos = listPtr->cursorPos;
                    }
                    if (listPtr->cursorPos >= count) {
                        listPtr->cursorPos = count - 1;
                    }
                    if (listPtr->cursorPos >= listPtr->startPos + viewmax) {
                        listPtr->startPos = listPtr->cursorPos - viewmax + 1;
                    }
                    item->cursorPos = listPtr->cursorPos;
                    DC->feederSelection(item->special, item->cursorPos);
                } else {
                    listPtr->startPos++;
                    if (listPtr->startPos > max)
                        listPtr->startPos = max;
                }
                return true;
            }
        }

        // Use mouse wheel in vertical and horizontal menus.
        // If scrolling 3 items would replace over half of the
        // displayed items, only scroll 1 item at a time.
        if (key == K_MWHEELUP) {
            int scroll = viewmax < 6 ? 1 : 3;
            listPtr->startPos -= scroll;
            if (listPtr->startPos < 0) {
                listPtr->startPos = 0;
            }
            return true;
        }
        if (key == K_MWHEELDOWN) {
            int scroll = viewmax < 6 ? 1 : 3;
            listPtr->startPos += scroll;
            if (listPtr->startPos > max) {
                listPtr->startPos = max;
            }
            return true;
        }

        // mouse hit
        if (key == K_MOUSE1 || key == K_MOUSE2) {
            if (item->window.flags & WINDOW_LB_LEFTARROW) {
                listPtr->startPos--;
                if (listPtr->startPos < 0) {
                    listPtr->startPos = 0;
                }
            } else if (item->window.flags & WINDOW_LB_RIGHTARROW) {
                // one down
                listPtr->startPos++;
                if (listPtr->startPos > max) {
                    listPtr->startPos = max;
                }
            } else if (item->window.flags & WINDOW_LB_PGUP) {
                // page up
                listPtr->startPos -= viewmax;
                if (listPtr->startPos < 0) {
                    listPtr->startPos = 0;
                }
            } else if (item->window.flags & WINDOW_LB_PGDN) {
                // page down
                listPtr->startPos += viewmax;
                if (listPtr->startPos > max) {
                    listPtr->startPos = max;
                }
            } else if (item->window.flags & WINDOW_LB_THUMB) {
                // Display_SetCaptureItem(item);
            } else {
                // select an item
                if (DC->realTime < lastListBoxClickTime && listPtr->doubleClick) {
                    Item_RunScript(item, listPtr->doubleClick);
                }
                lastListBoxClickTime = DC->realTime + DOUBLE_CLICK_DELAY;
                if (item->cursorPos != listPtr->cursorPos) {
                    item->cursorPos = listPtr->cursorPos;
                    DC->feederSelection(item->special, item->cursorPos);
                }
            }
            return true;
        }
        if (key == K_HOME || key == K_KP_HOME) {
            // home
            listPtr->startPos = 0;
            return true;
        }
        if (key == K_END || key == K_KP_END) {
            // end
            listPtr->startPos = max;
            return true;
        }
        if (key == K_PGUP || key == K_KP_PGUP) {
            // page up
            if (!listPtr->notselectable) {
                listPtr->cursorPos -= viewmax;
                if (listPtr->cursorPos < 0) {
                    listPtr->cursorPos = 0;
                }
                if (listPtr->cursorPos < listPtr->startPos) {
                    listPtr->startPos = listPtr->cursorPos;
                }
                if (listPtr->cursorPos >= listPtr->startPos + viewmax) {
                    listPtr->startPos = listPtr->cursorPos - viewmax + 1;
                }
                item->cursorPos = listPtr->cursorPos;
                DC->feederSelection(item->special, item->cursorPos);
            } else {
                listPtr->startPos -= viewmax;
                if (listPtr->startPos < 0) {
                    listPtr->startPos = 0;
                }
            }
            return true;
        }
        if (key == K_PGDN || key == K_KP_PGDN) {
            // page down
            if (!listPtr->notselectable) {
                listPtr->cursorPos += viewmax;
                if (listPtr->cursorPos < listPtr->startPos) {
                    listPtr->startPos = listPtr->cursorPos;
                }
                if (listPtr->cursorPos >= count) {
                    listPtr->cursorPos = count - 1;
                }
                if (listPtr->cursorPos >= listPtr->startPos + viewmax) {
                    listPtr->startPos = listPtr->cursorPos - viewmax + 1;
                }
                item->cursorPos = listPtr->cursorPos;
                DC->feederSelection(item->special, item->cursorPos);
            } else {
                listPtr->startPos += viewmax;
                if (listPtr->startPos > max) {
                    listPtr->startPos = max;
                }
            }
            return true;
        }
    }
    return false;
}

static bool Item_YesNo_HandleKey(itemDef_t* item, int key)
{

    if (item->cvar) {
        bool action = false;
        if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_MOUSE3) {
            if (Rect_ContainsPoint(&item->window.rect, DC->cursorx, DC->cursory) && item->window.flags & WINDOW_HASFOCUS) {
                action = true;
            }
        } else if (UI_SelectForKey(key) != 0) {
            action = true;
        }
        if (action) {
            DC->setCVar(item->cvar, va("%i", !DC->getCVarValue(item->cvar)));
            return true;
        }
    }

    return false;
}

static int Item_Multi_CountSettings(itemDef_t* item)
{
    multiDef_t* multiPtr = (multiDef_t*)item->typeData;
    if (multiPtr == NULL) {
        return 0;
    }
    return multiPtr->count;
}

static int Item_Multi_FindCvarByValue(itemDef_t* item)
{
    char buff[1024];
    float value = 0;
    int i;
    multiDef_t* multiPtr = (multiDef_t*)item->typeData;
    if (multiPtr) {
        if (multiPtr->strDef) {
            DC->getCVarString(item->cvar, buff, sizeof(buff));
        } else {
            value = DC->getCVarValue(item->cvar);
        }
        for (i = 0; i < multiPtr->count; i++) {
            if (multiPtr->strDef) {
                if (Q_stricmp(buff, multiPtr->cvarStr[i]) == 0) {
                    return i;
                }
            } else {
                if (multiPtr->cvarValue[i] == value) {
                    return i;
                }
            }
        }
    }
    return 0;
}

static const char* Item_Multi_Setting(itemDef_t* item)
{
    char buff[1024];
    float value = 0;
    int i;
    multiDef_t* multiPtr = (multiDef_t*)item->typeData;
    if (multiPtr) {
        if (multiPtr->strDef) {
            DC->getCVarString(item->cvar, buff, sizeof(buff));
        } else {
            value = DC->getCVarValue(item->cvar);
        }
        for (i = 0; i < multiPtr->count; i++) {
            if (multiPtr->strDef) {
                if (Q_stricmp(buff, multiPtr->cvarStr[i]) == 0) {
                    return multiPtr->cvarList[i];
                }
            } else {
                if (multiPtr->cvarValue[i] == value) {
                    return multiPtr->cvarList[i];
                }
            }
        }
    }
    return "";
}

static bool Item_Multi_HandleKey(itemDef_t* item, int key)
{
    multiDef_t* multiPtr = (multiDef_t*)item->typeData;
    if (multiPtr) {
        if (item->cvar) {
            int select = 0;
            if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_MOUSE3) {
                if (Rect_ContainsPoint(&item->window.rect, DC->cursorx, DC->cursory) && item->window.flags & WINDOW_HASFOCUS) {
                    select = (key == K_MOUSE2) ? -1 : 1;
                }
            } else {
                select = UI_SelectForKey(key);
            }
            if (select != 0) {
                int current = Item_Multi_FindCvarByValue(item) + select;
                int max = Item_Multi_CountSettings(item);
                if (current < 0) {
                    current = max - 1;
                } else if (current >= max) {
                    current = 0;
                }

                if (multiPtr->videoMode) {
                    if (multiPtr->cvarValue[current] != -1) {
                        DC->setCVar("r_mode", va("%i", (int)multiPtr->cvarValue[current]));
                    } else {
                        int w, h;
                        char* x;
                        char str[8];

                        x = strchr(multiPtr->cvarStr[current], 'x') + 1;
                        Q_strncpyz(str, multiPtr->cvarStr[current], MIN(x - multiPtr->cvarStr[current], sizeof(str)));
                        w = atoi(str);
                        h = atoi(x);

                        DC->setCVar("r_mode", "-1");
                        DC->setCVar("r_customwidth", va("%i", w));
                        DC->setCVar("r_customheight", va("%i", h));
                    }
                }

                if (multiPtr->strDef) {
                    DC->setCVar(item->cvar, multiPtr->cvarStr[current]);
                } else {
                    float value = multiPtr->cvarValue[current];
                    if (((float)((int)value)) == value) {
                        DC->setCVar(item->cvar, va("%i", (int)value));
                    } else {
                        DC->setCVar(item->cvar, va("%f", value));
                    }
                }
                return true;
            }
        }
    }
    return false;
}

static bool Item_TextField_HandleKey(itemDef_t* item, int key)
{
    char buff[1024];
    int len;
    itemDef_t* newItem = NULL;
    editFieldDef_t* editPtr = (editFieldDef_t*)item->typeData;

    if (item->cvar) {

        memset(buff, 0, sizeof(buff));
        DC->getCVarString(item->cvar, buff, sizeof(buff));
        len = strlen(buff);
        if (editPtr->maxChars && len > editPtr->maxChars) {
            len = editPtr->maxChars;
        }
        if (key & K_CHAR_FLAG) {
            key &= ~K_CHAR_FLAG;

            if (key == 'h' - 'a' + 1) { // ctrl-h is backspace
                if (item->cursorPos > 0) {
                    memmove(&buff[item->cursorPos - 1], &buff[item->cursorPos], len + 1 - item->cursorPos);
                    item->cursorPos--;
                    if (item->cursorPos < editPtr->paintOffset) {
                        editPtr->paintOffset--;
                    }
                }
                DC->setCVar(item->cvar, buff);
                return true;
            }

            // ignore any non-printable chars
            if (key < 32 || !item->cvar) {
                return true;
            }

            if (item->type == ITEM_TYPE_NUMERICFIELD) {
                if (key < '0' || key > '9') {
                    return false;
                }
            }

            if (!DC->getOverstrikeMode()) {
                if ((len == MAX_EDITFIELD - 1) || (editPtr->maxChars && len >= editPtr->maxChars)) {
                    return true;
                }
                memmove(&buff[item->cursorPos + 1], &buff[item->cursorPos], len + 1 - item->cursorPos);
            } else {
                if (editPtr->maxChars && item->cursorPos >= editPtr->maxChars) {
                    return true;
                }
            }

            buff[item->cursorPos] = key;

            DC->setCVar(item->cvar, buff);

            if (item->cursorPos < len + 1) {
                item->cursorPos++;
                if (editPtr->maxPaintChars && item->cursorPos > editPtr->maxPaintChars) {
                    editPtr->paintOffset++;
                }
            }

        } else {

            if (key == K_DEL || key == K_KP_DEL) {
                if (item->cursorPos < len) {
                    memmove(buff + item->cursorPos, buff + item->cursorPos + 1, len - item->cursorPos);
                    DC->setCVar(item->cvar, buff);
                }
                return true;
            }

            if (key == K_RIGHTARROW || key == K_KP_RIGHTARROW) {
                if (editPtr->maxPaintChars && item->cursorPos >= editPtr->maxPaintChars && item->cursorPos < len) {
                    item->cursorPos++;
                    editPtr->paintOffset++;
                    return true;
                }
                if (item->cursorPos < len) {
                    item->cursorPos++;
                }
                return true;
            }

            if (key == K_LEFTARROW || key == K_KP_LEFTARROW) {
                if (item->cursorPos > 0) {
                    item->cursorPos--;
                }
                if (item->cursorPos < editPtr->paintOffset) {
                    editPtr->paintOffset--;
                }
                return true;
            }

            if (key == K_HOME || key == K_KP_HOME) { // || ( tolower(key) == 'a' && trap_Key_IsDown( K_CTRL ) ) ) {
                item->cursorPos = 0;
                editPtr->paintOffset = 0;
                return true;
            }

            if (key == K_END || key == K_KP_END) { // ( tolower(key) == 'e' && trap_Key_IsDown( K_CTRL ) ) ) {
                item->cursorPos = len;
                if (item->cursorPos > editPtr->maxPaintChars) {
                    editPtr->paintOffset = len - editPtr->maxPaintChars;
                }
                return true;
            }

            if (key == K_INS || key == K_KP_INS) {
                DC->setOverstrikeMode(!DC->getOverstrikeMode());
                return true;
            }
        }

        if (key == K_TAB || key == K_DOWNARROW || key == K_KP_DOWNARROW) {
            newItem = Menu_SetNextCursorItem(item->parent);
            if (newItem && (newItem->type == ITEM_TYPE_EDITFIELD || newItem->type == ITEM_TYPE_NUMERICFIELD)) {
                g_editItem = newItem;
            }
        }

        if (key == K_UPARROW || key == K_KP_UPARROW) {
            newItem = Menu_SetPrevCursorItem(item->parent);
            if (newItem && (newItem->type == ITEM_TYPE_EDITFIELD || newItem->type == ITEM_TYPE_NUMERICFIELD)) {
                g_editItem = newItem;
            }
        }

        if (key == K_ENTER || key == K_KP_ENTER || key == K_ESCAPE) {
            return false;
        }

        return true;
    }
    return false;
}

static void Scroll_ListBox_AutoFunc(void* p)
{
    scrollInfo_t* si = (scrollInfo_t*)p;
    if (DC->realTime > si->nextScrollTime) {
        // need to scroll which is done by simulating a click to the item
        // this is done a bit sideways as the autoscroll "knows" that the item is a listbox
        // so it calls it directly
        Item_ListBox_HandleKey(si->item, si->scrollKey, true, false);
        si->nextScrollTime = DC->realTime + si->adjustValue;
    }

    if (DC->realTime > si->nextAdjustTime) {
        si->nextAdjustTime = DC->realTime + SCROLL_TIME_ADJUST;
        if (si->adjustValue > SCROLL_TIME_FLOOR) {
            si->adjustValue -= SCROLL_TIME_ADJUSTOFFSET;
        }
    }
}

static void Scroll_ListBox_ThumbFunc(void* p)
{
    scrollInfo_t* si = (scrollInfo_t*)p;
    rectDef_t r;
    int pos, max;

    listBoxDef_t* listPtr = (listBoxDef_t*)si->item->typeData;
    if (si->item->window.flags & WINDOW_HORIZONTAL) {
        if (DC->cursorx == si->xStart) {
            return;
        }
        r.x = si->item->window.rect.x + SCROLLBAR_SIZE + 1;
        r.y = si->item->window.rect.y + si->item->window.rect.h - SCROLLBAR_SIZE - 1;
        r.h = SCROLLBAR_SIZE;
        r.w = si->item->window.rect.w - (SCROLLBAR_SIZE * 2) - 2;
        max = Item_ListBox_MaxScroll(si->item);
        pos = (DC->cursorx - r.x - SCROLLBAR_SIZE / 2) * max / (r.w - SCROLLBAR_SIZE);
        if (pos < 0) {
            pos = 0;
        } else if (pos > max) {
            pos = max;
        }
        listPtr->startPos = pos;
        si->xStart = DC->cursorx;
    } else if (DC->cursory != si->yStart) {

        r.x = si->item->window.rect.x + si->item->window.rect.w - SCROLLBAR_SIZE - 1;
        r.y = si->item->window.rect.y + SCROLLBAR_SIZE + 1;
        r.h = si->item->window.rect.h - (SCROLLBAR_SIZE * 2) - 2;
        r.w = SCROLLBAR_SIZE;
        max = Item_ListBox_MaxScroll(si->item);
        pos = (DC->cursory - r.y - SCROLLBAR_SIZE / 2) * max / (r.h - SCROLLBAR_SIZE);
        if (pos < 0) {
            pos = 0;
        } else if (pos > max) {
            pos = max;
        }
        listPtr->startPos = pos;
        si->yStart = DC->cursory;
    }

    if (DC->realTime > si->nextScrollTime) {
        // need to scroll which is done by simulating a click to the item
        // this is done a bit sideways as the autoscroll "knows" that the item is a listbox
        // so it calls it directly
        Item_ListBox_HandleKey(si->item, si->scrollKey, true, false);
        si->nextScrollTime = DC->realTime + si->adjustValue;
    }

    if (DC->realTime > si->nextAdjustTime) {
        si->nextAdjustTime = DC->realTime + SCROLL_TIME_ADJUST;
        if (si->adjustValue > SCROLL_TIME_FLOOR) {
            si->adjustValue -= SCROLL_TIME_ADJUSTOFFSET;
        }
    }
}

static void Scroll_Slider_ThumbFunc(void* p)
{
    float x, value, cursorx;
    scrollInfo_t* si = (scrollInfo_t*)p;
    editFieldDef_t* editDef = si->item->typeData;

    if (si->item->text) {
        x = si->item->textRect.x + si->item->textRect.w + 8;
    } else {
        x = si->item->window.rect.x;
    }

    cursorx = DC->cursorx;

    if (cursorx < x) {
        cursorx = x;
    } else if (cursorx > x + SLIDER_WIDTH) {
        cursorx = x + SLIDER_WIDTH;
    }
    value = cursorx - x;
    value /= SLIDER_WIDTH;
    value *= (editDef->maxVal - editDef->minVal);
    value += editDef->minVal;
    DC->setCVar(si->item->cvar, va("%f", value));
}

static void Item_StartCapture(itemDef_t* item, int key)
{
    int flags;
    switch (item->type) {
    case ITEM_TYPE_EDITFIELD:
    case ITEM_TYPE_NUMERICFIELD:

    case ITEM_TYPE_LISTBOX: {
        flags = Item_ListBox_OverLB(item, DC->cursorx, DC->cursory);
        if (flags & (WINDOW_LB_LEFTARROW | WINDOW_LB_RIGHTARROW)) {
            scrollInfo.nextScrollTime = DC->realTime + SCROLL_TIME_START;
            scrollInfo.nextAdjustTime = DC->realTime + SCROLL_TIME_ADJUST;
            scrollInfo.adjustValue = SCROLL_TIME_START;
            scrollInfo.scrollKey = key;
            scrollInfo.item = item;
            captureData = &scrollInfo;
            captureFunc = &Scroll_ListBox_AutoFunc;
            itemCapture = item;
        } else if (flags & WINDOW_LB_THUMB) {
            scrollInfo.scrollKey = key;
            scrollInfo.item = item;
            scrollInfo.xStart = DC->cursorx;
            scrollInfo.yStart = DC->cursory;
            captureData = &scrollInfo;
            captureFunc = &Scroll_ListBox_ThumbFunc;
            itemCapture = item;
        }
        break;
    }
    case ITEM_TYPE_SLIDER: {
        flags = Item_Slider_OverSlider(item, DC->cursorx, DC->cursory);
        if (flags & WINDOW_LB_THUMB) {
            scrollInfo.scrollKey = key;
            scrollInfo.item = item;
            scrollInfo.xStart = DC->cursorx;
            scrollInfo.yStart = DC->cursory;
            captureData = &scrollInfo;
            captureFunc = &Scroll_Slider_ThumbFunc;
            itemCapture = item;
        }
        break;
    }
    }
}

static void Item_StopCapture(itemDef_t* item)
{
}

static bool Item_Slider_HandleKey(itemDef_t* item, int key, bool down)
{
    float x, value, width, work;

    // DC->Print("slider handle key\n");
    if (item->cvar) {
        if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_MOUSE3) {
            editFieldDef_t* editDef = item->typeData;
            if (editDef && Rect_ContainsPoint(&item->window.rect, DC->cursorx, DC->cursory) && item->window.flags & WINDOW_HASFOCUS) {
                rectDef_t testRect;
                width = SLIDER_WIDTH;
                if (item->text) {
                    x = item->textRect.x + item->textRect.w + 8;
                } else {
                    x = item->window.rect.x;
                }

                testRect = item->window.rect;
                testRect.x = x;
                value = (float)SLIDER_THUMB_WIDTH / 2;
                testRect.x -= value;
                // DC->Print("slider x: %f\n", testRect.x);
                testRect.w = (SLIDER_WIDTH + (float)SLIDER_THUMB_WIDTH / 2);
                // DC->Print("slider w: %f\n", testRect.w);
                if (Rect_ContainsPoint(&testRect, DC->cursorx, DC->cursory)) {
                    work = DC->cursorx - x;
                    value = work / width;
                    value *= (editDef->maxVal - editDef->minVal);
                    // vm fuckage
                    // value = (((float)(DC->cursorx - x)/ SLIDER_WIDTH) * (editDef->maxVal - editDef->minVal));
                    value += editDef->minVal;
                    DC->setCVar(item->cvar, va("%f", value));
                    return true;
                }
            }
        } else {
            int select = UI_SelectForKey(key);
            if (select != 0) {
                editFieldDef_t* editDef = item->typeData;
                if (editDef) {
                    // 20 is number of steps
                    value = DC->getCVarValue(item->cvar) + (((editDef->maxVal - editDef->minVal) / 20) * select);

                    if (value < editDef->minVal)
                        value = editDef->minVal;
                    else if (value > editDef->maxVal)
                        value = editDef->maxVal;

                    DC->setCVar(item->cvar, va("%f", value));
                    return true;
                }
            }
        }
    }
    DC->Print("slider handle key exit\n");
    return false;
}

static bool Item_HandleKey(itemDef_t* item, int key, bool down)
{

    if (itemCapture) {
        Item_StopCapture(itemCapture);
        itemCapture = NULL;
        captureFunc = 0;
        captureData = NULL;
    } else {
        if (down && (key == K_MOUSE1 || key == K_MOUSE2 || key == K_MOUSE3)) {
            Item_StartCapture(item, key);
        }
    }

    if (!down) {
        return false;
    }

    switch (item->type) {
    case ITEM_TYPE_BUTTON:
        return false;
        break;
    case ITEM_TYPE_RADIOBUTTON:
        return false;
        break;
    case ITEM_TYPE_CHECKBOX:
        return false;
        break;
    case ITEM_TYPE_EDITFIELD:
    case ITEM_TYPE_NUMERICFIELD:
        // return Item_TextField_HandleKey(item, key);
        return false;
        break;
    case ITEM_TYPE_COMBO:
        return false;
        break;
    case ITEM_TYPE_LISTBOX:
        return Item_ListBox_HandleKey(item, key, down, false);
        break;
    case ITEM_TYPE_YESNO:
        return Item_YesNo_HandleKey(item, key);
        break;
    case ITEM_TYPE_MULTI:
        return Item_Multi_HandleKey(item, key);
        break;
    case ITEM_TYPE_OWNERDRAW:
        return Item_OwnerDraw_HandleKey(item, key);
        break;
    case ITEM_TYPE_BIND:
        return Item_Bind_HandleKey(item, key, down);
        break;
    case ITEM_TYPE_SLIDER:
        return Item_Slider_HandleKey(item, key, down);
        break;
    default:
        return false;
        break;
    }

    // return false;
}

static void Item_Action(itemDef_t* item)
{
    if (item) {
        Item_RunScript(item, item->action);
    }
}

itemDef_t* Menu_SetPrevCursorItem(menuDef_t* menu)
{
    bool wrapped = false;
    int oldCursor = menu->cursorItem;

    if (menu->cursorItem < 0) {
        menu->cursorItem = menu->itemCount - 1;
        wrapped = true;
    }

    while (menu->cursorItem > -1) {

        menu->cursorItem--;
        if (menu->cursorItem < 0 && !wrapped) {
            wrapped = true;
            menu->cursorItem = menu->itemCount - 1;
        }

        if (Item_SetFocus(menu->items[menu->cursorItem], DC->cursorx, DC->cursory)) {
            Menu_HandleMouseMove(menu, menu->items[menu->cursorItem]->window.rect.x + 1, menu->items[menu->cursorItem]->window.rect.y + 1);
            return menu->items[menu->cursorItem];
        }
    }
    menu->cursorItem = oldCursor;
    return NULL;
}

itemDef_t* Menu_SetNextCursorItem(menuDef_t* menu)
{

    bool wrapped = false;
    int oldCursor = menu->cursorItem;

    if (menu->cursorItem == -1) {
        menu->cursorItem = 0;
        wrapped = true;
    }

    while (menu->cursorItem < menu->itemCount) {

        menu->cursorItem++;
        if (menu->cursorItem >= menu->itemCount && !wrapped) {
            wrapped = true;
            menu->cursorItem = 0;
        }
        if (Item_SetFocus(menu->items[menu->cursorItem], DC->cursorx, DC->cursory)) {
            Menu_HandleMouseMove(menu, menu->items[menu->cursorItem]->window.rect.x + 1, menu->items[menu->cursorItem]->window.rect.y + 1);
            return menu->items[menu->cursorItem];
        }
    }

    menu->cursorItem = oldCursor;
    return NULL;
}

static void Window_CloseCinematic(windowDef_t* window)
{
    if (window->style == WINDOW_STYLE_CINEMATIC && window->cinematic >= 0) {
        DC->stopCinematic(window->cinematic);
        window->cinematic = -1;
    }
}

static void Menu_CloseCinematics(menuDef_t* menu)
{
    if (menu) {
        int i;
        Window_CloseCinematic(&menu->window);
        for (i = 0; i < menu->itemCount; i++) {
            Window_CloseCinematic(&menu->items[i]->window);
            if (menu->items[i]->type == ITEM_TYPE_OWNERDRAW) {
                DC->stopCinematic(0 - menu->items[i]->window.ownerDraw);
            }
        }
    }
}

static void Display_CloseCinematics()
{
    int i;
    for (i = 0; i < menuCount; i++) {
        Menu_CloseCinematics(&Menus[i]);
    }
}

void Menus_Activate(menuDef_t* menu)
{
    menu->window.flags |= (WINDOW_HASFOCUS | WINDOW_VISIBLE);
    if (menu->onOpen) {
        itemDef_t item;
        item.parent = menu;
        Item_RunScript(&item, menu->onOpen);
    }

    if (menu->soundName && *menu->soundName) {
        //		DC->stopBackgroundTrack();					// you don't want to do this since it will reset s_rawend
        DC->startBackgroundTrack(menu->soundName, menu->soundName);
    }

    Display_CloseCinematics();
}

static int Display_VisibleMenuCount()
{
    int i, count;
    count = 0;
    for (i = 0; i < menuCount; i++) {
        if (Menus[i].window.flags & (WINDOW_FORCED | WINDOW_VISIBLE)) {
            count++;
        }
    }
    return count;
}

static void Menus_HandleOOBClick(menuDef_t* menu, int key, bool down)
{
    if (menu) {
        int i;
        // basically the behaviour we are looking for is if there are windows in the stack.. see if
        // the cursor is within any of them.. if not close them otherwise activate them and pass the
        // key on.. force a mouse move to activate focus and script stuff
        if (down && menu->window.flags & WINDOW_OOB_CLICK) {
            Menu_RunCloseScript(menu);
            menu->window.flags &= ~(WINDOW_HASFOCUS | WINDOW_VISIBLE);
        }

        for (i = 0; i < menuCount; i++) {
            if (Menu_OverActiveItem(&Menus[i], DC->cursorx, DC->cursory)) {
                Menu_RunCloseScript(menu);
                menu->window.flags &= ~(WINDOW_HASFOCUS | WINDOW_VISIBLE);
                Menus_Activate(&Menus[i]);
                Menu_HandleMouseMove(&Menus[i], DC->cursorx, DC->cursory);
                Menu_HandleKey(&Menus[i], key, down);
            }
        }

        if (Display_VisibleMenuCount() == 0) {
            if (DC->Pause) {
                DC->Pause(false);
            }
        }
        Display_CloseCinematics();
    }
}

static rectDef_t* Item_CorrectedTextRect(itemDef_t* item)
{
    static rectDef_t rect;
    memset(&rect, 0, sizeof(rectDef_t));
    if (item) {
        rect = item->textRect;
        if (rect.w) {
            rect.y -= rect.h;
        }
    }
    return &rect;
}

// menu item key horizontal action: -1 = previous value, 1 = next value, 0 = no change
int UI_SelectForKey(int key)
{
    switch (key) {
    case K_MOUSE1:
    case K_MOUSE3:
    case K_ENTER:
    case K_KP_ENTER:
    case K_RIGHTARROW:
    case K_KP_RIGHTARROW:
    case K_JOY1:
    case K_JOY2:
    case K_JOY3:
    case K_JOY4:
        return 1; // next

    case K_MOUSE2:
    case K_LEFTARROW:
    case K_KP_LEFTARROW:
        return -1; // previous
    }

    // no change
    return 0;
}

void Menu_HandleKey(menuDef_t* menu, int key, bool down)
{
    int i;
    itemDef_t* item = NULL;

    if (g_waitingForKey && down) {
        Item_Bind_HandleKey(g_bindItem, key, down);
        return;
    }

    if (g_editingField && down) {
        if (!Item_TextField_HandleKey(g_editItem, key)) {
            g_editingField = false;
            g_editItem = NULL;
            return;
        } else if (key == K_MOUSE1 || key == K_MOUSE2 || key == K_MOUSE3) {
            g_editingField = false;
            g_editItem = NULL;
            Display_MouseMove(NULL, DC->cursorx, DC->cursory);
        } else if (key == K_TAB || key == K_UPARROW || key == K_DOWNARROW) {
            return;
        }
    }

    if (menu == NULL) {
        return;
    }

    // see if the mouse is within the window bounds and if so is this a mouse click
    if (down && !(menu->window.flags & WINDOW_POPUP) && !Rect_ContainsPoint(&menu->window.rect, DC->cursorx, DC->cursory)) {
        static bool inHandleKey = false;
        if (!inHandleKey && (key == K_MOUSE1 || key == K_MOUSE2 || key == K_MOUSE3)) {
            inHandleKey = true;
            Menus_HandleOOBClick(menu, key, down);
            inHandleKey = false;
            return;
        }
    }

    // get the item with focus
    for (i = 0; i < menu->itemCount; i++) {
        if (menu->items[i]->window.flags & WINDOW_HASFOCUS) {
            item = menu->items[i];
        }
    }

    if (item != NULL) {
        if (Item_HandleKey(item, key, down)) {
            Item_Action(item);
            return;
        }
    }

    if (!down) {
        return;
    }

    // default handling
    switch (key) {

    case K_F11:
        if (DC->getCVarValue("developer")) {
            debugMode ^= 1;
        }
        break;

    case K_F12:
        if (DC->getCVarValue("developer")) {
            DC->executeText(EXEC_APPEND, "screenshot\n");
        }
        break;
    case K_KP_UPARROW:
    case K_UPARROW:
        Menu_SetPrevCursorItem(menu);
        break;

    case K_ESCAPE:
        if (!g_waitingForKey && menu->onESC) {
            itemDef_t it;
            it.parent = menu;
            Item_RunScript(&it, menu->onESC);
        }
        break;
    case K_TAB:
    case K_KP_DOWNARROW:
    case K_DOWNARROW:
        Menu_SetNextCursorItem(menu);
        break;

    case K_MOUSE1:
    case K_MOUSE2:
        if (item) {
            if (item->type == ITEM_TYPE_TEXT) {
                if (Rect_ContainsPoint(Item_CorrectedTextRect(item), DC->cursorx, DC->cursory)) {
                    Item_Action(item);
                }
            } else if (item->type == ITEM_TYPE_EDITFIELD || item->type == ITEM_TYPE_NUMERICFIELD) {
                if (Rect_ContainsPoint(&item->window.rect, DC->cursorx, DC->cursory)) {
                    item->cursorPos = 0;
                    g_editingField = true;
                    g_editItem = item;
                }
            } else {
                if (Rect_ContainsPoint(&item->window.rect, DC->cursorx, DC->cursory)) {
                    Item_Action(item);
                }
            }
        }
        break;

    case K_JOY1:
    case K_JOY2:
    case K_JOY3:
    case K_JOY4:
    case K_AUX1:
    case K_AUX2:
    case K_AUX3:
    case K_AUX4:
    case K_AUX5:
    case K_AUX6:
    case K_AUX7:
    case K_AUX8:
    case K_AUX9:
    case K_AUX10:
    case K_AUX11:
    case K_AUX12:
    case K_AUX13:
    case K_AUX14:
    case K_AUX15:
    case K_AUX16:
    case K_KP_ENTER:
    case K_ENTER:
        if (item) {
            if (item->type == ITEM_TYPE_EDITFIELD || item->type == ITEM_TYPE_NUMERICFIELD) {
                item->cursorPos = 0;
                g_editingField = true;
                g_editItem = item;
            } else {
                Item_Action(item);
            }
        }
        break;
    }
}

static void ToWindowCoords(float* x, float* y, windowDef_t* window)
{
    if (window->border != 0) {
        *x += window->borderSize;
        *y += window->borderSize;
    }
    *x += window->rect.x;
    *y += window->rect.y;
}

static void Item_SetTextExtents(itemDef_t* item, int* width, int* height, const char* text)
{
    const char* textPtr = (text) ? text : item->text;

    if (textPtr == NULL) {
        return;
    }

    *width = item->textRect.w;
    *height = item->textRect.h;

    // keeps us from computing the widths and heights more than once
    if (*width == 0 || (item->type == ITEM_TYPE_OWNERDRAW && item->textalignment == ITEM_ALIGN_CENTER)) {
        int originalWidth = DC->textWidth(item->text, item->textscale, 0);

        if (item->type == ITEM_TYPE_OWNERDRAW && (item->textalignment == ITEM_ALIGN_CENTER || item->textalignment == ITEM_ALIGN_RIGHT)) {
            originalWidth += DC->ownerDrawWidth(item->window.ownerDraw, item->textscale);
        } else if (item->type == ITEM_TYPE_EDITFIELD && item->textalignment == ITEM_ALIGN_CENTER && item->cvar) {
            char buff[256];
            DC->getCVarString(item->cvar, buff, 256);
            originalWidth += DC->textWidth(buff, item->textscale, 0);
        }

        *width = DC->textWidth(textPtr, item->textscale, 0);
        *height = DC->textHeight(textPtr, item->textscale, 0);
        item->textRect.w = *width;
        item->textRect.h = *height;
        item->textRect.x = item->textalignx;
        item->textRect.y = item->textaligny;
        if (item->textalignment == ITEM_ALIGN_RIGHT) {
            item->textRect.x = item->textalignx - originalWidth;
        } else if (item->textalignment == ITEM_ALIGN_CENTER) {
            item->textRect.x = item->textalignx - originalWidth / 2;
        }

        ToWindowCoords(&item->textRect.x, &item->textRect.y, &item->window);
    }
}

static void Item_TextColor(itemDef_t* item, vec4_t* newColor)
{
    vec4_t lowLight;
    menuDef_t* parent = (menuDef_t*)item->parent;

    Fade(&item->window.flags, &item->window.foreColor[3], parent->fadeClamp, &item->window.nextTime, parent->fadeCycle, true, parent->fadeAmount);

    if (item->window.flags & WINDOW_HASFOCUS) {
        lowLight[0] = 0.8 * parent->focusColor[0];
        lowLight[1] = 0.8 * parent->focusColor[1];
        lowLight[2] = 0.8 * parent->focusColor[2];
        lowLight[3] = 0.8 * parent->focusColor[3];
        LerpColor(parent->focusColor, lowLight, *newColor, 0.5 + 0.5 * sin(DC->realTime / PULSE_DIVISOR));
    } else if (item->textStyle == ITEM_TEXTSTYLE_BLINK && !((DC->realTime / BLINK_DIVISOR) & 1)) {
        lowLight[0] = 0.8 * item->window.foreColor[0];
        lowLight[1] = 0.8 * item->window.foreColor[1];
        lowLight[2] = 0.8 * item->window.foreColor[2];
        lowLight[3] = 0.8 * item->window.foreColor[3];
        LerpColor(item->window.foreColor, lowLight, *newColor, 0.5 + 0.5 * sin(DC->realTime / PULSE_DIVISOR));
    } else {
        memcpy(newColor, &item->window.foreColor, sizeof(vec4_t));
        // items can be enabled and disabled based on cvars
    }

    if (item->enableCvar && *item->enableCvar && item->cvarTest && *item->cvarTest) {
        if (item->cvarFlags & (CVAR_ENABLE | CVAR_DISABLE) && !Item_EnableShowViaCvar(item, CVAR_ENABLE)) {
            memcpy(newColor, &parent->disableColor, sizeof(vec4_t));
        }
    }
}

static void Item_Text_AutoWrapped_Paint(itemDef_t* item)
{
    char text[1024];
    const char *p, *textPtr, *newLinePtr;
    char buff[1024];
    int width, height, len, textWidth, newLine, newLineWidth;
    float y;
    vec4_t color;

    textWidth = 0;
    newLinePtr = NULL;

    if (item->text == NULL) {
        if (item->cvar == NULL) {
            return;
        } else {
            DC->getCVarString(item->cvar, text, sizeof(text));
            textPtr = text;
        }
    } else {
        textPtr = item->text;
    }
    if (*textPtr == '\0') {
        return;
    }
    Item_TextColor(item, &color);
    Item_SetTextExtents(item, &width, &height, textPtr);

    y = item->textaligny;
    len = 0;
    buff[0] = '\0';
    newLine = 0;
    newLineWidth = 0;
    p = textPtr;
    while (p) {
        if (*p == ' ' || *p == '\t' || *p == '\n' || *p == '\0') {
            newLine = len;
            newLinePtr = p + 1;
            newLineWidth = textWidth;
        }
        textWidth = DC->textWidth(buff, item->textscale, 0);
        if ((newLine && textWidth > item->window.rect.w) || *p == '\n' || *p == '\0') {
            if (len) {
                if (item->textalignment == ITEM_ALIGN_LEFT) {
                    item->textRect.x = item->textalignx;
                } else if (item->textalignment == ITEM_ALIGN_RIGHT) {
                    item->textRect.x = item->textalignx - newLineWidth;
                } else if (item->textalignment == ITEM_ALIGN_CENTER) {
                    item->textRect.x = item->textalignx - newLineWidth / 2;
                }
                item->textRect.y = y;
                ToWindowCoords(&item->textRect.x, &item->textRect.y, &item->window);
                buff[newLine] = '\0';
                DC->drawText(item->textRect.x, item->textRect.y, item->textscale, color, buff, 0, 0, item->textStyle);
            }
            if (*p == '\0') {
                break;
            }
            y += height + 5;
            p = newLinePtr;
            len = 0;
            newLine = 0;
            newLineWidth = 0;
            continue;
        }
        buff[len++] = *p++;
        buff[len] = '\0';
    }
}

static void Item_Text_Wrapped_Paint(itemDef_t* item)
{
    char text[1024];
    const char *p, *start, *textPtr;
    char buff[1024];
    int width, height;
    float x, y;
    vec4_t color;

    // now paint the text and/or any optional images
    // default to left

    if (item->text == NULL) {
        if (item->cvar == NULL) {
            return;
        } else {
            DC->getCVarString(item->cvar, text, sizeof(text));
            textPtr = text;
        }
    } else {
        textPtr = item->text;
    }
    if (*textPtr == '\0') {
        return;
    }

    Item_TextColor(item, &color);
    Item_SetTextExtents(item, &width, &height, textPtr);

    x = item->textRect.x;
    y = item->textRect.y;
    start = textPtr;
    p = strchr(textPtr, '\r');
    while (p && *p) {
        strncpy(buff, start, p - start + 1);
        buff[p - start] = '\0';
        DC->drawText(x, y, item->textscale, color, buff, 0, 0, item->textStyle);
        y += height + 5;
        start += p - start + 1;
        p = strchr(p + 1, '\r');
    }
    DC->drawText(x, y, item->textscale, color, start, 0, 0, item->textStyle);
}

static void Item_Text_Paint(itemDef_t* item)
{
    char text[1024];
    const char* textPtr;
    int height, width;
    vec4_t color;

    if (item->window.flags & WINDOW_WRAPPED) {
        Item_Text_Wrapped_Paint(item);
        return;
    }
    if (item->window.flags & WINDOW_AUTOWRAPPED) {
        Item_Text_AutoWrapped_Paint(item);
        return;
    }

    if (item->text == NULL) {
        if (item->cvar == NULL) {
            return;
        } else {
            DC->getCVarString(item->cvar, text, sizeof(text));
            textPtr = text;
        }
    } else {
        textPtr = item->text;
    }

    // this needs to go here as it sets extents for cvar types as well
    Item_SetTextExtents(item, &width, &height, textPtr);

    if (*textPtr == '\0') {
        return;
    }

    Item_TextColor(item, &color);

    // FIXME: this is a fucking mess
    /*
            adjust = 0;
            if (item->textStyle == ITEM_TEXTSTYLE_OUTLINED || item->textStyle == ITEM_TEXTSTYLE_OUTLINESHADOWED) {
                    adjust = 0.5;
            }

            if (item->textStyle == ITEM_TEXTSTYLE_SHADOWED || item->textStyle == ITEM_TEXTSTYLE_OUTLINESHADOWED) {
                    Fade(&item->window.flags, &DC->Assets.shadowColor[3], DC->Assets.fadeClamp, &item->window.nextTime, DC->Assets.fadeCycle, false);
                    DC->drawText(item->textRect.x + DC->Assets.shadowX, item->textRect.y + DC->Assets.shadowY, item->textscale, DC->Assets.shadowColor, textPtr, adjust);
            }
    */

    //	if (item->textStyle == ITEM_TEXTSTYLE_OUTLINED || item->textStyle == ITEM_TEXTSTYLE_OUTLINESHADOWED) {
    //		Fade(&item->window.flags, &item->window.outlineColor[3], DC->Assets.fadeClamp, &item->window.nextTime, DC->Assets.fadeCycle, false);
    //		/*
    //		Text_Paint(item->textRect.x-1, item->textRect.y-1, item->textscale, item->window.foreColor, textPtr, adjust);
    //		Text_Paint(item->textRect.x, item->textRect.y-1, item->textscale, item->window.foreColor, textPtr, adjust);
    //		Text_Paint(item->textRect.x+1, item->textRect.y-1, item->textscale, item->window.foreColor, textPtr, adjust);
    //		Text_Paint(item->textRect.x-1, item->textRect.y, item->textscale, item->window.foreColor, textPtr, adjust);
    //		Text_Paint(item->textRect.x+1, item->textRect.y, item->textscale, item->window.foreColor, textPtr, adjust);
    //		Text_Paint(item->textRect.x-1, item->textRect.y+1, item->textscale, item->window.foreColor, textPtr, adjust);
    //		Text_Paint(item->textRect.x, item->textRect.y+1, item->textscale, item->window.foreColor, textPtr, adjust);
    //		Text_Paint(item->textRect.x+1, item->textRect.y+1, item->textscale, item->window.foreColor, textPtr, adjust);
    //		*/
    //		DC->drawText(item->textRect.x - 1, item->textRect.y + 1, item->textscale * 1.02, item->window.outlineColor, textPtr, adjust);
    //	}

    DC->drawText(item->textRect.x, item->textRect.y, item->textscale, color, textPtr, 0, 0, item->textStyle);
}

static void Item_TextField_Paint(itemDef_t* item)
{
    char buff[1024];
    vec4_t newColor, lowLight;
    int offset;
    menuDef_t* parent = (menuDef_t*)item->parent;
    editFieldDef_t* editPtr = (editFieldDef_t*)item->typeData;

    Item_Text_Paint(item);

    buff[0] = '\0';

    if (item->cvar) {
        DC->getCVarString(item->cvar, buff, sizeof(buff));
    }

    if (item->window.flags & WINDOW_HASFOCUS) {
        lowLight[0] = 0.8 * parent->focusColor[0];
        lowLight[1] = 0.8 * parent->focusColor[1];
        lowLight[2] = 0.8 * parent->focusColor[2];
        lowLight[3] = 0.8 * parent->focusColor[3];
        LerpColor(parent->focusColor, lowLight, newColor, 0.5 + 0.5 * sin(DC->realTime / PULSE_DIVISOR));
    } else {
        memcpy(&newColor, &item->window.foreColor, sizeof(vec4_t));
    }

    offset = (item->text && *item->text) ? 8 : 0;
    if (item->window.flags & WINDOW_HASFOCUS && g_editingField) {
        char cursor = DC->getOverstrikeMode() ? '_' : '|';
        DC->drawTextWithCursor(item->textRect.x + item->textRect.w + offset, item->textRect.y, item->textscale, newColor, buff + editPtr->paintOffset, item->cursorPos - editPtr->paintOffset, cursor, editPtr->maxPaintChars, item->textStyle);
    } else {
        DC->drawText(item->textRect.x + item->textRect.w + offset, item->textRect.y, item->textscale, newColor, buff + editPtr->paintOffset, 0, editPtr->maxPaintChars, item->textStyle);
    }
}

static void Item_YesNo_Paint(itemDef_t* item)
{
    vec4_t newColor, lowLight;
    float value;
    menuDef_t* parent = (menuDef_t*)item->parent;

    value = (item->cvar) ? DC->getCVarValue(item->cvar) : 0;

    if (item->window.flags & WINDOW_HASFOCUS) {
        lowLight[0] = 0.8 * parent->focusColor[0];
        lowLight[1] = 0.8 * parent->focusColor[1];
        lowLight[2] = 0.8 * parent->focusColor[2];
        lowLight[3] = 0.8 * parent->focusColor[3];
        LerpColor(parent->focusColor, lowLight, newColor, 0.5 + 0.5 * sin(DC->realTime / PULSE_DIVISOR));
    } else {
        memcpy(&newColor, &item->window.foreColor, sizeof(vec4_t));
    }

    if (item->text) {
        Item_Text_Paint(item);
        DC->drawText(item->textRect.x + item->textRect.w + 8, item->textRect.y, item->textscale, newColor, (value != 0) ? "Yes" : "No", 0, 0, item->textStyle);
    } else {
        DC->drawText(item->textRect.x, item->textRect.y, item->textscale, newColor, (value != 0) ? "Yes" : "No", 0, 0, item->textStyle);
    }
}

static void Item_Multi_Paint(itemDef_t* item)
{
    vec4_t newColor, lowLight;
    const char* text = "";
    menuDef_t* parent = (menuDef_t*)item->parent;

    if (item->window.flags & WINDOW_HASFOCUS) {
        lowLight[0] = 0.8 * parent->focusColor[0];
        lowLight[1] = 0.8 * parent->focusColor[1];
        lowLight[2] = 0.8 * parent->focusColor[2];
        lowLight[3] = 0.8 * parent->focusColor[3];
        LerpColor(parent->focusColor, lowLight, newColor, 0.5 + 0.5 * sin(DC->realTime / PULSE_DIVISOR));
    } else {
        memcpy(&newColor, &item->window.foreColor, sizeof(vec4_t));
    }

    text = Item_Multi_Setting(item);

    if (item->text) {
        Item_Text_Paint(item);
        DC->drawText(item->textRect.x + item->textRect.w + 8, item->textRect.y, item->textscale, newColor, text, 0, 0, item->textStyle);
    } else {
        DC->drawText(item->textRect.x, item->textRect.y, item->textscale, newColor, text, 0, 0, item->textStyle);
    }
}

typedef struct {
    char* command;
    int defaultbind1;
    int defaultbind2;
    int bind1;
    int bind2;
} bind_t;

typedef struct
{
    char* name;
    float defaultvalue;
    float value;
} configcvar_t;

static bind_t g_bindings[] = {
    { "+scores", K_TAB, -1, -1, -1 },
    { "+button2", K_ENTER, -1, -1, -1 },
    { "+speed", K_SHIFT, -1, -1, -1 },
    { "+forward", K_UPARROW, -1, -1, -1 },
    { "+back", K_DOWNARROW, -1, -1, -1 },
    { "+moveleft", ',', -1, -1, -1 },
    { "+moveright", '.', -1, -1, -1 },
    { "+moveup", K_SPACE, -1, -1, -1 },
    { "+movedown", 'c', -1, -1, -1 },
    { "+left", K_LEFTARROW, -1, -1, -1 },
    { "+right", K_RIGHTARROW, -1, -1, -1 },
    { "+strafe", K_ALT, -1, -1, -1 },
    { "+lookup", K_PGDN, -1, -1, -1 },
    { "+lookdown", K_DEL, -1, -1, -1 },
    { "+mlook", '/', -1, -1, -1 },
    { "centerview", K_END, -1, -1, -1 },
    { "+zoom", -1, -1, -1, -1 },
    { "weapon 1", '1', -1, -1, -1 },
    { "weapon 2", '2', -1, -1, -1 },
    { "weapon 3", '3', -1, -1, -1 },
    { "weapon 4", '4', -1, -1, -1 },
    { "weapon 5", '5', -1, -1, -1 },
    { "weapon 6", '6', -1, -1, -1 },
    { "weapon 7", '7', -1, -1, -1 },
    { "weapon 8", '8', -1, -1, -1 },
    { "weapon 9", '9', -1, -1, -1 },
    { "weapon 10", '0', -1, -1, -1 },
    { "weapon 11", -1, -1, -1, -1 },
    { "weapon 12", -1, -1, -1, -1 },
    { "weapon 13", -1, -1, -1, -1 },
    { "+attack", K_CTRL, -1, -1, -1 },
    { "weapprev", '[', -1, -1, -1 },
    { "weapnext", ']', -1, -1, -1 },
    { "+button3", K_MOUSE3, -1, -1, -1 },
    { "+button4", K_MOUSE4, -1, -1, -1 },
    { "prevTeamMember", 'w', -1, -1, -1 },
    { "nextTeamMember", 'r', -1, -1, -1 },
    { "nextOrder", 't', -1, -1, -1 },
    { "confirmOrder", 'y', -1, -1, -1 },
    { "denyOrder", 'n', -1, -1, -1 },
    { "taskOffense", 'o', -1, -1, -1 },
    { "taskDefense", 'd', -1, -1, -1 },
    { "taskPatrol", 'p', -1, -1, -1 },
    { "taskCamp", 'c', -1, -1, -1 },
    { "taskFollow", 'f', -1, -1, -1 },
    { "taskRetrieve", 'v', -1, -1, -1 },
    { "taskEscort", 'e', -1, -1, -1 },
    { "taskOwnFlag", 'i', -1, -1, -1 },
    { "taskSuicide", 'k', -1, -1, -1 },
    { "tauntKillInsult", K_F1, -1, -1, -1 },
    { "tauntPraise", K_F2, -1, -1, -1 },
    { "tauntTaunt", K_F3, -1, -1, -1 },
    { "tauntDeathInsult", K_F4, -1, -1, -1 },
    { "tauntGauntlet", K_F5, -1, -1, -1 },
    { "scoresUp", K_KP_PGUP, -1, -1, -1 },
    { "scoresDown", K_KP_PGDN, -1, -1, -1 },
    { "messagemode", -1, -1, -1, -1 },
    { "messagemode2", -1, -1, -1, -1 },
    { "messagemode3", -1, -1, -1, -1 },
    { "messagemode4", -1, -1, -1, -1 }
};

static const int g_bindCount = ARRAY_LEN(g_bindings);

static void Controls_GetKeyAssignment(char* command, int* twokeys)
{
    int count;
    int j;
    char b[256];

    twokeys[0] = twokeys[1] = -1;
    count = 0;

    for (j = 0; j < 256; j++) {
        DC->getBindingBuf(j, b, 256);
        if (*b == 0) {
            continue;
        }
        if (!Q_stricmp(b, command)) {
            twokeys[count] = j;
            count++;
            if (count == 2) {
                break;
            }
        }
    }
}

void Controls_GetConfig()
{
    int i;
    int twokeys[2];

    // iterate each command, get its numeric binding
    for (i = 0; i < g_bindCount; i++) {

        Controls_GetKeyAssignment(g_bindings[i].command, twokeys);

        g_bindings[i].bind1 = twokeys[0];
        g_bindings[i].bind2 = twokeys[1];
    }
}

void Controls_SetConfig(bool restart)
{
    int i;

    // iterate each command, get its numeric binding
    for (i = 0; i < g_bindCount; i++) {

        if (g_bindings[i].bind1 != -1) {
            DC->setBinding(g_bindings[i].bind1, g_bindings[i].command);

            if (g_bindings[i].bind2 != -1)
                DC->setBinding(g_bindings[i].bind2, g_bindings[i].command);
        }
    }

    DC->executeText(EXEC_APPEND, "in_restart\n");
}

void Controls_SetDefaults()
{
    int i;

    // iterate each command, set its default binding
    for (i = 0; i < g_bindCount; i++) {
        g_bindings[i].bind1 = g_bindings[i].defaultbind1;
        g_bindings[i].bind2 = g_bindings[i].defaultbind2;
    }

    // s_controls.invertmouse.curvalue  = Controls_GetCvarDefault( "m_pitch" ) < 0;
    // s_controls.smoothmouse.curvalue  = Controls_GetCvarDefault( "m_filter" );
    // s_controls.alwaysrun.curvalue    = Controls_GetCvarDefault( "cl_run" );
    // s_controls.autoswitch.curvalue   = Controls_GetCvarDefault( "cg_autoswitch" );
    // s_controls.sensitivity.curvalue  = Controls_GetCvarDefault( "sensitivity" );
    // s_controls.joyenable.curvalue    = Controls_GetCvarDefault( "in_joystick" );
    // s_controls.joythreshold.curvalue = Controls_GetCvarDefault( "joy_threshold" );
    // s_controls.freelook.curvalue     = Controls_GetCvarDefault( "cl_freelook" );
}

int BindingIDFromName(const char* name)
{
    int i;
    for (i = 0; i < g_bindCount; i++) {
        if (Q_stricmp(name, g_bindings[i].command) == 0) {
            return i;
        }
    }
    return -1;
}

char g_nameBind1[32];
char g_nameBind2[32];

static void BindingFromName(const char* cvar)
{
    int i, b1, b2;

    // iterate each command, set its default binding
    for (i = 0; i < g_bindCount; i++) {
        if (Q_stricmp(cvar, g_bindings[i].command) == 0) {
            b1 = g_bindings[i].bind1;
            if (b1 == -1) {
                break;
            }
            DC->keynumToStringBuf(b1, g_nameBind1, 32);
            Q_strupr(g_nameBind1);

            b2 = g_bindings[i].bind2;
            if (b2 != -1) {
                DC->keynumToStringBuf(b2, g_nameBind2, 32);
                Q_strupr(g_nameBind2);
                strcat(g_nameBind1, " or ");
                strcat(g_nameBind1, g_nameBind2);
            }
            return;
        }
    }
    strcpy(g_nameBind1, "???");
}

static void Item_Slider_Paint(itemDef_t* item)
{
    vec4_t newColor, lowLight;
    float x, y;
    menuDef_t* parent = (menuDef_t*)item->parent;

    if (item->window.flags & WINDOW_HASFOCUS) {
        lowLight[0] = 0.8 * parent->focusColor[0];
        lowLight[1] = 0.8 * parent->focusColor[1];
        lowLight[2] = 0.8 * parent->focusColor[2];
        lowLight[3] = 0.8 * parent->focusColor[3];
        LerpColor(parent->focusColor, lowLight, newColor, 0.5 + 0.5 * sin(DC->realTime / PULSE_DIVISOR));
    } else {
        memcpy(&newColor, &item->window.foreColor, sizeof(vec4_t));
    }

    y = item->window.rect.y;
    if (item->text) {
        Item_Text_Paint(item);
        x = item->textRect.x + item->textRect.w + 8;
    } else {
        x = item->window.rect.x;
    }
    DC->setColor(newColor);
    DC->drawHandlePic(x, y, SLIDER_WIDTH, SLIDER_HEIGHT, DC->Assets.sliderBar);

    x = Item_Slider_ThumbPosition(item);
    DC->drawHandlePic(x - (SLIDER_THUMB_WIDTH / 2), y - 2, SLIDER_THUMB_WIDTH, SLIDER_THUMB_HEIGHT, DC->Assets.sliderThumb);
}

static void Item_Bind_Paint(itemDef_t* item)
{
    vec4_t newColor, lowLight;
    int maxChars = 0;
    menuDef_t* parent = (menuDef_t*)item->parent;
    editFieldDef_t* editPtr = (editFieldDef_t*)item->typeData;
    if (editPtr) {
        maxChars = editPtr->maxPaintChars;
    }

    if (item->window.flags & WINDOW_HASFOCUS) {
        if (g_bindItem == item) {
            lowLight[0] = 0.8f * 1.0f;
            lowLight[1] = 0.8f * 0.0f;
            lowLight[2] = 0.8f * 0.0f;
            lowLight[3] = 0.8f * 1.0f;
        } else {
            lowLight[0] = 0.8f * parent->focusColor[0];
            lowLight[1] = 0.8f * parent->focusColor[1];
            lowLight[2] = 0.8f * parent->focusColor[2];
            lowLight[3] = 0.8f * parent->focusColor[3];
        }
        LerpColor(parent->focusColor, lowLight, newColor, 0.5 + 0.5 * sin(DC->realTime / PULSE_DIVISOR));
    } else {
        memcpy(&newColor, &item->window.foreColor, sizeof(vec4_t));
    }

    if (item->text) {
        Item_Text_Paint(item);
        BindingFromName(item->cvar);
        DC->drawText(item->textRect.x + item->textRect.w + 8, item->textRect.y, item->textscale, newColor, g_nameBind1, 0, maxChars, item->textStyle);
    } else {
        DC->drawText(item->textRect.x, item->textRect.y, item->textscale, newColor, "FIXME", 0, maxChars, item->textStyle);
    }
}

bool Display_KeyBindPending()
{
    return g_waitingForKey;
}

bool Item_Bind_HandleKey(itemDef_t* item, int key, bool down)
{
    int id;
    int i;

    if (!g_waitingForKey) {
        if (down && ((key == K_MOUSE1 && Rect_ContainsPoint(&item->window.rect, DC->cursorx, DC->cursory)) || key == K_ENTER || key == K_KP_ENTER || key == K_JOY1 || key == K_JOY2 || key == K_JOY3 || key == K_JOY4)) {
            g_waitingForKey = true;
            g_bindItem = item;
        }
        return true;
    } else {
        if (g_bindItem == NULL) {
            return true;
        }

        if (key & K_CHAR_FLAG) {
            return true;
        }

        switch (key) {
        case K_ESCAPE:
            g_waitingForKey = false;
            return true;

        case K_BACKSPACE:
            id = BindingIDFromName(item->cvar);
            if (id != -1) {
                if (g_bindings[id].bind1 != -1) {
                    DC->setBinding(g_bindings[id].bind1, "");
                    g_bindings[id].bind1 = -1;
                }
                if (g_bindings[id].bind2 != -1) {
                    DC->setBinding(g_bindings[id].bind2, "");
                    g_bindings[id].bind2 = -1;
                }
            }
            Controls_SetConfig(true);
            g_waitingForKey = false;
            g_bindItem = NULL;
            return true;

        case '`':
            return true;
        }
    }

    if (key != -1) {

        for (i = 0; i < g_bindCount; i++) {

            if (g_bindings[i].bind2 == key) {
                g_bindings[i].bind2 = -1;
            }

            if (g_bindings[i].bind1 == key) {
                g_bindings[i].bind1 = g_bindings[i].bind2;
                g_bindings[i].bind2 = -1;
            }
        }
    }

    id = BindingIDFromName(item->cvar);

    if (id != -1) {
        if (key == -1) {
            if (g_bindings[id].bind1 != -1) {
                DC->setBinding(g_bindings[id].bind1, "");
                g_bindings[id].bind1 = -1;
            }
            if (g_bindings[id].bind2 != -1) {
                DC->setBinding(g_bindings[id].bind2, "");
                g_bindings[id].bind2 = -1;
            }
        } else if (g_bindings[id].bind1 == -1) {
            g_bindings[id].bind1 = key;
        } else if (g_bindings[id].bind1 != key && g_bindings[id].bind2 == -1) {
            g_bindings[id].bind2 = key;
        } else {
            DC->setBinding(g_bindings[id].bind1, "");
            DC->setBinding(g_bindings[id].bind2, "");
            g_bindings[id].bind1 = key;
            g_bindings[id].bind2 = -1;
        }
    }

    Controls_SetConfig(true);
    g_waitingForKey = false;

    return true;
}

static void AdjustFrom640(float* x, float* y, float* w, float* h)
{
    //*x = *x * DC->scale + DC->bias;
    *x *= DC->xscale;
    *y *= DC->yscale;
    *w *= DC->xscale;
    *h *= DC->yscale;
}

static void Item_Model_Paint(itemDef_t* item)
{
    float x, y, w, h;
    refdef_t refdef;
    refEntity_t ent;
    vec3_t mins, maxs, origin;
    vec3_t angles;
    modelDef_t* modelPtr = (modelDef_t*)item->typeData;

    if (modelPtr == NULL) {
        return;
    }

    // setup the refdef
    memset(&refdef, 0, sizeof(refdef));
    refdef.rdflags = RDF_NOWORLDMODEL;
    AxisClear(refdef.viewaxis);
    x = item->window.rect.x + 1;
    y = item->window.rect.y + 1;
    w = item->window.rect.w - 2;
    h = item->window.rect.h - 2;

    AdjustFrom640(&x, &y, &w, &h);

    refdef.x = x;
    refdef.y = y;
    refdef.width = w;
    refdef.height = h;

    DC->modelBounds(item->asset, mins, maxs);

    origin[2] = -0.5 * (mins[2] + maxs[2]);
    origin[1] = 0.5 * (mins[1] + maxs[1]);

    // calculate distance so the model nearly fills the box
    if (true) {
        float len = 0.5 * (maxs[2] - mins[2]);
        origin[0] = len / 0.268; // len / tan( fov/2 )
        // origin[0] = len / tan(w/2);
    } else {
        origin[0] = item->textscale;
    }
    refdef.fov_x = (modelPtr->fov_x) ? modelPtr->fov_x : w;
    refdef.fov_y = (modelPtr->fov_y) ? modelPtr->fov_y : h;

    // refdef.fov_x = (int)((float)refdef.width / 640.0f * 90.0f);
    // xx = refdef.width / tan( refdef.fov_x / 360 * M_PI );
    // refdef.fov_y = atan2( refdef.height, xx );
    // refdef.fov_y *= ( 360 / M_PI );

    DC->clearScene();

    refdef.time = DC->realTime;

    // add the model

    memset(&ent, 0, sizeof(ent));

    // adjust = 5.0 * sin( (float)uis.realtime / 500 );
    // adjust = 360 % (int)((float)uis.realtime / 1000);
    // VectorSet( angles, 0, 0, 1 );

    // use item storage to track
    if (modelPtr->rotationSpeed) {
        if (DC->realTime > item->window.nextTime) {
            item->window.nextTime = DC->realTime + modelPtr->rotationSpeed;
            modelPtr->angle = (int)(modelPtr->angle + 1) % 360;
        }
    }
    VectorSet(angles, 0, modelPtr->angle, 0);
    AnglesToAxis(angles, ent.axis);

    ent.hModel = item->asset;
    VectorCopy(origin, ent.origin);
    VectorCopy(origin, ent.lightingOrigin);
    ent.renderfx = RF_LIGHTING_ORIGIN | RF_NOSHADOW;
    VectorCopy(ent.origin, ent.oldorigin);

    DC->addRefEntityToScene(&ent);
    DC->renderScene(&refdef);
}

static void Item_ListBox_Paint(itemDef_t* item)
{
    float x, y, size, thumb;
    int count, i;
    qhandle_t image;
    qhandle_t optionalImage;
    listBoxDef_t* listPtr = (listBoxDef_t*)item->typeData;

    // the listbox is horizontal or vertical and has a fixed size scroll bar going either direction
    // elements are enumerated from the DC and either text or image handles are acquired from the DC as well
    // textscale is used to size the text, textalignx and textaligny are used to size image elements
    // there is no clipping available so only the last completely visible item is painted
    count = DC->feederCount(item->special);
    // default is vertical if horizontal flag is not here
    if (item->window.flags & WINDOW_HORIZONTAL) {
        // draw scrollbar in bottom of the window
        // bar
        x = item->window.rect.x + 1;
        y = item->window.rect.y + item->window.rect.h - SCROLLBAR_SIZE - 1;
        DC->drawHandlePic(x, y, SCROLLBAR_SIZE, SCROLLBAR_SIZE, DC->Assets.scrollBarArrowLeft);
        x += SCROLLBAR_SIZE - 1;
        size = item->window.rect.w - (SCROLLBAR_SIZE * 2);
        DC->drawHandlePic(x, y, size + 1, SCROLLBAR_SIZE, DC->Assets.scrollBar);
        x += size - 1;
        DC->drawHandlePic(x, y, SCROLLBAR_SIZE, SCROLLBAR_SIZE, DC->Assets.scrollBarArrowRight);
        // thumb
        thumb = Item_ListBox_ThumbDrawPosition(item); // Item_ListBox_ThumbPosition(item);
        if (thumb > x - SCROLLBAR_SIZE - 1) {
            thumb = x - SCROLLBAR_SIZE - 1;
        }
        DC->drawHandlePic(thumb, y, SCROLLBAR_SIZE, SCROLLBAR_SIZE, DC->Assets.scrollBarThumb);
        listPtr->endPos = listPtr->startPos;
        size = item->window.rect.w - 2;
        // items
        // size contains max available space
        if (listPtr->elementStyle == LISTBOX_IMAGE) {
            // fit = 0;
            x = item->window.rect.x + 1;
            y = item->window.rect.y + 1;
            for (i = listPtr->startPos; i < count; i++) {
                // always draw at least one
                // which may overdraw the box if it is too small for the element
                image = DC->feederItemImage(item->special, i);
                if (image) {
                    DC->drawHandlePic(x + 1, y + 1, listPtr->elementWidth - 2, listPtr->elementHeight - 2, image);
                }

                if (i == item->cursorPos) {
                    DC->drawRect(x, y, listPtr->elementWidth - 1, listPtr->elementHeight - 1, item->window.borderSize, item->window.borderColor);
                }

                size -= listPtr->elementWidth;
                if (size < listPtr->elementWidth) {
                    listPtr->drawPadding = size; // listPtr->elementWidth - size;
                    break;
                }
                x += listPtr->elementWidth;
                listPtr->endPos++;
                // fit++;
            }
        } else {
        }
    } else {
        // draw scrollbar to right side of the window
        x = item->window.rect.x + item->window.rect.w - SCROLLBAR_SIZE - 1;
        y = item->window.rect.y + 1;
        DC->drawHandlePic(x, y, SCROLLBAR_SIZE, SCROLLBAR_SIZE, DC->Assets.scrollBarArrowUp);
        y += SCROLLBAR_SIZE - 1;

        listPtr->endPos = listPtr->startPos;
        size = item->window.rect.h - (SCROLLBAR_SIZE * 2);
        DC->drawHandlePic(x, y, SCROLLBAR_SIZE, size + 1, DC->Assets.scrollBar);
        y += size - 1;
        DC->drawHandlePic(x, y, SCROLLBAR_SIZE, SCROLLBAR_SIZE, DC->Assets.scrollBarArrowDown);
        // thumb
        thumb = Item_ListBox_ThumbDrawPosition(item); // Item_ListBox_ThumbPosition(item);
        if (thumb > y - SCROLLBAR_SIZE - 1) {
            thumb = y - SCROLLBAR_SIZE - 1;
        }
        DC->drawHandlePic(x, thumb, SCROLLBAR_SIZE, SCROLLBAR_SIZE, DC->Assets.scrollBarThumb);

        // adjust size for item painting
        size = item->window.rect.h - 2;
        if (listPtr->elementStyle == LISTBOX_IMAGE) {
            // fit = 0;
            x = item->window.rect.x + 1;
            y = item->window.rect.y + 1;
            for (i = listPtr->startPos; i < count; i++) {
                // always draw at least one
                // which may overdraw the box if it is too small for the element
                image = DC->feederItemImage(item->special, i);
                if (image) {
                    DC->drawHandlePic(x + 1, y + 1, listPtr->elementWidth - 2, listPtr->elementHeight - 2, image);
                }

                if (i == item->cursorPos) {
                    DC->drawRect(x, y, listPtr->elementWidth - 1, listPtr->elementHeight - 1, item->window.borderSize, item->window.borderColor);
                }

                listPtr->endPos++;
                size -= listPtr->elementWidth;
                if (size < listPtr->elementHeight) {
                    listPtr->drawPadding = listPtr->elementHeight - size;
                    break;
                }
                y += listPtr->elementHeight;
                // fit++;
            }
        } else {
            x = item->window.rect.x + 1;
            y = item->window.rect.y + 1;
            for (i = listPtr->startPos; i < count; i++) {
                const char* text;
                // always draw at least one
                // which may overdraw the box if it is too small for the element

                if (listPtr->numColumns > 0) {
                    int j;
                    for (j = 0; j < listPtr->numColumns; j++) {
                        text = DC->feederItemText(item->special, i, j, &optionalImage);
                        if (optionalImage >= 0) {
                            DC->drawHandlePic(x + 4 + listPtr->columnInfo[j].pos, y - 1 + listPtr->elementHeight / 2, listPtr->columnInfo[j].width, listPtr->columnInfo[j].width, optionalImage);
                        } else if (text) {
                            DC->drawText(x + 4 + listPtr->columnInfo[j].pos, y + listPtr->elementHeight, item->textscale, item->window.foreColor, text, 0, listPtr->columnInfo[j].maxChars, item->textStyle);
                        }
                    }
                } else {
                    text = DC->feederItemText(item->special, i, 0, &optionalImage);
                    if (optionalImage >= 0) {
                        // DC->drawHandlePic(x + 4 + listPtr->elementHeight, y, listPtr->columnInfo[j].width, listPtr->columnInfo[j].width, optionalImage);
                    } else if (text) {
                        DC->drawText(x + 4, y + listPtr->elementHeight, item->textscale, item->window.foreColor, text, 0, 0, item->textStyle);
                    }
                }

                if (i == item->cursorPos) {
                    DC->fillRect(x + 2, y + 2, item->window.rect.w - SCROLLBAR_SIZE - 4, listPtr->elementHeight, item->window.outlineColor);
                }

                size -= listPtr->elementHeight;
                if (size < listPtr->elementHeight) {
                    listPtr->drawPadding = listPtr->elementHeight - size;
                    break;
                }
                listPtr->endPos++;
                y += listPtr->elementHeight;
                // fit++;
            }
        }
    }
}

static void Item_OwnerDraw_Paint(itemDef_t* item)
{
    if (item == NULL) {
        return;
    }

    if (DC->ownerDrawItem) {
        vec4_t color, lowLight;
        menuDef_t* parent = (menuDef_t*)item->parent;
        Fade(&item->window.flags, &item->window.foreColor[3], parent->fadeClamp, &item->window.nextTime, parent->fadeCycle, true, parent->fadeAmount);
        memcpy(&color, &item->window.foreColor, sizeof(color));
        if (item->numColors > 0 && DC->getValue) {
            // if the value is within one of the ranges then set color to that, otherwise leave at default
            int i;
            float f = DC->getValue(item->window.ownerDraw);
            for (i = 0; i < item->numColors; i++) {
                if (f >= item->colorRanges[i].low && f <= item->colorRanges[i].high) {
                    memcpy(&color, &item->colorRanges[i].color, sizeof(color));
                    break;
                }
            }
        }

        if (item->window.flags & WINDOW_HASFOCUS) {
            lowLight[0] = 0.8 * parent->focusColor[0];
            lowLight[1] = 0.8 * parent->focusColor[1];
            lowLight[2] = 0.8 * parent->focusColor[2];
            lowLight[3] = 0.8 * parent->focusColor[3];
            LerpColor(parent->focusColor, lowLight, color, 0.5 + 0.5 * sin(DC->realTime / PULSE_DIVISOR));
        } else if (item->textStyle == ITEM_TEXTSTYLE_BLINK && !((DC->realTime / BLINK_DIVISOR) & 1)) {
            lowLight[0] = 0.8 * item->window.foreColor[0];
            lowLight[1] = 0.8 * item->window.foreColor[1];
            lowLight[2] = 0.8 * item->window.foreColor[2];
            lowLight[3] = 0.8 * item->window.foreColor[3];
            LerpColor(item->window.foreColor, lowLight, color, 0.5 + 0.5 * sin(DC->realTime / PULSE_DIVISOR));
        }

        if (item->cvarFlags & (CVAR_ENABLE | CVAR_DISABLE) && !Item_EnableShowViaCvar(item, CVAR_ENABLE)) {
            memcpy(color, parent->disableColor, sizeof(vec4_t));
        }

        if (item->text) {
            Item_Text_Paint(item);
            if (item->text[0]) {
                // +8 is an offset kludge to properly align owner draw items that have text combined with them
                DC->ownerDrawItem(item->textRect.x + item->textRect.w + 8, item->window.rect.y, item->window.rect.w, item->window.rect.h, 0, item->textaligny, item->window.ownerDraw, item->window.ownerDrawFlags, item->alignment, item->special, item->textscale, color, item->window.background, item->textStyle);
            } else {
                DC->ownerDrawItem(item->textRect.x + item->textRect.w, item->window.rect.y, item->window.rect.w, item->window.rect.h, 0, item->textaligny, item->window.ownerDraw, item->window.ownerDrawFlags, item->alignment, item->special, item->textscale, color, item->window.background, item->textStyle);
            }
        } else {
            DC->ownerDrawItem(item->window.rect.x, item->window.rect.y, item->window.rect.w, item->window.rect.h, item->textalignx, item->textaligny, item->window.ownerDraw, item->window.ownerDrawFlags, item->alignment, item->special, item->textscale, color, item->window.background, item->textStyle);
        }
    }
}

static void Item_Paint(itemDef_t* item)
{
    vec4_t red;
    menuDef_t* parent;

    red[0] = red[3] = 1;
    red[1] = red[2] = 0;

    if (item == NULL) {
        return;
    }

    parent = (menuDef_t*)item->parent;

    if (item->window.flags & WINDOW_ORBITING) {
        if (DC->realTime > item->window.nextTime) {
            float rx, ry, a, c, s, w, h;

            item->window.nextTime = DC->realTime + item->window.offsetTime;
            // translate
            w = item->window.rectClient.w / 2;
            h = item->window.rectClient.h / 2;
            rx = item->window.rectClient.x + w - item->window.rectEffects.x;
            ry = item->window.rectClient.y + h - item->window.rectEffects.y;
            a = 3 * M_PI / 180;
            c = cos(a);
            s = sin(a);
            item->window.rectClient.x = (rx * c - ry * s) + item->window.rectEffects.x - w;
            item->window.rectClient.y = (rx * s + ry * c) + item->window.rectEffects.y - h;
            Item_UpdatePosition(item);
        }
    }

    if (item->window.flags & WINDOW_INTRANSITION) {
        if (DC->realTime > item->window.nextTime) {
            int done = 0;
            item->window.nextTime = DC->realTime + item->window.offsetTime;
            // transition the x,y
            if (item->window.rectClient.x == item->window.rectEffects.x) {
                done++;
            } else {
                if (item->window.rectClient.x < item->window.rectEffects.x) {
                    item->window.rectClient.x += item->window.rectEffects2.x;
                    if (item->window.rectClient.x > item->window.rectEffects.x) {
                        item->window.rectClient.x = item->window.rectEffects.x;
                        done++;
                    }
                } else {
                    item->window.rectClient.x -= item->window.rectEffects2.x;
                    if (item->window.rectClient.x < item->window.rectEffects.x) {
                        item->window.rectClient.x = item->window.rectEffects.x;
                        done++;
                    }
                }
            }
            if (item->window.rectClient.y == item->window.rectEffects.y) {
                done++;
            } else {
                if (item->window.rectClient.y < item->window.rectEffects.y) {
                    item->window.rectClient.y += item->window.rectEffects2.y;
                    if (item->window.rectClient.y > item->window.rectEffects.y) {
                        item->window.rectClient.y = item->window.rectEffects.y;
                        done++;
                    }
                } else {
                    item->window.rectClient.y -= item->window.rectEffects2.y;
                    if (item->window.rectClient.y < item->window.rectEffects.y) {
                        item->window.rectClient.y = item->window.rectEffects.y;
                        done++;
                    }
                }
            }
            if (item->window.rectClient.w == item->window.rectEffects.w) {
                done++;
            } else {
                if (item->window.rectClient.w < item->window.rectEffects.w) {
                    item->window.rectClient.w += item->window.rectEffects2.w;
                    if (item->window.rectClient.w > item->window.rectEffects.w) {
                        item->window.rectClient.w = item->window.rectEffects.w;
                        done++;
                    }
                } else {
                    item->window.rectClient.w -= item->window.rectEffects2.w;
                    if (item->window.rectClient.w < item->window.rectEffects.w) {
                        item->window.rectClient.w = item->window.rectEffects.w;
                        done++;
                    }
                }
            }
            if (item->window.rectClient.h == item->window.rectEffects.h) {
                done++;
            } else {
                if (item->window.rectClient.h < item->window.rectEffects.h) {
                    item->window.rectClient.h += item->window.rectEffects2.h;
                    if (item->window.rectClient.h > item->window.rectEffects.h) {
                        item->window.rectClient.h = item->window.rectEffects.h;
                        done++;
                    }
                } else {
                    item->window.rectClient.h -= item->window.rectEffects2.h;
                    if (item->window.rectClient.h < item->window.rectEffects.h) {
                        item->window.rectClient.h = item->window.rectEffects.h;
                        done++;
                    }
                }
            }

            Item_UpdatePosition(item);

            if (done == 4) {
                item->window.flags &= ~WINDOW_INTRANSITION;
            }
        }
    }

    if (item->window.ownerDrawFlags && DC->ownerDrawVisible) {
        if (!DC->ownerDrawVisible(item->window.ownerDrawFlags)) {
            item->window.flags &= ~WINDOW_VISIBLE;
        } else {
            item->window.flags |= WINDOW_VISIBLE;
        }
    }

    if (item->cvarFlags & (CVAR_SHOW | CVAR_HIDE)) {
        if (!Item_EnableShowViaCvar(item, CVAR_SHOW)) {
            return;
        }
    }

    if (item->window.flags & WINDOW_TIMEDVISIBLE) {
    }

    if (!(item->window.flags & WINDOW_VISIBLE)) {
        return;
    }

    // paint the rect first..
    Window_Paint(&item->window, parent->fadeAmount, parent->fadeClamp, parent->fadeCycle);

    if (debugMode) {
        vec4_t color;
        rectDef_t* r = Item_CorrectedTextRect(item);
        color[1] = color[3] = 1;
        color[0] = color[2] = 0;
        DC->drawRect(r->x, r->y, r->w, r->h, 1, color);
    }

    // DC->drawRect(item->window.rect.x, item->window.rect.y, item->window.rect.w, item->window.rect.h, 1, red);

    switch (item->type) {
    case ITEM_TYPE_OWNERDRAW:
        Item_OwnerDraw_Paint(item);
        break;
    case ITEM_TYPE_TEXT:
    case ITEM_TYPE_BUTTON:
        Item_Text_Paint(item);
        break;
    case ITEM_TYPE_RADIOBUTTON:
        break;
    case ITEM_TYPE_CHECKBOX:
        break;
    case ITEM_TYPE_EDITFIELD:
    case ITEM_TYPE_NUMERICFIELD:
        Item_TextField_Paint(item);
        break;
    case ITEM_TYPE_COMBO:
        break;
    case ITEM_TYPE_LISTBOX:
        Item_ListBox_Paint(item);
        break;
    case ITEM_TYPE_MODEL:
        Item_Model_Paint(item);
        break;
    case ITEM_TYPE_YESNO:
        Item_YesNo_Paint(item);
        break;
    case ITEM_TYPE_MULTI:
        Item_Multi_Paint(item);
        break;
    case ITEM_TYPE_BIND:
        Item_Bind_Paint(item);
        break;
    case ITEM_TYPE_SLIDER:
        Item_Slider_Paint(item);
        break;
    default:
        break;
    }
}

void Menu_Init(menuDef_t* menu)
{
    memset(menu, 0, sizeof(menuDef_t));
    menu->cursorItem = -1;
    menu->fadeAmount = DC->Assets.fadeAmount;
    menu->fadeClamp = DC->Assets.fadeClamp;
    menu->fadeCycle = DC->Assets.fadeCycle;
    Window_Init(&menu->window);
}

menuDef_t* Menu_GetFocused()
{
    int i;
    for (i = 0; i < menuCount; i++) {
        if (Menus[i].window.flags & WINDOW_HASFOCUS && Menus[i].window.flags & WINDOW_VISIBLE) {
            return &Menus[i];
        }
    }
    return NULL;
}

void Menu_ScrollFeeder(menuDef_t* menu, int feeder, bool down)
{
    if (menu) {
        int i;
        for (i = 0; i < menu->itemCount; i++) {
            if (menu->items[i]->special == feeder) {
                Item_ListBox_HandleKey(menu->items[i], (down) ? K_DOWNARROW : K_UPARROW, true, true);
                return;
            }
        }
    }
}

void Menu_SetFeederSelection(menuDef_t* menu, int feeder, int index, const char* name)
{
    if (menu == NULL) {
        if (name == NULL) {
            menu = Menu_GetFocused();
        } else {
            menu = Menus_FindByName(name);
        }
    }

    if (menu) {
        int i;
        for (i = 0; i < menu->itemCount; i++) {
            if (menu->items[i]->special == feeder) {
                if (index == 0) {
                    listBoxDef_t* listPtr = (listBoxDef_t*)menu->items[i]->typeData;
                    listPtr->cursorPos = 0;
                    listPtr->startPos = 0;
                }
                menu->items[i]->cursorPos = index;
                DC->feederSelection(menu->items[i]->special, menu->items[i]->cursorPos);
                return;
            }
        }
    }
}

bool Menus_AnyFullScreenVisible()
{
    int i;
    for (i = 0; i < menuCount; i++) {
        if (Menus[i].window.flags & WINDOW_VISIBLE && Menus[i].fullScreen) {
            return true;
        }
    }
    return false;
}

menuDef_t* Menus_ActivateByName(const char* p)
{
    int i;
    menuDef_t* m = NULL;
    for (i = 0; i < menuCount; i++) {
        if (Q_stricmp(Menus[i].window.name, p) == 0) {
            m = &Menus[i];
            Menus_Activate(m);
        } else {
            Menus[i].window.flags &= ~WINDOW_HASFOCUS;
        }
    }
    Display_CloseCinematics();
    return m;
}

void Item_Init(itemDef_t* item)
{
    if (item == NULL) {
        return;
    }

    memset(item, 0, sizeof(itemDef_t));
    item->textscale = 0.55f;
    Window_Init(&item->window);
}

void Menu_HandleMouseMove(menuDef_t* menu, float x, float y)
{
    int i, pass;
    bool focusSet = false;

    itemDef_t* overItem;
    if (menu == NULL) {
        return;
    }

    if (!(menu->window.flags & (WINDOW_VISIBLE | WINDOW_FORCED))) {
        return;
    }

    if (itemCapture) {
        // Item_MouseMove(itemCapture, x, y);
        return;
    }

    if (g_waitingForKey || g_editingField) {
        return;
    }

    // FIXME: this is the whole issue of focus vs. mouse over..
    // need a better overall solution as i don't like going through everything twice
    for (pass = 0; pass < 2; pass++) {
        for (i = 0; i < menu->itemCount; i++) {
            // turn off focus each item
            // menu->items[i].window.flags &= ~WINDOW_HASFOCUS;

            if (!(menu->items[i]->window.flags & (WINDOW_VISIBLE | WINDOW_FORCED))) {
                continue;
            }

            // items can be enabled and disabled based on cvars
            if (menu->items[i]->cvarFlags & (CVAR_ENABLE | CVAR_DISABLE) && !Item_EnableShowViaCvar(menu->items[i], CVAR_ENABLE)) {
                continue;
            }

            if (menu->items[i]->cvarFlags & (CVAR_SHOW | CVAR_HIDE) && !Item_EnableShowViaCvar(menu->items[i], CVAR_SHOW)) {
                continue;
            }

            if (Rect_ContainsPoint(&menu->items[i]->window.rect, x, y)) {
                if (pass == 1) {
                    overItem = menu->items[i];
                    if (overItem->type == ITEM_TYPE_TEXT && overItem->text) {
                        if (!Rect_ContainsPoint(Item_CorrectedTextRect(overItem), x, y)) {
                            continue;
                        }
                    }
                    // if we are over an item
                    if (IsVisible(overItem->window.flags)) {
                        // different one
                        Item_MouseEnter(overItem, x, y);
                        // Item_SetMouseOver(overItem, true);

                        // if item is not a decoration see if it can take focus
                        if (!focusSet) {
                            focusSet = Item_SetFocus(overItem, x, y);
                        }
                    }
                }
            } else if (menu->items[i] && menu->items[i]->window.flags & WINDOW_MOUSEOVER) {
                Item_MouseLeave(menu->items[i]);
                Item_SetMouseOver(menu->items[i], false);
            }
        }
    }
}

void Menu_Paint(menuDef_t* menu, bool forcePaint)
{
    int i;

    if (menu == NULL) {
        return;
    }

    if (!(menu->window.flags & WINDOW_VISIBLE) && !forcePaint) {
        return;
    }

    if (menu->window.ownerDrawFlags && DC->ownerDrawVisible && !DC->ownerDrawVisible(menu->window.ownerDrawFlags)) {
        return;
    }

    if (forcePaint) {
        menu->window.flags |= WINDOW_FORCED;
    }

    // draw the background if necessary
    if (menu->fullScreen) {
        // implies a background shader
        // FIXME: make sure we have a default shader if fullscreen is set with no background
        DC->drawHandlePic(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, menu->window.background);
    } else if (menu->window.background) {
        // this allows a background shader without being full screen
        // UI_DrawHandlePic(menu->window.rect.x, menu->window.rect.y, menu->window.rect.w, menu->window.rect.h, menu->backgroundShader);
    }

    // paint the background and or border
    Window_Paint(&menu->window, menu->fadeAmount, menu->fadeClamp, menu->fadeCycle);

    for (i = 0; i < menu->itemCount; i++) {
        Item_Paint(menu->items[i]);
    }

    if (debugMode) {
        vec4_t color;
        color[0] = color[2] = color[3] = 1;
        color[1] = 0;
        DC->drawRect(menu->window.rect.x, menu->window.rect.y, menu->window.rect.w, menu->window.rect.h, 1, color);
    }
}

static void Item_ValidateTypeData(itemDef_t* item)
{
    if (item->typeData) {
        return;
    }

    if (item->type == ITEM_TYPE_LISTBOX) {
        item->typeData = UI_Alloc(sizeof(listBoxDef_t));
        memset(item->typeData, 0, sizeof(listBoxDef_t));
    } else if (item->type == ITEM_TYPE_EDITFIELD || item->type == ITEM_TYPE_NUMERICFIELD || item->type == ITEM_TYPE_YESNO || item->type == ITEM_TYPE_BIND || item->type == ITEM_TYPE_SLIDER || item->type == ITEM_TYPE_TEXT) {
        item->typeData = UI_Alloc(sizeof(editFieldDef_t));
        memset(item->typeData, 0, sizeof(editFieldDef_t));
        if (item->type == ITEM_TYPE_EDITFIELD) {
            if (!((editFieldDef_t*)item->typeData)->maxPaintChars) {
                ((editFieldDef_t*)item->typeData)->maxPaintChars = MAX_EDITFIELD;
            }
        }
    } else if (item->type == ITEM_TYPE_MULTI) {
        item->typeData = UI_Alloc(sizeof(multiDef_t));
    } else if (item->type == ITEM_TYPE_MODEL) {
        item->typeData = UI_Alloc(sizeof(modelDef_t));
    }
}

/*
===============
Keyword Hash
===============
*/

#define KEYWORDHASH_SIZE 512

typedef struct keywordHash_s {
    char* keyword;
    bool (*func)(itemDef_t* item, int handle);
    struct keywordHash_s* next;
} keywordHash_t;

static int KeywordHash_Key(char* keyword)
{
    int hash, i;

    hash = 0;
    for (i = 0; keyword[i] != '\0'; i++) {
        if (keyword[i] >= 'A' && keyword[i] <= 'Z')
            hash += (keyword[i] + ('a' - 'A')) * (119 + i);
        else
            hash += keyword[i] * (119 + i);
    }
    hash = (hash ^ (hash >> 10) ^ (hash >> 20)) & (KEYWORDHASH_SIZE - 1);
    return hash;
}

static void KeywordHash_Add(keywordHash_t* table[], keywordHash_t* key)
{
    int hash;

    hash = KeywordHash_Key(key->keyword);
    /*
            if (table[hash]) {
                    int collision = true;
            }
    */
    key->next = table[hash];
    table[hash] = key;
}

static keywordHash_t* KeywordHash_Find(keywordHash_t* table[], char* keyword)
{
    keywordHash_t* key;
    int hash;

    hash = KeywordHash_Key(keyword);
    for (key = table[hash]; key; key = key->next) {
        if (!Q_stricmp(key->keyword, keyword))
            return key;
    }
    return NULL;
}

/*
===============
Item Keyword Parse functions
===============
*/

// name <string>
static bool ItemParse_name(itemDef_t* item, int handle)
{
    if (!PC_String_Parse(handle, &item->window.name)) {
        return false;
    }
    return true;
}

// name <string>
static bool ItemParse_focusSound(itemDef_t* item, int handle)
{
    const char* temp;
    if (!PC_String_Parse(handle, &temp)) {
        return false;
    }
    item->focusSound = DC->registerSound(temp, false);
    return true;
}

// text <string>
static bool ItemParse_text(itemDef_t* item, int handle)
{
    if (!PC_String_Parse(handle, &item->text)) {
        return false;
    }
    return true;
}

// group <string>
static bool ItemParse_group(itemDef_t* item, int handle)
{
    if (!PC_String_Parse(handle, &item->window.group)) {
        return false;
    }
    return true;
}

// asset_model <string>
static bool ItemParse_asset_model(itemDef_t* item, int handle)
{
    const char* temp;
    modelDef_t* modelPtr;
    Item_ValidateTypeData(item);
    modelPtr = (modelDef_t*)item->typeData;

    if (!PC_String_Parse(handle, &temp)) {
        return false;
    }
    item->asset = DC->registerModel(temp);
    modelPtr->angle = rand() % 360;
    return true;
}

// asset_shader <string>
static bool ItemParse_asset_shader(itemDef_t* item, int handle)
{
    const char* temp;

    if (!PC_String_Parse(handle, &temp)) {
        return false;
    }
    item->asset = DC->registerShaderNoMip(temp);
    return true;
}

// model_origin <number> <number> <number>
static bool ItemParse_model_origin(itemDef_t* item, int handle)
{
    modelDef_t* modelPtr;
    Item_ValidateTypeData(item);
    modelPtr = (modelDef_t*)item->typeData;

    if (PC_Float_Parse(handle, &modelPtr->origin[0])) {
        if (PC_Float_Parse(handle, &modelPtr->origin[1])) {
            if (PC_Float_Parse(handle, &modelPtr->origin[2])) {
                return true;
            }
        }
    }
    return false;
}

// model_fovx <number>
static bool ItemParse_model_fovx(itemDef_t* item, int handle)
{
    modelDef_t* modelPtr;
    Item_ValidateTypeData(item);
    modelPtr = (modelDef_t*)item->typeData;

    if (!PC_Float_Parse(handle, &modelPtr->fov_x)) {
        return false;
    }
    return true;
}

// model_fovy <number>
static bool ItemParse_model_fovy(itemDef_t* item, int handle)
{
    modelDef_t* modelPtr;
    Item_ValidateTypeData(item);
    modelPtr = (modelDef_t*)item->typeData;

    if (!PC_Float_Parse(handle, &modelPtr->fov_y)) {
        return false;
    }
    return true;
}

// model_rotation <integer>
static bool ItemParse_model_rotation(itemDef_t* item, int handle)
{
    modelDef_t* modelPtr;
    Item_ValidateTypeData(item);
    modelPtr = (modelDef_t*)item->typeData;

    if (!PC_Int_Parse(handle, &modelPtr->rotationSpeed)) {
        return false;
    }
    return true;
}

// model_angle <integer>
static bool ItemParse_model_angle(itemDef_t* item, int handle)
{
    modelDef_t* modelPtr;
    Item_ValidateTypeData(item);
    modelPtr = (modelDef_t*)item->typeData;

    if (!PC_Int_Parse(handle, &modelPtr->angle)) {
        return false;
    }
    return true;
}

// rect <rectangle>
static bool ItemParse_rect(itemDef_t* item, int handle)
{
    if (!PC_Rect_Parse(handle, &item->window.rectClient)) {
        return false;
    }
    return true;
}

// style <integer>
static bool ItemParse_style(itemDef_t* item, int handle)
{
    if (!PC_Int_Parse(handle, &item->window.style)) {
        return false;
    }
    return true;
}

// decoration
static bool ItemParse_decoration(itemDef_t* item, int handle)
{
    item->window.flags |= WINDOW_DECORATION;
    return true;
}

// notselectable
static bool ItemParse_notselectable(itemDef_t* item, int handle)
{
    listBoxDef_t* listPtr;
    Item_ValidateTypeData(item);
    listPtr = (listBoxDef_t*)item->typeData;
    if (item->type == ITEM_TYPE_LISTBOX && listPtr) {
        listPtr->notselectable = true;
    }
    return true;
}

// manually wrapped
static bool ItemParse_wrapped(itemDef_t* item, int handle)
{
    item->window.flags |= WINDOW_WRAPPED;
    return true;
}

// auto wrapped
static bool ItemParse_autowrapped(itemDef_t* item, int handle)
{
    item->window.flags |= WINDOW_AUTOWRAPPED;
    return true;
}

// horizontalscroll
static bool ItemParse_horizontalscroll(itemDef_t* item, int handle)
{
    item->window.flags |= WINDOW_HORIZONTAL;
    return true;
}

// type <integer>
static bool ItemParse_type(itemDef_t* item, int handle)
{
    if (!PC_Int_Parse(handle, &item->type)) {
        return false;
    }
    Item_ValidateTypeData(item);
    return true;
}

// elementwidth, used for listbox image elements
// uses textalignx for storage
static bool ItemParse_elementwidth(itemDef_t* item, int handle)
{
    listBoxDef_t* listPtr;

    Item_ValidateTypeData(item);
    listPtr = (listBoxDef_t*)item->typeData;
    if (!PC_Float_Parse(handle, &listPtr->elementWidth)) {
        return false;
    }
    return true;
}

// elementheight, used for listbox image elements
// uses textaligny for storage
static bool ItemParse_elementheight(itemDef_t* item, int handle)
{
    listBoxDef_t* listPtr;

    Item_ValidateTypeData(item);
    listPtr = (listBoxDef_t*)item->typeData;
    if (!PC_Float_Parse(handle, &listPtr->elementHeight)) {
        return false;
    }
    return true;
}

// feeder <float>
static bool ItemParse_feeder(itemDef_t* item, int handle)
{
    if (!PC_Float_Parse(handle, &item->special)) {
        return false;
    }
    return true;
}

// elementtype, used to specify what type of elements a listbox contains
// uses textstyle for storage
static bool ItemParse_elementtype(itemDef_t* item, int handle)
{
    listBoxDef_t* listPtr;

    Item_ValidateTypeData(item);
    if (!item->typeData)
        return false;
    listPtr = (listBoxDef_t*)item->typeData;
    if (!PC_Int_Parse(handle, &listPtr->elementStyle)) {
        return false;
    }
    return true;
}

// columns sets a number of columns and an x pos and width per..
static bool ItemParse_columns(itemDef_t* item, int handle)
{
    int num, i;
    listBoxDef_t* listPtr;

    Item_ValidateTypeData(item);
    if (!item->typeData)
        return false;
    listPtr = (listBoxDef_t*)item->typeData;
    if (PC_Int_Parse(handle, &num)) {
        if (num > MAX_LB_COLUMNS) {
            num = MAX_LB_COLUMNS;
        }
        listPtr->numColumns = num;
        for (i = 0; i < num; i++) {
            int pos, width, maxChars;

            if (PC_Int_Parse(handle, &pos) && PC_Int_Parse(handle, &width) && PC_Int_Parse(handle, &maxChars)) {
                listPtr->columnInfo[i].pos = pos;
                listPtr->columnInfo[i].width = width;
                listPtr->columnInfo[i].maxChars = maxChars;
            } else {
                return false;
            }
        }
    } else {
        return false;
    }
    return true;
}

static bool ItemParse_border(itemDef_t* item, int handle)
{
    if (!PC_Int_Parse(handle, &item->window.border)) {
        return false;
    }
    return true;
}

static bool ItemParse_bordersize(itemDef_t* item, int handle)
{
    if (!PC_Float_Parse(handle, &item->window.borderSize)) {
        return false;
    }
    return true;
}

static bool ItemParse_visible(itemDef_t* item, int handle)
{
    int i;

    if (!PC_Int_Parse(handle, &i)) {
        return false;
    }
    if (i) {
        item->window.flags |= WINDOW_VISIBLE;
    }
    return true;
}

static bool ItemParse_ownerdraw(itemDef_t* item, int handle)
{
    if (!PC_Int_Parse(handle, &item->window.ownerDraw)) {
        return false;
    }
    item->type = ITEM_TYPE_OWNERDRAW;
    return true;
}

static bool ItemParse_align(itemDef_t* item, int handle)
{
    if (!PC_Int_Parse(handle, &item->alignment)) {
        return false;
    }
    return true;
}

static bool ItemParse_textalign(itemDef_t* item, int handle)
{
    if (!PC_Int_Parse(handle, &item->textalignment)) {
        return false;
    }
    return true;
}

static bool ItemParse_textalignx(itemDef_t* item, int handle)
{
    if (!PC_Float_Parse(handle, &item->textalignx)) {
        return false;
    }
    return true;
}

static bool ItemParse_textaligny(itemDef_t* item, int handle)
{
    if (!PC_Float_Parse(handle, &item->textaligny)) {
        return false;
    }
    return true;
}

static bool ItemParse_textscale(itemDef_t* item, int handle)
{
    if (!PC_Float_Parse(handle, &item->textscale)) {
        return false;
    }
    return true;
}

static bool ItemParse_textstyle(itemDef_t* item, int handle)
{
    if (!PC_Int_Parse(handle, &item->textStyle)) {
        return false;
    }
    return true;
}

static bool ItemParse_backcolor(itemDef_t* item, int handle)
{
    int i;
    float f;

    for (i = 0; i < 4; i++) {
        if (!PC_Float_Parse(handle, &f)) {
            return false;
        }
        item->window.backColor[i] = f;
    }
    return true;
}

static bool ItemParse_forecolor(itemDef_t* item, int handle)
{
    int i;
    float f;

    for (i = 0; i < 4; i++) {
        if (!PC_Float_Parse(handle, &f)) {
            return false;
        }
        item->window.foreColor[i] = f;
        item->window.flags |= WINDOW_FORECOLORSET;
    }
    return true;
}

static bool ItemParse_bordercolor(itemDef_t* item, int handle)
{
    int i;
    float f;

    for (i = 0; i < 4; i++) {
        if (!PC_Float_Parse(handle, &f)) {
            return false;
        }
        item->window.borderColor[i] = f;
    }
    return true;
}

static bool ItemParse_outlinecolor(itemDef_t* item, int handle)
{
    if (!PC_Color_Parse(handle, &item->window.outlineColor)) {
        return false;
    }
    return true;
}

static bool ItemParse_background(itemDef_t* item, int handle)
{
    const char* temp;

    if (!PC_String_Parse(handle, &temp)) {
        return false;
    }
    item->window.background = DC->registerShaderNoMip(temp);
    return true;
}

static bool ItemParse_cinematic(itemDef_t* item, int handle)
{
    if (!PC_String_Parse(handle, &item->window.cinematicName)) {
        return false;
    }
    return true;
}

static bool ItemParse_doubleClick(itemDef_t* item, int handle)
{
    listBoxDef_t* listPtr;

    Item_ValidateTypeData(item);
    if (!item->typeData) {
        return false;
    }

    listPtr = (listBoxDef_t*)item->typeData;

    if (!PC_Script_Parse(handle, &listPtr->doubleClick)) {
        return false;
    }
    return true;
}

static bool ItemParse_onFocus(itemDef_t* item, int handle)
{
    if (!PC_Script_Parse(handle, &item->onFocus)) {
        return false;
    }
    return true;
}

static bool ItemParse_leaveFocus(itemDef_t* item, int handle)
{
    if (!PC_Script_Parse(handle, &item->leaveFocus)) {
        return false;
    }
    return true;
}

static bool ItemParse_mouseEnter(itemDef_t* item, int handle)
{
    if (!PC_Script_Parse(handle, &item->mouseEnter)) {
        return false;
    }
    return true;
}

static bool ItemParse_mouseExit(itemDef_t* item, int handle)
{
    if (!PC_Script_Parse(handle, &item->mouseExit)) {
        return false;
    }
    return true;
}

static bool ItemParse_mouseEnterText(itemDef_t* item, int handle)
{
    if (!PC_Script_Parse(handle, &item->mouseEnterText)) {
        return false;
    }
    return true;
}

static bool ItemParse_mouseExitText(itemDef_t* item, int handle)
{
    if (!PC_Script_Parse(handle, &item->mouseExitText)) {
        return false;
    }
    return true;
}

static bool ItemParse_action(itemDef_t* item, int handle)
{
    if (!PC_Script_Parse(handle, &item->action)) {
        return false;
    }
    return true;
}

static bool ItemParse_special(itemDef_t* item, int handle)
{
    if (!PC_Float_Parse(handle, &item->special)) {
        return false;
    }
    return true;
}

static bool ItemParse_cvarTest(itemDef_t* item, int handle)
{
    if (!PC_String_Parse(handle, &item->cvarTest)) {
        return false;
    }
    return true;
}

static bool ItemParse_cvar(itemDef_t* item, int handle)
{
    editFieldDef_t* editPtr;

    Item_ValidateTypeData(item);
    if (!PC_String_Parse(handle, &item->cvar)) {
        return false;
    }
    if (item->typeData) {
        editPtr = (editFieldDef_t*)item->typeData;
        editPtr->minVal = -1;
        editPtr->maxVal = -1;
        editPtr->defVal = -1;
    }
    return true;
}

static bool ItemParse_maxChars(itemDef_t* item, int handle)
{
    editFieldDef_t* editPtr;
    int maxChars;

    Item_ValidateTypeData(item);
    if (!item->typeData)
        return false;

    if (!PC_Int_Parse(handle, &maxChars)) {
        return false;
    }
    editPtr = (editFieldDef_t*)item->typeData;
    editPtr->maxChars = maxChars;
    return true;
}

static bool ItemParse_maxPaintChars(itemDef_t* item, int handle)
{
    editFieldDef_t* editPtr;
    int maxChars;

    Item_ValidateTypeData(item);
    if (!item->typeData)
        return false;

    if (!PC_Int_Parse(handle, &maxChars)) {
        return false;
    }
    editPtr = (editFieldDef_t*)item->typeData;
    editPtr->maxPaintChars = maxChars;
    return true;
}

static bool ItemParse_cvarFloat(itemDef_t* item, int handle)
{
    editFieldDef_t* editPtr;

    Item_ValidateTypeData(item);
    if (!item->typeData)
        return false;
    editPtr = (editFieldDef_t*)item->typeData;
    if (PC_String_Parse(handle, &item->cvar) && PC_Float_Parse(handle, &editPtr->defVal) && PC_Float_Parse(handle, &editPtr->minVal) && PC_Float_Parse(handle, &editPtr->maxVal)) {
        return true;
    }
    return false;
}

static bool ItemParse_cvarStrList(itemDef_t* item, int handle)
{
    pc_token_t token;
    multiDef_t* multiPtr;
    int pass;

    Item_ValidateTypeData(item);
    if (!item->typeData)
        return false;
    multiPtr = (multiDef_t*)item->typeData;
    multiPtr->count = 0;
    multiPtr->strDef = true;
    multiPtr->videoMode = false;

    if (!trap_PC_ReadToken(handle, &token))
        return false;
    if (*token.string != '{') {
        return false;
    }

    pass = 0;
    while (1) {
        if (!trap_PC_ReadToken(handle, &token)) {
            PC_SourceError(handle, "end of file inside menu item");
            return false;
        }

        if (*token.string == '}') {
            return true;
        }

        if (*token.string == ',' || *token.string == ';') {
            continue;
        }

        if (pass == 0) {
            multiPtr->cvarList[multiPtr->count] = String_Alloc(token.string);
            pass = 1;
        } else {
            multiPtr->cvarStr[multiPtr->count] = String_Alloc(token.string);
            pass = 0;
            multiPtr->count++;
            if (multiPtr->count >= MAX_MULTI_CVARS) {
                return false;
            }
        }
    }
    return false;
}

static bool ItemParse_cvarFloatList(itemDef_t* item, int handle)
{
    pc_token_t token;
    multiDef_t* multiPtr;

    Item_ValidateTypeData(item);
    if (!item->typeData)
        return false;
    multiPtr = (multiDef_t*)item->typeData;
    multiPtr->count = 0;
    multiPtr->strDef = false;
    multiPtr->videoMode = false;

    if (!trap_PC_ReadToken(handle, &token))
        return false;
    if (*token.string != '{') {
        return false;
    }

    while (1) {
        if (!trap_PC_ReadToken(handle, &token)) {
            PC_SourceError(handle, "end of file inside menu item");
            return false;
        }

        if (*token.string == '}') {
            return true;
        }

        if (*token.string == ',' || *token.string == ';') {
            continue;
        }

        multiPtr->cvarList[multiPtr->count] = String_Alloc(token.string);
        if (!PC_Float_Parse(handle, &multiPtr->cvarValue[multiPtr->count])) {
            return false;
        }

        multiPtr->count++;
        if (multiPtr->count >= MAX_MULTI_CVARS) {
            return false;
        }
    }
    return false;
}

static bool ItemParse_addColorRange(itemDef_t* item, int handle)
{
    colorRangeDef_t color;

    if (PC_Float_Parse(handle, &color.low) && PC_Float_Parse(handle, &color.high) && PC_Color_Parse(handle, &color.color)) {
        if (item->numColors < MAX_COLOR_RANGES) {
            memcpy(&item->colorRanges[item->numColors], &color, sizeof(color));
            item->numColors++;
        }
        return true;
    }
    return false;
}

static bool ItemParse_ownerdrawFlag(itemDef_t* item, int handle)
{
    int i;
    if (!PC_Int_Parse(handle, &i)) {
        return false;
    }
    item->window.ownerDrawFlags |= i;
    return true;
}

static bool ItemParse_enableCvar(itemDef_t* item, int handle)
{
    if (PC_Script_Parse(handle, &item->enableCvar)) {
        item->cvarFlags = CVAR_ENABLE;
        return true;
    }
    return false;
}

static bool ItemParse_disableCvar(itemDef_t* item, int handle)
{
    if (PC_Script_Parse(handle, &item->enableCvar)) {
        item->cvarFlags = CVAR_DISABLE;
        return true;
    }
    return false;
}

static bool ItemParse_showCvar(itemDef_t* item, int handle)
{
    if (PC_Script_Parse(handle, &item->enableCvar)) {
        item->cvarFlags = CVAR_SHOW;
        return true;
    }
    return false;
}

static bool ItemParse_hideCvar(itemDef_t* item, int handle)
{
    if (PC_Script_Parse(handle, &item->enableCvar)) {
        item->cvarFlags = CVAR_HIDE;
        return true;
    }
    return false;
}

static keywordHash_t itemParseKeywords[] = {
    { "name", ItemParse_name, NULL },
    { "text", ItemParse_text, NULL },
    { "group", ItemParse_group, NULL },
    { "asset_model", ItemParse_asset_model, NULL },
    { "asset_shader", ItemParse_asset_shader, NULL },
    { "model_origin", ItemParse_model_origin, NULL },
    { "model_fovx", ItemParse_model_fovx, NULL },
    { "model_fovy", ItemParse_model_fovy, NULL },
    { "model_rotation", ItemParse_model_rotation, NULL },
    { "model_angle", ItemParse_model_angle, NULL },
    { "rect", ItemParse_rect, NULL },
    { "style", ItemParse_style, NULL },
    { "decoration", ItemParse_decoration, NULL },
    { "notselectable", ItemParse_notselectable, NULL },
    { "wrapped", ItemParse_wrapped, NULL },
    { "autowrapped", ItemParse_autowrapped, NULL },
    { "horizontalscroll", ItemParse_horizontalscroll, NULL },
    { "type", ItemParse_type, NULL },
    { "elementwidth", ItemParse_elementwidth, NULL },
    { "elementheight", ItemParse_elementheight, NULL },
    { "feeder", ItemParse_feeder, NULL },
    { "elementtype", ItemParse_elementtype, NULL },
    { "columns", ItemParse_columns, NULL },
    { "border", ItemParse_border, NULL },
    { "bordersize", ItemParse_bordersize, NULL },
    { "visible", ItemParse_visible, NULL },
    { "ownerdraw", ItemParse_ownerdraw, NULL },
    { "align", ItemParse_align, NULL },
    { "textalign", ItemParse_textalign, NULL },
    { "textalignx", ItemParse_textalignx, NULL },
    { "textaligny", ItemParse_textaligny, NULL },
    { "textscale", ItemParse_textscale, NULL },
    { "textstyle", ItemParse_textstyle, NULL },
    { "backcolor", ItemParse_backcolor, NULL },
    { "forecolor", ItemParse_forecolor, NULL },
    { "bordercolor", ItemParse_bordercolor, NULL },
    { "outlinecolor", ItemParse_outlinecolor, NULL },
    { "background", ItemParse_background, NULL },
    { "onFocus", ItemParse_onFocus, NULL },
    { "leaveFocus", ItemParse_leaveFocus, NULL },
    { "mouseEnter", ItemParse_mouseEnter, NULL },
    { "mouseExit", ItemParse_mouseExit, NULL },
    { "mouseEnterText", ItemParse_mouseEnterText, NULL },
    { "mouseExitText", ItemParse_mouseExitText, NULL },
    { "action", ItemParse_action, NULL },
    { "special", ItemParse_special, NULL },
    { "cvar", ItemParse_cvar, NULL },
    { "maxChars", ItemParse_maxChars, NULL },
    { "maxPaintChars", ItemParse_maxPaintChars, NULL },
    { "focusSound", ItemParse_focusSound, NULL },
    { "cvarFloat", ItemParse_cvarFloat, NULL },
    { "cvarStrList", ItemParse_cvarStrList, NULL },
    { "cvarFloatList", ItemParse_cvarFloatList, NULL },
    { "addColorRange", ItemParse_addColorRange, NULL },
    { "ownerdrawFlag", ItemParse_ownerdrawFlag, NULL },
    { "enableCvar", ItemParse_enableCvar, NULL },
    { "cvarTest", ItemParse_cvarTest, NULL },
    { "disableCvar", ItemParse_disableCvar, NULL },
    { "showCvar", ItemParse_showCvar, NULL },
    { "hideCvar", ItemParse_hideCvar, NULL },
    { "cinematic", ItemParse_cinematic, NULL },
    { "doubleclick", ItemParse_doubleClick, NULL },
    { NULL, 0, NULL }
};

keywordHash_t* itemParseKeywordHash[KEYWORDHASH_SIZE];

void Item_SetupKeywordHash()
{
    int i;

    memset(itemParseKeywordHash, 0, sizeof(itemParseKeywordHash));
    for (i = 0; itemParseKeywords[i].keyword; i++) {
        KeywordHash_Add(itemParseKeywordHash, &itemParseKeywords[i]);
    }
}

static const char* builtinResolutions[] = {
    "320x240",
    "400x300",
    "512x384",
    "640x480",
    "800x600",
    "960x720",
    "1024x768",
    "1152x864",
    "1280x1024",
    "1600x1200",
    "2048x1536",
    "856x480",
    NULL
};

static const char* knownRatios[][2] = {
    { "1.25:1", "5:4" },
    { "1.33:1", "4:3" },
    { "1.50:1", "3:2" },
    { "1.56:1", "14:9" },
    { "1.60:1", "16:10" },
    { "1.67:1", "5:3" },
    { "1.78:1", "16:9" },
    { NULL, NULL }
};

static void UI_ResolutionToAspect(const char* resolution, char* aspect, size_t aspectLength)
{
    int i, w, h;
    char* x;
    char str[8];

    // calculate resolution's aspect ratio
    x = strchr(resolution, 'x') + 1;
    Q_strncpyz(str, resolution, MIN(x - resolution, sizeof(str)));
    w = atoi(str);
    h = atoi(x);
    Com_sprintf(aspect, aspectLength, "%.2f:1", (float)w / (float)h);

    // rename common ratios ("1.33:1" -> "4:3")
    for (i = 0; knownRatios[i][0]; i++) {
        if (!Q_stricmp(aspect, knownRatios[i][0])) {
            Q_strncpyz(aspect, knownRatios[i][1], aspectLength);
            break;
        }
    }
}

/*
===============
Item_ApplyHacks

Hacks to fix issues with Team Arena menu scripts
===============
*/
static void Item_ApplyHacks(itemDef_t* item)
{

    // Fix length of favorite address in createfavorite.menu
    if (item->type == ITEM_TYPE_EDITFIELD && item->cvar && !Q_stricmp(item->cvar, "ui_favoriteAddress")) {
        editFieldDef_t* editField = (editFieldDef_t*)item->typeData;

        // enough to hold an IPv6 address plus null
        if (editField->maxChars < 48) {
            Com_Printf("Extended create favorite address edit field length to hold an IPv6 address\n");
            editField->maxChars = 48;
        }
    }

    if (item->type == ITEM_TYPE_EDITFIELD && item->cvar && (!Q_stricmp(item->cvar, "ui_Name") || !Q_stricmp(item->cvar, "ui_findplayer"))) {
        editFieldDef_t* editField = (editFieldDef_t*)item->typeData;

        // enough to hold a full player name
        if (editField->maxChars < MAX_NAME_LENGTH) {
            if (editField->maxPaintChars > editField->maxChars) {
                editField->maxPaintChars = editField->maxChars;
            }

            Com_Printf("Extended player name field using cvar %s to %d characters\n", item->cvar, MAX_NAME_LENGTH);
            editField->maxChars = MAX_NAME_LENGTH;
        }
    }

    // Replace mode list and use a temporary ui_videomode cvar for handling custom modes
    if (item->type == ITEM_TYPE_MULTI && item->cvar && !Q_stricmp(item->cvar, "r_mode")) {
        multiDef_t* multiPtr = (multiDef_t*)item->typeData;
        int i, oldCount;
        char resbuf[MAX_STRING_CHARS];
        char modeName[32], aspect[8];

        item->cvar = "ui_videomode";
        multiPtr->strDef = true;
        multiPtr->videoMode = true;

        oldCount = multiPtr->count;
        multiPtr->count = 0;

        DC->getCVarString("r_availableModes", resbuf, sizeof(resbuf));

        if (*resbuf) {
            char *s = resbuf, *mode;

            while (s && multiPtr->count < MAX_MULTI_CVARS) {
                mode = s;

                s = strchr(s, ' ');
                if (s)
                    *s++ = '\0';

                UI_ResolutionToAspect(mode, aspect, sizeof(aspect));
                Com_sprintf(modeName, sizeof(modeName), "%s (%s)", mode, aspect);

                multiPtr->cvarList[multiPtr->count] = String_Alloc(modeName);

                for (i = 0; builtinResolutions[i]; i++) {
                    if (!Q_stricmp(builtinResolutions[i], mode)) {
                        multiPtr->cvarStr[multiPtr->count] = builtinResolutions[i];
                        multiPtr->cvarValue[multiPtr->count] = i;
                        break;
                    }
                }

                if (builtinResolutions[i] == NULL) {
                    multiPtr->cvarStr[multiPtr->count] = String_Alloc(mode);
                    multiPtr->cvarValue[multiPtr->count] = -1;
                }

                multiPtr->count++;
            }
        } else {
            for (i = 0; builtinResolutions[i] && multiPtr->count < MAX_MULTI_CVARS; i++) {
                UI_ResolutionToAspect(builtinResolutions[i], aspect, sizeof(aspect));
                Com_sprintf(modeName, sizeof(modeName), "%s (%s)", builtinResolutions[i], aspect);

                multiPtr->cvarList[multiPtr->count] = String_Alloc(modeName);
                multiPtr->cvarStr[multiPtr->count] = builtinResolutions[i];
                multiPtr->cvarValue[multiPtr->count] = i;
                multiPtr->count++;
            }
        }

        // Add custom resolution if not in mode list
        if (multiPtr->count < MAX_MULTI_CVARS) {
            char currentResolution[20];

            Com_sprintf(currentResolution, sizeof(currentResolution), "%dx%d", DC->glconfig.vidWidth, DC->glconfig.vidHeight);
            for (i = 0; i < multiPtr->count; i++) {
                if (!Q_stricmp(multiPtr->cvarStr[i], currentResolution)) {
                    break;
                }
            }

            if (i == multiPtr->count) {
                UI_ResolutionToAspect(currentResolution, aspect, sizeof(aspect));
                Com_sprintf(modeName, sizeof(modeName), "%s (%s)", currentResolution, aspect);

                multiPtr->cvarList[multiPtr->count] = String_Alloc(modeName);
                multiPtr->cvarStr[multiPtr->count] = String_Alloc(currentResolution);
                multiPtr->cvarValue[multiPtr->count] = -1;
                multiPtr->count++;
            }
        }

        Com_Printf("Found video mode list with %d modes, replaced list with %d modes\n", oldCount, multiPtr->count);
    }
}

static bool Item_Parse(int handle, itemDef_t* item)
{
    pc_token_t token;
    keywordHash_t* key;

    if (!trap_PC_ReadToken(handle, &token))
        return false;
    if (*token.string != '{') {
        return false;
    }
    while (1) {
        if (!trap_PC_ReadToken(handle, &token)) {
            PC_SourceError(handle, "end of file inside menu item");
            return false;
        }

        if (*token.string == '}') {
            Item_ApplyHacks(item);
            return true;
        }

        key = KeywordHash_Find(itemParseKeywordHash, token.string);
        if (!key) {
            PC_SourceError(handle, "unknown menu item keyword %s", token.string);
            continue;
        }
        if (!key->func(item, handle)) {
            PC_SourceError(handle, "couldn't parse menu item keyword %s", token.string);
            return false;
        }
    }
    return false;
}

// Item_InitControls
// inits special control types
static void Item_InitControls(itemDef_t* item)
{
    if (item == NULL) {
        return;
    }
    if (item->type == ITEM_TYPE_LISTBOX) {
        listBoxDef_t* listPtr = (listBoxDef_t*)item->typeData;
        item->cursorPos = 0;
        if (listPtr) {
            listPtr->cursorPos = 0;
            listPtr->startPos = 0;
            listPtr->endPos = 0;
            listPtr->cursorPos = 0;
        }
    }
}

/*
===============
Menu Keyword Parse functions
===============
*/

static bool MenuParse_font(itemDef_t* item, int handle)
{
    menuDef_t* menu = (menuDef_t*)item;
    if (!PC_String_Parse(handle, &menu->font)) {
        return false;
    }
    if (!DC->Assets.fontRegistered) {
        DC->registerFont(menu->font, 48, &DC->Assets.textFont);
        DC->Assets.fontRegistered = true;
    }
    return true;
}

static bool MenuParse_name(itemDef_t* item, int handle)
{
    menuDef_t* menu = (menuDef_t*)item;
    if (!PC_String_Parse(handle, &menu->window.name)) {
        return false;
    }
    if (Q_stricmp(menu->window.name, "main") == 0) {
        // default main as having focus
        // menu->window.flags |= WINDOW_HASFOCUS;
    }
    return true;
}

static bool MenuParse_fullscreen(itemDef_t* item, int handle)
{
    menuDef_t* menu = (menuDef_t*)item;
    union {
        bool b;
        int i;
    } fullScreen;

    if (!PC_Int_Parse(handle, &fullScreen.i)) {
        return false;
    }
    menu->fullScreen = fullScreen.b;
    return true;
}

static bool MenuParse_rect(itemDef_t* item, int handle)
{
    menuDef_t* menu = (menuDef_t*)item;
    if (!PC_Rect_Parse(handle, &menu->window.rect)) {
        return false;
    }
    return true;
}

static bool MenuParse_style(itemDef_t* item, int handle)
{
    menuDef_t* menu = (menuDef_t*)item;
    if (!PC_Int_Parse(handle, &menu->window.style)) {
        return false;
    }
    return true;
}

static bool MenuParse_visible(itemDef_t* item, int handle)
{
    int i;
    menuDef_t* menu = (menuDef_t*)item;

    if (!PC_Int_Parse(handle, &i)) {
        return false;
    }
    if (i) {
        menu->window.flags |= WINDOW_VISIBLE;
    }
    return true;
}

static bool MenuParse_onOpen(itemDef_t* item, int handle)
{
    menuDef_t* menu = (menuDef_t*)item;
    if (!PC_Script_Parse(handle, &menu->onOpen)) {
        return false;
    }
    return true;
}

static bool MenuParse_onClose(itemDef_t* item, int handle)
{
    menuDef_t* menu = (menuDef_t*)item;
    if (!PC_Script_Parse(handle, &menu->onClose)) {
        return false;
    }
    return true;
}

static bool MenuParse_onESC(itemDef_t* item, int handle)
{
    menuDef_t* menu = (menuDef_t*)item;
    if (!PC_Script_Parse(handle, &menu->onESC)) {
        return false;
    }
    return true;
}

static bool MenuParse_border(itemDef_t* item, int handle)
{
    menuDef_t* menu = (menuDef_t*)item;
    if (!PC_Int_Parse(handle, &menu->window.border)) {
        return false;
    }
    return true;
}

static bool MenuParse_borderSize(itemDef_t* item, int handle)
{
    menuDef_t* menu = (menuDef_t*)item;
    if (!PC_Float_Parse(handle, &menu->window.borderSize)) {
        return false;
    }
    return true;
}

static bool MenuParse_backcolor(itemDef_t* item, int handle)
{
    int i;
    float f;
    menuDef_t* menu = (menuDef_t*)item;

    for (i = 0; i < 4; i++) {
        if (!PC_Float_Parse(handle, &f)) {
            return false;
        }
        menu->window.backColor[i] = f;
    }
    return true;
}

static bool MenuParse_forecolor(itemDef_t* item, int handle)
{
    int i;
    float f;
    menuDef_t* menu = (menuDef_t*)item;

    for (i = 0; i < 4; i++) {
        if (!PC_Float_Parse(handle, &f)) {
            return false;
        }
        menu->window.foreColor[i] = f;
        menu->window.flags |= WINDOW_FORECOLORSET;
    }
    return true;
}

static bool MenuParse_bordercolor(itemDef_t* item, int handle)
{
    int i;
    float f;
    menuDef_t* menu = (menuDef_t*)item;

    for (i = 0; i < 4; i++) {
        if (!PC_Float_Parse(handle, &f)) {
            return false;
        }
        menu->window.borderColor[i] = f;
    }
    return true;
}

static bool MenuParse_focuscolor(itemDef_t* item, int handle)
{
    int i;
    float f;
    menuDef_t* menu = (menuDef_t*)item;

    for (i = 0; i < 4; i++) {
        if (!PC_Float_Parse(handle, &f)) {
            return false;
        }
        menu->focusColor[i] = f;
    }
    return true;
}

static bool MenuParse_disablecolor(itemDef_t* item, int handle)
{
    int i;
    float f;
    menuDef_t* menu = (menuDef_t*)item;
    for (i = 0; i < 4; i++) {
        if (!PC_Float_Parse(handle, &f)) {
            return false;
        }
        menu->disableColor[i] = f;
    }
    return true;
}

static bool MenuParse_outlinecolor(itemDef_t* item, int handle)
{
    menuDef_t* menu = (menuDef_t*)item;
    if (!PC_Color_Parse(handle, &menu->window.outlineColor)) {
        return false;
    }
    return true;
}

static bool MenuParse_background(itemDef_t* item, int handle)
{
    const char* buff;
    menuDef_t* menu = (menuDef_t*)item;

    if (!PC_String_Parse(handle, &buff)) {
        return false;
    }
    menu->window.background = DC->registerShaderNoMip(buff);
    return true;
}

static bool MenuParse_cinematic(itemDef_t* item, int handle)
{
    menuDef_t* menu = (menuDef_t*)item;

    if (!PC_String_Parse(handle, &menu->window.cinematicName)) {
        return false;
    }
    return true;
}

static bool MenuParse_ownerdrawFlag(itemDef_t* item, int handle)
{
    int i;
    menuDef_t* menu = (menuDef_t*)item;

    if (!PC_Int_Parse(handle, &i)) {
        return false;
    }
    menu->window.ownerDrawFlags |= i;
    return true;
}

static bool MenuParse_ownerdraw(itemDef_t* item, int handle)
{
    menuDef_t* menu = (menuDef_t*)item;

    if (!PC_Int_Parse(handle, &menu->window.ownerDraw)) {
        return false;
    }
    return true;
}

// decoration
static bool MenuParse_popup(itemDef_t* item, int handle)
{
    menuDef_t* menu = (menuDef_t*)item;
    menu->window.flags |= WINDOW_POPUP;
    return true;
}

static bool MenuParse_outOfBounds(itemDef_t* item, int handle)
{
    menuDef_t* menu = (menuDef_t*)item;

    menu->window.flags |= WINDOW_OOB_CLICK;
    return true;
}

static bool MenuParse_soundLoop(itemDef_t* item, int handle)
{
    menuDef_t* menu = (menuDef_t*)item;

    if (!PC_String_Parse(handle, &menu->soundName)) {
        return false;
    }
    return true;
}

static bool MenuParse_fadeClamp(itemDef_t* item, int handle)
{
    menuDef_t* menu = (menuDef_t*)item;

    if (!PC_Float_Parse(handle, &menu->fadeClamp)) {
        return false;
    }
    return true;
}

static bool MenuParse_fadeAmount(itemDef_t* item, int handle)
{
    menuDef_t* menu = (menuDef_t*)item;

    if (!PC_Float_Parse(handle, &menu->fadeAmount)) {
        return false;
    }
    return true;
}

static bool MenuParse_fadeCycle(itemDef_t* item, int handle)
{
    menuDef_t* menu = (menuDef_t*)item;

    if (!PC_Int_Parse(handle, &menu->fadeCycle)) {
        return false;
    }
    return true;
}

static bool MenuParse_itemDef(itemDef_t* item, int handle)
{
    menuDef_t* menu = (menuDef_t*)item;
    if (menu->itemCount < MAX_MENUITEMS) {
        menu->items[menu->itemCount] = UI_Alloc(sizeof(itemDef_t));
        if (!menu->items[menu->itemCount]) {
            return false;
        }
        Item_Init(menu->items[menu->itemCount]);
        if (!Item_Parse(handle, menu->items[menu->itemCount])) {
            return false;
        }
        Item_InitControls(menu->items[menu->itemCount]);
        menu->items[menu->itemCount++]->parent = menu;
    }
    return true;
}

static keywordHash_t menuParseKeywords[] = {
    { "font", MenuParse_font, NULL },
    { "name", MenuParse_name, NULL },
    { "fullscreen", MenuParse_fullscreen, NULL },
    { "rect", MenuParse_rect, NULL },
    { "style", MenuParse_style, NULL },
    { "visible", MenuParse_visible, NULL },
    { "onOpen", MenuParse_onOpen, NULL },
    { "onClose", MenuParse_onClose, NULL },
    { "onESC", MenuParse_onESC, NULL },
    { "border", MenuParse_border, NULL },
    { "borderSize", MenuParse_borderSize, NULL },
    { "backcolor", MenuParse_backcolor, NULL },
    { "forecolor", MenuParse_forecolor, NULL },
    { "bordercolor", MenuParse_bordercolor, NULL },
    { "focuscolor", MenuParse_focuscolor, NULL },
    { "disablecolor", MenuParse_disablecolor, NULL },
    { "outlinecolor", MenuParse_outlinecolor, NULL },
    { "background", MenuParse_background, NULL },
    { "ownerdraw", MenuParse_ownerdraw, NULL },
    { "ownerdrawFlag", MenuParse_ownerdrawFlag, NULL },
    { "outOfBoundsClick", MenuParse_outOfBounds, NULL },
    { "soundLoop", MenuParse_soundLoop, NULL },
    { "itemDef", MenuParse_itemDef, NULL },
    { "cinematic", MenuParse_cinematic, NULL },
    { "popup", MenuParse_popup, NULL },
    { "fadeClamp", MenuParse_fadeClamp, NULL },
    { "fadeCycle", MenuParse_fadeCycle, NULL },
    { "fadeAmount", MenuParse_fadeAmount, NULL },
    { NULL, 0, NULL }
};

keywordHash_t* menuParseKeywordHash[KEYWORDHASH_SIZE];

void Menu_SetupKeywordHash()
{
    int i;

    memset(menuParseKeywordHash, 0, sizeof(menuParseKeywordHash));
    for (i = 0; menuParseKeywords[i].keyword; i++) {
        KeywordHash_Add(menuParseKeywordHash, &menuParseKeywords[i]);
    }
}

static bool Menu_Parse(int handle, menuDef_t* menu)
{
    pc_token_t token;
    keywordHash_t* key;

    if (!trap_PC_ReadToken(handle, &token))
        return false;
    if (*token.string != '{') {
        return false;
    }

    while (1) {

        memset(&token, 0, sizeof(pc_token_t));
        if (!trap_PC_ReadToken(handle, &token)) {
            PC_SourceError(handle, "end of file inside menu");
            return false;
        }

        if (*token.string == '}') {
            return true;
        }

        key = KeywordHash_Find(menuParseKeywordHash, token.string);
        if (!key) {
            PC_SourceError(handle, "unknown menu keyword %s", token.string);
            continue;
        }
        if (!key->func((itemDef_t*)menu, handle)) {
            PC_SourceError(handle, "couldn't parse menu keyword %s", token.string);
            return false;
        }
    }
    return false;
}

void Menu_New(int handle)
{
    menuDef_t* menu = &Menus[menuCount];

    if (menuCount < MAX_MENUS) {
        Menu_Init(menu);
        if (Menu_Parse(handle, menu)) {
            Menu_PostParse(menu);
            menuCount++;
        }
    }
}

int Menu_Count()
{
    return menuCount;
}

void Menu_PaintAll()
{
    int i;
    if (captureFunc) {
        captureFunc(captureData);
    }

    for (i = 0; i < Menu_Count(); i++) {
        Menu_Paint(&Menus[i], false);
    }

    if (debugMode) {
        vec4_t v = { 1, 1, 1, 1 };
        DC->drawText(5, 25, .5, v, va("fps: %f", DC->FPS), 0, 0, 0);
    }
}

void Menu_Reset()
{
    menuCount = 0;
}

void* Display_CaptureItem(int x, int y)
{
    int i;

    for (i = 0; i < menuCount; i++) {
        // turn off focus each item
        // menu->items[i].window.flags &= ~WINDOW_HASFOCUS;
        if (Rect_ContainsPoint(&Menus[i].window.rect, x, y)) {
            return &Menus[i];
        }
    }
    return NULL;
}

// FIXME:
bool Display_MouseMove(void* p, int x, int y)
{
    int i;
    menuDef_t* menu = p;

    if (menu == NULL) {
        menu = Menu_GetFocused();
        if (menu) {
            if (menu->window.flags & WINDOW_POPUP) {
                Menu_HandleMouseMove(menu, x, y);
                return true;
            }
        }
        for (i = 0; i < menuCount; i++) {
            Menu_HandleMouseMove(&Menus[i], x, y);
        }
    } else {
        menu->window.rect.x += x;
        menu->window.rect.y += y;
        Menu_UpdatePosition(menu);
    }
    return true;
}

int Display_CursorType(int x, int y)
{
    int i;
    for (i = 0; i < menuCount; i++) {
        rectDef_t r2;
        r2.x = Menus[i].window.rect.x - 3;
        r2.y = Menus[i].window.rect.y - 3;
        r2.w = r2.h = 7;
        if (Rect_ContainsPoint(&r2, x, y)) {
            return CURSOR_SIZER;
        }
    }
    return CURSOR_ARROW;
}

void Display_HandleKey(int key, bool down, int x, int y)
{
    menuDef_t* menu = Display_CaptureItem(x, y);
    if (menu == NULL) {
        menu = Menu_GetFocused();
    }
    if (menu) {
        Menu_HandleKey(menu, key, down);
    }
}

static void Window_CacheContents(windowDef_t* window)
{
    if (window) {
        if (window->cinematicName) {
            int cin = DC->playCinematic(window->cinematicName, 0, 0, 0, 0);
            DC->stopCinematic(cin);
        }
    }
}

static void Item_CacheContents(itemDef_t* item)
{
    if (item) {
        Window_CacheContents(&item->window);
    }
}

static void Menu_CacheContents(menuDef_t* menu)
{
    if (menu) {
        int i;
        Window_CacheContents(&menu->window);
        for (i = 0; i < menu->itemCount; i++) {
            Item_CacheContents(menu->items[i]);
        }

        if (menu->soundName && *menu->soundName) {
            DC->registerSound(menu->soundName, false);
        }
    }
}

void Display_CacheAll()
{
    int i;
    for (i = 0; i < menuCount; i++) {
        Menu_CacheContents(&Menus[i]);
    }
}

static bool Menu_OverActiveItem(menuDef_t* menu, float x, float y)
{
    if (menu && menu->window.flags & (WINDOW_VISIBLE | WINDOW_FORCED)) {
        if (Rect_ContainsPoint(&menu->window.rect, x, y)) {
            int i;
            for (i = 0; i < menu->itemCount; i++) {
                // turn off focus each item
                // menu->items[i].window.flags &= ~WINDOW_HASFOCUS;

                if (!(menu->items[i]->window.flags & (WINDOW_VISIBLE | WINDOW_FORCED))) {
                    continue;
                }

                if (menu->items[i]->window.flags & WINDOW_DECORATION) {
                    continue;
                }

                if (Rect_ContainsPoint(&menu->items[i]->window.rect, x, y)) {
                    itemDef_t* overItem = menu->items[i];
                    if (overItem->type == ITEM_TYPE_TEXT && overItem->text) {
                        if (Rect_ContainsPoint(Item_CorrectedTextRect(overItem), x, y)) {
                            return true;
                        } else {
                            continue;
                        }
                    } else {
                        return true;
                    }
                }
            }
        }
    }
    return false;
}
