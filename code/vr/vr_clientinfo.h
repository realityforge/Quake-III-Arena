#if !defined(vr_clientinfo_h)
#define vr_clientinfo_h

#include "vr_base.h"

#define NUM_WEAPON_SAMPLES      10

typedef struct {
    qboolean weapon_stabilised;
    qboolean weapon_zoomed;
    float weapon_zoomLevel;
    qboolean right_handed;
    qboolean virtual_screen;
    qboolean local_server; // used in bg_pmove.c

    qboolean realign_playspace; // used to realign the weapon in a multiplayer game
    int realign_pitch; // used to realign the weapon pitch in a multiplayer game

    int clientNum;

    vec3_t hmdposition;
    vec3_t hmdorigin; //used to recenter the mp fake 6DoF playspace
    vec3_t hmdposition_last; // Don't use this, it is just for calculating delta!
    vec3_t hmdposition_delta;

    vec3_t hmdorientation;
    vec3_t hmdorientation_last; // Don't use this, it is just for calculating delta!
    vec3_t hmdorientation_delta;
	
    vec3_t weaponangles;
    vec3_t weaponangles_last; // Don't use this, it is just for calculating delta!
    vec3_t weaponangles_delta;

    vec3_t weaponoffset;
    vec3_t weaponposition;

    vec3_t offhandangles;
    vec3_t offhandoffset;
    vec3_t offhandposition;

    //////////////////////////////////////
    //    Test stuff for weapon alignment
    //////////////////////////////////////

    char    test_name[256];
    float   test_scale;
    vec3_t  test_angles;
    vec3_t  test_offset;

} vr_clientinfo_t;

#endif //vr_clientinfo_h