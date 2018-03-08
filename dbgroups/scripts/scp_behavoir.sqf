/*
	Set behavoir
*/

diag_log "** scp_behavoir initializing";

private ["_unit"];

_unit = _this select 0;

_unit enableAI "TARGET";
_unit enableAI "AUTOTARGET";
_unit enableAI "MOVE";
_unit enableAI "ANIM";
_unit enableAI "FSM";
_unit allowDammage true;
_unit setCombatMode "YELLOW";
_unit setBehaviour "AWARE";
_unit setFormation "WEDGE";

diag_log "** scp_behavoir initialized";
