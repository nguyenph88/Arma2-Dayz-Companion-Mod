/*
	DB Groups addon
*/

private ["_i"];

// DBGroups
DBGroupsStarted = false;
DBMaxSurvivors = 50; // change this to the number of survivors you want, the more you add the lower your server and client FPS

DBSGroups = false;
publicVariable "DBSGroups";

call compile preprocessFileLineNumbers "dbgroups\scripts\scp_compiles.sqf";
call compile preprocessFileLineNumbers "dbgroups\scripts\scp_compileEH.sqf";

if (isServer) then {
	diag_log "** DB groups server side initializing";
	// DBGroups
	DBPV_SrvrUnits = [];
	publicVariable "DBPV_SrvrUnits";
	DBCurSurvivors = 0;
	publicVariable "DBCurSurvivors";
	DBSGroups = false;
	publicVariable "DBSGroups";
	DBUpdClient = false;
	publicVariable "DBUpdClient";
	[] call scp_crtsrvrs;
	DBSGroups = true;
} else {
	waitUntil {(alive player)};
//	waitUntil {DBSGroups};
	sleep 5;

	[] execVM "dbgroups\scripts\scp_relinkvm.sqf";		// reactivate VMs when player logs in

	// DBGroups
	[] execVM "dbgroups\scripts\scp_srvractions.sqf";
	[] execVM "dbgroups\scripts\scp_adjustrating.sqf";
	DBUpdClient = true; // update survivor variables
	publicVariable "DBUpdClient";

	diag_log "** DB groups client side initializing";
};

DBGroupsStarted = true;

diag_log "** DB groups initialized";
