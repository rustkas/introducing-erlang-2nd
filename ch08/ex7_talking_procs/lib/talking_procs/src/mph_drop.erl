-module(mph_drop).

-export([mph_drop/0]).

mph_drop() ->
    Drop = spawn(drop, drop, []),
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
    Pid1 ! {earth, 20},
    timer:sleep(timer:seconds(1) div 5),
    ?assertEqual("On earth, a fall of 20 meters yields "
                 "a velocity of 44.289078952755766 mph.\n",
                 (?capturedOutput)).

drop2_test() ->
    Pid1 = spawn(mph_drop, mph_drop, []),
    Pid1 ! {mars, 20},
    timer:sleep(timer:seconds(1) div 5),
    ?assertEqual("On mars, a fall of 20 meters yields "
                 "a velocity of 27.250254686571544 mph.\n",
                 (?capturedOutput)).

-endif.
