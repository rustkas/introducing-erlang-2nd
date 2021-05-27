-module(drop).
-export([fall_velocity/1]). 

fall_velocity({earth, Distance}) -> math:sqrt(2 * 9.8 * Distance);
fall_velocity({moon, Distance}) -> math:sqrt(2 * 1.6 * Distance);
fall_velocity({mars, Distance}) -> math:sqrt(2 * 3.71 * Distance).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

compare_test() ->
  Tuple = {earth, 20},
  ?assertEqual({earth,20}, Tuple),
  ?assertEqual(20, element(2, Tuple)),

  NewTuple = setelement(2, Tuple, 40),
  ?assertEqual({earth,40}, NewTuple),

  ?assertEqual(2, tuple_size(NewTuple))
  .

fall_velocity_test()-> 
  Distance = 20,
  ?assertEqual(19.79898987322333, drop:fall_velocity({earth, Distance})),
  ?assertEqual(8.0, drop:fall_velocity({moon, Distance})),
  ?assertEqual(12.181953866272849, drop:fall_velocity({mars, Distance}))
  .

-endif.	 