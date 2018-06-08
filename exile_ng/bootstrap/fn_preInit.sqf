private ['_code', '_function', '_file', '_fileContent'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;
    _isLocked = _x select 2;

    if (_isLocked isEqualTo false) then
    {
        if (isText (missionConfigFile >> 'CfgExileCustomCode' >> _function)) then
        {
            _file = getText (missionConfigFile >> 'CfgExileCustomCode' >> _function);
        };
    };

    _fileContent = preprocessFileLineNumbers _file;

    if (_fileContent isEqualTo '') then
    {
        diag_log (format ['ERROR: Override of %1 in CfgExileCustomCode points to a non-existent file: %2. Defaulting to vanilla Exile code!', _function, _file]);

        _fileContent = preprocessFileLineNumbers (_x select 1);
    };

    _code = compileFinal _fileContent;

    missionNamespace setVariable [_function, _code];
}
forEach
[
  ['ExileNG_system_process_preInit', 'exile_ng\code\ExileNG_system_process_preInit.sqf', false],
  ['ExileNG_system_process_postInit', 'exile_ng\code\ExileNG_system_process_postInit.sqf', false],
  ['ExileNG_system_messageBoards', 'exile_ng\code\ExileNG_system_messageBoards.sqf', false],
  ['ExileNG_system_messageBoards_initialize', 'exile_ng\code\ExileNG_system_messageBoards_initialize.sqf', false],
  ['ExileNG_system_messageBoards_getTopTenDeaths', 'exile_ng\code\ExileNG_system_messageBoards_getTopTenDeaths.sqf', false],
  ['ExileNG_system_messageBoards_getTopTenKds', 'exile_ng\code\ExileNG_system_messageBoards_getTopTenKds.sqf', false],
  ['ExileNG_system_messageBoards_getTopTenKills', 'exile_ng\code\ExileNG_system_messageBoards_getTopTenKills.sqf', false],
  ['ExileNG_system_messageBoards_getTopTenScores', 'exile_ng\code\ExileNG_system_messageBoards_getTopTenScores.sqf', false]
];

call ExileNG_system_process_preInit;

true