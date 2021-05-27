-module(drop_tests).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->

    [{"Check earth tuple",  fun earth/0},
     {"Check moon tuple", fun moon/0},
     {"Check mars tuple", fun mars/0},
     {"Try to use private function",  fun private/0}
     ].

earth() ->
  ?assertEqual(19.79898987322333, drop:fall_velocity({earth,20}))
  .

moon() ->
  ?assertEqual(8.0, drop:fall_velocity({moon,20}))
  .

mars() ->
  ?assertEqual(12.181953866272849, drop:fall_velocity({mars,20}))    
  .

% Try to get access to private functions
private() ->
    Value = 20,
    % Try to get access to private function fall_velocity(earth, Distance)
    % We get error:undef
    ?assertError(undef,
      ?assertEqual(19.79898987322333, drop:fall_velocity(earth,Value))
    ),

    ?assertError(undef,
      ?assertEqual(8.0, drop:fall_velocity(moon,Value))
    ),

    ?assertError(undef,
      ?assertEqual(19.79898987322333, drop:fall_velocity(mars,Value))
    )
   .


-endif.	 


