-module(mathdemo2).

-export([absolute_value/1]).

absolute_value(Number) when Number < 0 -> -Number;
absolute_value(0) -> 0;
absolute_value(Number) when Number > 0 -> Number.

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

absolute_value_test() ->
    ?assertEqual(20, (mathdemo2:absolute_value(-20))),
    ?assertEqual(0, (mathdemo2:absolute_value(0))),
    ?assertEqual(20, (mathdemo2:absolute_value(20))).

-endif.
