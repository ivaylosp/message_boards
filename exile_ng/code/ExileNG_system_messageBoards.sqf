private ["_messageBillboards","_exileNGGetTopScorersData","_playerName","_playerScore","_billboard","_pointer_row","_pointer_x_start","_pointer_y_start","_pointer_x_offset","_pointer_y_offset","_pointer_x","_pointer_y","_pointer_z","_max_rows","_max_columns","_pointer","_billboard_characters_placeholders","_billboard_characters","_billboard_character", "_data", "_randomMessageType", "_messageTypeFunction"];

try
{
    private _possibleMessageTypes = ["getTopTenDeaths","getTopTenKills","getTopTenKds","getTopTenScores","getTopTenMoney"];
	_messageBillboards = getArray(missionConfigFile >> "CfgExileNGMessageBoards" >> "positions");
    _randomMessageType = selectRandom _possibleMessageTypes;
    _messageTypeFunction = call compile format["ExileNG_system_messageBoards_%1", _randomMessageType];

    if (count _messageBillboards == 0) then {
        throw "CfgExileNGMessageBoards is missing from the config.cpp within your mission file";
    };

	_data = call compile format["ExileNG_system_messageBoards_%1", _randomMessageType];
	_data = toUpper _data;
	_data = toArray(_data);

	{
		_billboard = nearestObjects [_x, ["Land_Billboard_F"], 50] select 0;
		_billboard_characters_placeholders = _billboard getVariable ["NGMessageBoardCharacters", ""];

		if (_billboard_characters_placeholders isEqualTo "") then {

			_billboard setObjectTextureGlobal [0, "#(rgb,4,4,1)color(0.5,0.5,0.5,0.5)"];

			//data = data splitString "";
			_pointer_row          = 1;
			_pointer_x_start      = -2.87;
			_pointer_y_start      = 2.6;
			_pointer_x_offset     = 0.14;
			_pointer_y_offset     = 0.17;
			_pointer_x            = 0;
			_pointer_y            = 0;
			_pointer_z            = -0.56; //-0.55
			_max_rows             = 17;
			_max_columns          = 42;
			_billboard_characters = [];

			for "_pointer" from 0 to ((_max_columns * _max_rows) - 1) do
			{
				_pointer_y = _pointer_y_start;
				if (_pointer >= _max_columns) then {
					_pointer_row = floor (_pointer / _max_columns);
					_pointer_y = _pointer_y_start - (_pointer_row * _pointer_y_offset);
				};

				if (_pointer < _max_columns) then {
					_pointer_x = _pointer_x_start + (_pointer * _pointer_x_offset);
				} else {
					_pointer_x = _pointer_x_start + (_pointer - (_pointer_row * _max_columns)) * _pointer_x_offset;
				};

				_billboard_character = createVehicle ["UserTexture1m_F", [0,0,0], [], 0, "NONE"];
				_billboard_character setDir getDir _billboard;
				_pos = _billboard modelToWorldWorld [_pointer_x, _pointer_z, _pointer_y];
				_billboard_character setPosWorld _pos;
				_billboard_character setObjectTextureGlobal [0,"textures\messageboard\space.paa"];
				_billboard_characters pushBack _billboard_character;
			};

			_billboard setVariable ["NGMessageBoardCharacters", _billboard_characters, true];
		};

		_billboard_characters_placeholders = _billboard getVariable ["NGMessageBoardCharacters", []];

        //TODO Optimize this piece of code
        //Clear the board before new message
        {
            _x setObjectTextureGlobal [0,"textures\messageboard\space.paa"];
        } forEach _billboard_characters_placeholders;

		{
			switch true do {
			    case (_x in [1063,1064,1045,1056,1058,1066,1059,1048,1054,1055,1040,1057,1044,1060,1043,1061,1049,1050,1051,1100,1047,1046,1062,1042,1041,1053,1052,1070,1065,1071]): { _billboard_character = _x; }; //ЧШЕРТЪУИОПАСДФГХЙКЛьЗЖЦВБНМЮЯ
			    case (_x in [49,50,51,52,53,54,55,56,57,48,81,87,69,82,84,89,85,73,79,80,65,83,68,70,71,72,74,75,76,90,88,67,86,66,78,77]): { _billboard_character = toString [_x]; }; //1234567890QWERTYUIOPASDFGHJKLZXCVBNM
                case (_x in [91,92,93,95,47,46,45,33]): { _billboard_character = _x; }; // 95-_ 92-\ 93-] 91-[ 47-/ 46-. 45-- 33-!
                default { _billboard_character = "space"; };
            };

			(_billboard_characters_placeholders select _foreachindex) setObjectTextureGlobal [0, format["textures\messageboard\%1.paa", _billboard_character]];
		} forEach _data;
	} forEach _messageBillboards;
}
catch
{
    format["ERROR : ExileNG [MESSAGE BOARDS] - %1", toString _exception] call ExileServer_util_log;
};

true
