models/mapobjects/bat/bat
{
cull disable
deformVertexes wave 10 sin 0 3 0 3
deformVertexes move 500 0 0 sawtooth 0 5 0 .1
deformVertexes move 0 0 7 sin 0 5 0 .5
}
textures/base/moveypipe
{
deformVertexes bulge 3 10 1
}
textures/base/my_base
{
q3map_sun 1 1 1 100 -58 58
cull disable
nopicmip
nomipmaps
portal
entityMergable
polygonOffset
surfaceparm nomarks
surfaceparm trans
}
textures/base/my_base2
{
q3map_sun .5 .37 .19 80 315 70
cull back
nopicmip
nomipmaps
portal
entityMergable
skyparms env/wildspace1 - -
sort sky
surfaceparm noimpact
surfaceparm nolightmap
surfaceparm sky
}
textures/base/my_base6
{
deformVertexes wave 100 sin 3 2 .1 3
deformVertexes normal .5 .1
}
textures/base/my_base7
{
cull disable
surfaceparm nolightmap
surfaceparm nomarks
surfaceparm trans
deformVertexes autoSprite2
}
textures/base/my_base8
{
cull disable
surfaceparm nolightmap
surfaceparm nomarks
surfaceparm trans
deformVertexes autoSprite
}
textures/base/my_base_3
{
cull disable
skyparms - 512 -
sort 2.3
}
textures/base/my_base_4
{
cull back
}
textures/base/my_base_5
{
cull back
polygonOffset
sort 2
}
textures/base/projectionShadow
{
polygonOffset
deformVertexes projectionShadow
}
textures/base/waveywater
{
deformVertexes wave 100 triangle 2 2 1 .1
}
