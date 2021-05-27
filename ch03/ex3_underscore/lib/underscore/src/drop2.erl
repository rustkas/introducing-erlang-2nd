-module(drop2).
-export([fall_velocity/2]). 


fall_velocity(_, Distance) -> math:sqrt(2 * 9.8 * Distance).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").


write_input_test() ->
  Value = 19.79898987322333,
  ?assertEqual(Value, drop:fall_velocity(earth,20)),
  ?assertEqual(Value, drop:fall_velocity(moon,20)),
  ?assertEqual(Value, drop:fall_velocity(mars,20))
  .

check_underscore_test() ->
  _ = 20
  % compilation error
  % ?assertEqual(20, _)
  .
-endif.	 