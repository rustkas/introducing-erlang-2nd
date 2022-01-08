-module(bounce).

-export([report/0]).

report() ->
    receive
        X ->
            io:format("Divided to ~p~n", [X / 2]),
            report()
    end.

  %%

%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

report1_test() ->
    Pid3 = spawn(bounce, report, []),
    Pid3 ! 38,
    ?assertEqual("Divided to 19.0\n", (?capturedOutput)),
    Pid3 ! 4,
    ?assertEqual("Divided to 19.0\nDivided to 2.0\n",
                 (?capturedOutput)).

report2_test() ->
    Pid3 = spawn(bounce, report, []),
    Pid3 ! 27.56,
    ?assertEqual("Divided to 13.78\n", (?capturedOutput)).

report3_test() ->
    Pid3 = spawn(bounce, report, []),
    Pid3 ! seven.%   ?assertError(badarith, Pid3 ! seven)

-endif.
