/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
parser grammar MaterialsParser;

options { tokenVocab=MaterialsLexer; }

unit : materials EOF;

materials
	: material materials
	| /* empty */
;

material
    : name=(LABEL|PROJECTIONSHADOW|QUOTED_LABEL) OPEN_BRACE directives CLOSE_BRACE
    ;

stage
    : OPEN_BRACE stageDirectives CLOSE_BRACE
    ;

directives
    : directive directives
    | /* empty */
    ;

directive
    : generalDirective
    | q3mapDirective
    | surfaceParameterDirective
    | qerDirective
    | stage
    ;

//General Directives
generalDirective
    : cullDirective
    | noPicMipDirective
    | noMipMapsDirective
    | portalDirective
    | entityMergableDirective
    | fogParmsDirective
    | skyParmsDirective
    | polygonOffsetDirective
    | sortDirective
    | deformVertexesDirective
    ;

cullDirective : CULL (CULL_DISABLE|CULL_NONE|CULL_TWOSIDED|CULL_BACK|CULL_BACKSIDE|CULL_BACKSIDED);
noPicMipDirective : NOPICMIP;
noMipMapsDirective : NOMIPMAPS;
portalDirective : PORTAL;
entityMergableDirective : ENTITYMERGABLE;
fogParmsDirective : FOGPARMS OPEN_BRACKET? number number number CLOSE_BRACKET? number number? number?;
skyParmsDirective : SKYPARMS (DASH|farBox=LABEL) (DASH|cloudHeight=INTEGER) (DASH|nearBox=LABEL);
polygonOffsetDirective : POLYGONOFFSET;
sortDirective : SORT (LABEL|number);

waveForm : generator=(SIN|SQUARE|TRIANGLE|SAWTOOTH|INVERSESAWTOOTH|NOISE) base=number amplitude=number phase=number frequency=number;

waveDeformStageDirective : WAVE spread=number waveForm;
normalDeformStageDirective : NORMAL frequency=number amplitude=number;
moveDeformStageDirective : MOVE x=number y=number z=number waveForm;
bulgeDeformStageDirective : BULGE bulgeWidth=number bulgeHeight=number bulgeSpeed=number;

projectionShadowDeformStageDirective : PROJECTIONSHADOW;
autoSpriteDeformStageDirective : AUTOSPRITE;
autoSprite2DeformStageDirective : AUTOSPRITE2;
textDeformStageDirective : (TEXT0|TEXT1|TEXT2|TEXT3|TEXT4|TEXT5|TEXT6|TEXT7);

deformStageDirective : waveDeformStageDirective
                     | normalDeformStageDirective
                     | moveDeformStageDirective
                     | bulgeDeformStageDirective
                     | projectionShadowDeformStageDirective
                     | autoSpriteDeformStageDirective
                     | autoSprite2DeformStageDirective
                     | textDeformStageDirective
                     ;

deformVertexesDirective : DEFORMVERTEXES deformStageDirective;

surfaceParameterDirective : SURFACE_PARM paramName=(LABEL|DETAIL);

stageDirectives
    : stageDirective stageDirectives
    |  /* empty */
    ;

stageDirective
    : mapStageDirective
    | clampMapStageDirective
    | animMapStageDirective
    | videoMapStageDirective
    | depthFuncStageDirective
    | detailStageDirective
    | depthWriteStageDirective
    | alphaFuncStageDirective
    | blendFuncStageDirective
    | tcGenStageDirective
    | rgbGenStageDirective
    | alphaGenStageDirective
    | tcModStageDirective
    ;

mapStageDirective : MAP texture=(LABEL|STAR_WHITE);
clampMapStageDirective : CLAMPMAP texture=LABEL;
animMapStageDirective : ANIMMAP frequency=number texture1=LABEL texture2=LABEL? texture3=LABEL? texture4=LABEL? texture5=LABEL? texture6=LABEL? texture7=LABEL? texture8=LABEL?;
videoMapStageDirective : VIDEOMAP video=LABEL;
depthFuncStageDirective : DEPTHFUNC (EQUAL|LEQUAL);
detailStageDirective : DETAIL;
blendFuncStageDirective : BLENDFUNC srcBlend=LABEL dstBlend=LABEL?;
rgbGenStageDirective : RGBGEN (rgbGenIdentityStageDirective|rgbGenIdentityLightingStageDirective|rgbGenEntityStageDirective|rgbGenOneMinusEntityStageDirective|rgbGenVertexStageDirective|rgbGenExactVertexStageDirective|rgbGenLightingDiffuseStageDirective|rgbGenWaveStageDirective);
alphaFuncStageDirective : ALPHAFUNC func=(GT0|LT128|GE128);
alphaGenStageDirective : ALPHAGEN (alphaGenLightingSpecularStageDirective|alphaGenWaveStageDirective|alphaGenVertexStageDirective|alphaGenEntityStageDirective|alphaGenPortalStageDirective);
// Note: The tcGen "vector" coordinateSource is not currently supported as no media in the game used that capability
tcGenStageDirective : TCGEN coordinateSource=(BASE|LIGHTMAP|ENVIRONMENT);
tcModStageDirective : TCMOD (tcModRotateStageDirective|tcModScaleStageDirective|tcModScrollStageDirective|tcModStretchStageDirective|tcModTransformStageDirective|tcModTurbStageDirective);
depthWriteStageDirective : DEPTHWRITE ;

rgbGenIdentityStageDirective : IDENTITY;
rgbGenIdentityLightingStageDirective : IDENTITYLIGHTING;
rgbGenEntityStageDirective : ENTITY;
rgbGenOneMinusEntityStageDirective : ONEMINUSENTITY;
rgbGenVertexStageDirective : VERTEX;
rgbGenExactVertexStageDirective : EXACTVERTEX;
rgbGenLightingDiffuseStageDirective : LIGHTINGDIFFUSE;
rgbGenWaveStageDirective : WAVE waveForm;

alphaGenLightingSpecularStageDirective : LIGHTINGSPECULAR;
alphaGenWaveStageDirective : WAVE waveForm;
alphaGenVertexStageDirective : VERTEX;
alphaGenEntityStageDirective : ENTITY;
alphaGenPortalStageDirective : PORTAL portalRange=number;

tcModRotateStageDirective : ROTATE degreesPerSecond=number;
tcModScaleStageDirective : SCALE sScale=number tScale=number;
tcModScrollStageDirective : SCROLL sSpeed=number tSpeed=number;
tcModStretchStageDirective : STRETCH waveForm;
tcModTransformStageDirective : TRANSFORM m00=number m01=number m10=number m11=number t0=number t1=number;
tcModTurbStageDirective : TURB base=number amplitude=number phase=number frequency=number;

q3mapDirective
    : q3mapSurfaceLightDirective
    | q3mapGlobalTextureDirective
    | q3mapLightImageDirective
    | q3mapNoVertexShadowsDirective
    | q3mapForceSunlightDirective
    | q3mapFlareDirective
    | q3mapLightSubdivideDirective
    | q3mapTessSizeDirective
    | q3mapBackSplashDirective
    | q3mapLightDirective
    | q3mapSunDirective
    ;

number : (INTEGER|DECIMAL);

q3mapSurfaceLightDirective : Q3MAP_SURFACELIGHT INTEGER;
q3mapGlobalTextureDirective : Q3MAP_GLOBALTEXTURE;
q3mapSunDirective : Q3MAP_SUN number number number INTEGER INTEGER INTEGER;
q3mapLightImageDirective : Q3MAP_LIGHTIMAGE LABEL;
q3mapNoVertexShadowsDirective : Q3MAP_NOVERTEXSHADOWS;
q3mapForceSunlightDirective : Q3MAP_FORCESUNLIGHT;
q3mapFlareDirective : Q3MAP_FLARE LABEL;
q3mapLightSubdivideDirective : Q3MAP_LIGHTSUBDIVIDE INTEGER;
q3mapTessSizeDirective : TESSSIZE INTEGER;
q3mapBackSplashDirective : Q3MAP_BACKSPLASH INTEGER INTEGER;
q3mapLightDirective : LIGHT number;

qerDirective
    : qerEditorImageDirective
    | qerNoCarveDirective
    | qerTransDirective
    ;

qerEditorImageDirective : QER_EDITORIMAGE LABEL;
qerNoCarveDirective : QER_NOCARVE;
qerTransDirective : QER_TRANS number;
