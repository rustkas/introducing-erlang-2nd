-module(record_drop).

-export([fall_velocity/1]).

-include("records.hrl").

fall_velocity(#tower{planemo = Planemo,
                     height = Distance}) ->
    fall_velocity(Planemo, Distance).

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

check01_test() ->
    Tower1 = #tower{},
    Tower5 = #tower{planemo = mars, height = 500,
                    name = "Daga Vallis", location = "Valles Marineris"},
    % ,?debugFmt("~p~n",[record_drop:fall_velocity(Tower5)])
    ?assertEqual(60.909769331364245,
                 (record_drop:fall_velocity(Tower5))),
    ?assertEqual(19.79898987322333,
                 (record_drop:fall_velocity(Tower1))).

-endif.
