-module(throw_exception).

-export([]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

carch_throw_test() ->
    Result = try throw(argument) catch
                 error:Error -> {found, Error};
                 Exception -> {caught, Exception}
             end,
    ?assertEqual({caught, argument}, Result).

carch_error_test() ->
    Result = try error(argument) catch
                 error:Error -> {found, Error};
                 Exception -> {caught, Exception}
             end,
    ?assertEqual({found, argument}, Result).

-endif.
