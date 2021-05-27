-module(drop).

-export([drop/0]).

drop() ->
    receive
        {From, Planemo, Distance} ->
            From !
                {Planemo, Distance, fall_velocity(Planemo, Distance)},
            drop()
    end.

fall_velocity(earth, Distance) when Distance >= 0 ->
    math:sqrt(2 * 9.8 * Distance);
fall_velocity(moon, Distance) when Distance >= 0 ->
    math:sqrt(2 * 1.6 * Distance);
fall_velocity(mars, Distance) when Distance >= 0 ->
    math:sqrt(2 * 3.71 * Distance).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

drop1_test() ->
    Pid1 = spawn(drop, drop, []),
    Pid1 ! {self(), moon, 20},
    receive
        {moon, 20, Distance} ->
            ?debugFmt("Disntance = ~p~n", [Distance]),
            ?assertEqual(8.0, Distance)
    end.

-endif.
