private["_data","_messageContent"];

try
{
    _messageContent = "                                          ";
    _messageContent = _messageContent + "          TOP 13 PLAYERS BY MONEY         ";
    _messageContent = _messageContent + "                                          ";
    _data = format["ngGetTopTenMoney"] call ExileServer_system_database_query_selectFull;

    {
        _messageContent = _messageContent + (_x select 0);
    } forEach _data;
}
catch
{
    _messageContent = "There was an issue with the data source...";
};

_messageContent