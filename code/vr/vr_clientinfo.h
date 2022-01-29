#if !defined(vr_clientinfo_h)
#define vr_clientinfo_h

#include "vr_base.h"

#define NUM_WEAPON_SAMPLES      10
#define WEAPON_RECOIL           15.0f;

typedef struct {
    qboolean weapon_stabilised;
    qboolean right_handed;
    qboolean player_moving;
    qboolean visible_hud;
    qboolean dualwield;
    int weaponid;
    int lastweaponid;

    vec3_t hmdposition;
    vec3_t hmdposition_last; // Don't use this, it is just for calculating delta!
    vec3_t hmdposition_delta;

    vec3_t hmdorientation;
    vec3_t hmdorientation_last; // Don't use this, it is just for calculating delta!
    vec3_t hmdorientation_delta;
	
    vec3_t weaponangles;
    vec3_t weaponangles_last; // Don't use this, it is just for calculating delta!
    vec3_t weaponangles_delta;

    vec3_t current_weaponoffset;
    vec3_t calculated_weaponoffset;
    float current_weaponoffset_timestamp;
    vec3_t weaponoffset_history[NUM_WEAPON_SAMPLES];
    float weaponoffset_history_timestamp[NUM_WEAPON_SAMPLES];

    vec3_t offhandangles;
    vec3_t offhandoffset;

    //////////////////////////////////////
    //    Test stuff for weapon alignment
    //////////////////////////////////////

    char    test_name[256];
    float   test_scale;
    vec3_t  test_angles;
    vec3_t  test_offset;

} vr_clientinfo_t;

#endif //vr_clientinfo_h