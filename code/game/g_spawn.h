#ifndef G_SPAWN_H
#define G_SPAWN_H

typedef struct gentity_s gentity_t;

void SP_info_player_start(gentity_t* ent);
void SP_info_player_deathmatch(gentity_t* ent);
void SP_info_player_intermission(gentity_t* ent);

void SP_func_plat(gentity_t* ent);
void SP_func_static(gentity_t* ent);
void SP_func_rotating(gentity_t* ent);
void SP_func_bobbing(gentity_t* ent);
void SP_func_pendulum(gentity_t* ent);
void SP_func_button(gentity_t* ent);
void SP_func_door(gentity_t* ent);
void SP_func_train(gentity_t* ent);
void SP_func_timer(gentity_t* self);

void SP_trigger_always(gentity_t* ent);
void SP_trigger_multiple(gentity_t* ent);
void SP_trigger_push(gentity_t* ent);
void SP_trigger_teleport(gentity_t* ent);
void SP_trigger_hurt(gentity_t* ent);

void SP_target_remove_powerups(gentity_t* ent);
void SP_target_give(gentity_t* ent);
void SP_target_delay(gentity_t* ent);
void SP_target_speaker(gentity_t* ent);
void SP_target_print(gentity_t* ent);
void SP_target_laser(gentity_t* self);
void SP_target_score(gentity_t* ent);
void SP_target_teleporter(gentity_t* ent);
void SP_target_relay(gentity_t* ent);
void SP_target_kill(gentity_t* ent);
void SP_target_position(gentity_t* ent);
void SP_target_location(gentity_t* ent);
void SP_target_push(gentity_t* ent);

void SP_light(gentity_t* self);
void SP_info_null(gentity_t* self);
void SP_info_notnull(gentity_t* self);
void SP_info_camp(gentity_t* self);
void SP_path_corner(gentity_t* self);

void SP_misc_teleporter_dest(gentity_t* self);
void SP_misc_model(gentity_t* ent);
void SP_misc_portal_camera(gentity_t* ent);
void SP_misc_portal_surface(gentity_t* ent);

void SP_shooter_rocket(gentity_t* ent);
void SP_shooter_plasma(gentity_t* ent);
void SP_shooter_grenade(gentity_t* ent);

void SP_team_CTF_redplayer(gentity_t* ent);
void SP_team_CTF_blueplayer(gentity_t* ent);

void SP_team_CTF_redspawn(gentity_t* ent);
void SP_team_CTF_bluespawn(gentity_t* ent);

#ifdef MISSIONPACK
void SP_team_blueobelisk(gentity_t* ent);
void SP_team_redobelisk(gentity_t* ent);
void SP_team_neutralobelisk(gentity_t* ent);
#endif

#endif
