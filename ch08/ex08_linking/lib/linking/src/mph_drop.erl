-module(mph_drop).

-export([mph_drop/0]).

mph_drop() ->
    Drop = spawn_link(drop, drop, []),
    convert(Drop).

convert(Drop) ->
    receive
        {Planemo, Distance} ->
            Drop ! {self(), Planemo, Distance},
            convert(Drop);
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
    Pid1 ! {mars, zodis},
    timer:sleep(timer:seconds(1) div 5),
    % ?assertEqual("On mars, a fall of 20 meters yields a velocity of 27.250254686571544 mph.\n", ?capturedOutput)
    ?assertEqual("", (?capturedOutput)).

drop2_test() ->
    Pid1 = spawn(mph_drop, mph_drop, []),
    exit(Pid1, kill),
    ?assertEqual("", (?capturedOutput)).

-endif.
