-module(drop_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_Type, _StartArgs) -> drop_sup:start_link().

stop(_State) -> ok.

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Initialize application, stop", fun check_0/0},
     {"Initialize application, work, stop", fun check_1/0}].

check_0() ->
    application:load(drop),
    application:start(drop),
    timer:sleep(timer:seconds(1)),
    ?debugFmt("~n~p~n",
              [application:loaded_applications()]),
    timer:sleep(timer:seconds(1) div 5),
    % stop application
    application:stop(drop),
    timer:sleep(timer:seconds(1) div 5),
    % unload application info
    ?assertEqual(ok, (application:unload(drop))),
    timer:sleep(timer:seconds(1) div 5),
    ?debugFmt("~n~p~n",
              [application:loaded_applications()]).

check_1() ->
    application:load(drop),
    timer:sleep(timer:seconds(1)),
    application:start(drop),
    timer:sleep(timer:seconds(1) div 5),
    ?assertEqual({ok, 34.292856398964496},
                 (gen_server:call(drop, 60))),
    % stop application
    application:stop(drop),
    timer:sleep(timer:seconds(1) div 5),
    % unload application info
    ?assertEqual(ok, (application:unload(drop))),
    timer:sleep(timer:seconds(1) div 5).

-endif.
