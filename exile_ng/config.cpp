class CfgPatches
  {
  	class ExileNG
  	{
  		units[] = {};
  		weapons[] = {};
  		requiredAddons[] = {"exile_client","exile_server_config"};
  	};
  };

  class CfgFunctions
  {
  	class ExileNG
  	{
  		class Bootstrap
  		{
  			file = "exile_ng\bootstrap";
  			class preInit
  			{
  				preInit = 1;
  			};

            class postInit
            {
              postInit = 1;
            };
  		};
      };
  };