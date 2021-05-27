-module(boolean).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

atoms_test() ->
    ?assertEqual(false, (3 < 2)),
    ?assert((3 > 2)),
    ?assert((10 == 10)),
    ?assert((true and true)),
    ?assertEqual(false, (true and false)),
    ?assert((true or false)),
    ?assertEqual(false, (false or false)),
    ?assert((true xor false)),
    ?assertEqual(false, (true xor true)),
    ?assertEqual(false, (not true)).

-endif.
