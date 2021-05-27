-module(error_logger).

-export([]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

check1_test() ->
    %   error_logger:info_msg("The value is ~p. ~n",[360])
    % error_logger:error_msg("An error occurred in ~p", [a_module])
    logger:log(info, "Hello World"),
    logger:log(debug, "Hello World", #{meta => data}),
    ?debugFmt("~p~n",
              [logger_formatter:config()]).% ,logger:error("error happened because: ~p", ["Reason"])
                                           % logger:log(warning, "The roof is on ~ts",["Café"]),
                                           % logger:log(warning, #{ what => roof, cause => "Café" })

% carch_throw_test()->
% 	Result = try throw(argument)
% 	catch
% 		error:Error -> {found, Error};
% 		throw:Exception -> {caught, Exception}
% 	end,
%    ?assertEqual({caught, argument}, Result)
%   .

% carch_error_test()->
% 	Result = try error(argument)
% 	catch
% 		error:Error -> {found, Error};
% 		throw:Exception -> {caught, Exception}
% 	end,
%    ?assertEqual({found, argument}, Result)
%   .

-endif.
