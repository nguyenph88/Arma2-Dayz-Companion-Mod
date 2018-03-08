/*
	Zed handler
*/

private ["_unit","_dist","_pos","_z","_r"];

diag_log "** scp_zeds initializing";

_dist = 200;	// distance from companion

_unit = _this select 0;

while {alive _unit} do {
	sleep 1;
	_pos = getPos _unit;
	_z = _pos nearEntities ["zZombie_Base",_dist];
	{
		_r = rating _x;
		if (_r > -2000) then {
			_x addRating -1000000;
		};
		if(alive _x) then {
			_unit fireAtTarget [_x];
		};
	} forEach _z;
};

diag_log "** scp_zeds - unit died";
