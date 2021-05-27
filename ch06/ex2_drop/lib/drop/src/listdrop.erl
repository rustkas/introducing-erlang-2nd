-module(listdrop).

-export([falls/1]).

falls(List) -> falls(List, []).

falls([], Results) -> Results;
falls([Head | Tail], Results) ->
    falls(Tail, [drop:fall_velocity(Head) | Results]).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

q_test() ->
    ?assertEqual([12.181953866272849,
                  8.0,
                  19.79898987322333],
                 (listdrop:falls([{earth, 20},
                                  {moon, 20},
                                  {mars, 20}]))).

-endif.
