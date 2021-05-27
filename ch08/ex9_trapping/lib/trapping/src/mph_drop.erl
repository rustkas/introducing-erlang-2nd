-module(mph_drop).

-export([mph_drop/0]).

mph_drop() ->
    process_flag(trap_exit, true),
    Drop = spawn_link(drop, drop, []),
    convert(Drop).

convert(Drop) ->
    receive
        {Planemo, Distance} ->
            Drop ! {self(), Planemo, Distance},
            convert(Drop);
        {'EXIT', Pid, Reason} ->
            io:format("FAILURE: ~p died because of ~p.~n",
                      [Pid, Reason]);
        {Planemo, Distance, Velocity} ->
            MphVelocity = 2.23693629 * Velocity,
            io:format("On ~p, a fall of ~p meters yields a "
                      "velocity of ~p mph.~n",
                      [Planemo, Distance, MphVelocity]),
            convert(Drop)
    end.

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

drop1_test() ->
    Pid1 = spawn(mph_drop, mph_drop, []),
    Pid1 ! {moon, 20},
    timer:sleep(timer:seconds(1) div 5),
    ?assertEqual("On moon, a fall of 20 meters yields "
                 "a velocity of 17.89549032 mph.\n",
                 (?capturedOutput)).

drop2_test() ->
    Pid1 = spawn(mph_drop, mph_drop, []),
    Pid1 ! {moon, zoids},
    timer:sleep(timer:seconds(1) div 5),
    Failure = "FAILURE",
    Result = string:left(?capturedOutput,
                         string:length(Failure)),
    ?assertEqual(Failure, Result).

-endif.
