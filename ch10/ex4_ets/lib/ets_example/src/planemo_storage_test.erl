-module(planemo_storage_test).

-export([setup_pid/0]).

-include("records.hrl").

-include_lib("eunit/include/eunit.hrl").

setup_pid() ->
    receive
        From ->
            From ! planemo_storage:setup(),
            setup_pid()
    end.

%%
%% Tests
%%
fib_test_() ->
    [{timeout, 10, fun check_double_setup_pid/0},
     {spawn, fun check_setup/0},
     fun check_no_ets_table/0].

% Try to create ets table two times
% Using separete process for working with new table we isolate any ets side effects.
% Note that new Pid is owner of new ets table.
check_double_setup_pid() ->
    process_flag(trap_exit, true),
    Pid1 = spawn_link(planemo_storage_test, setup_pid, []),
    ?debugFmt("Worker Pid = ~p~n", [Pid1]),
    ?debugFmt("Before Working. ets planemo info = ~p~n",
              [ets:info(planemos)]),
    timer:sleep(timer:seconds(1)),
    Pid1 ! self(),
    receive
        X ->
            ?debugFmt("Get result:~n~p~n", [X]),
            [{owner, Owner}] = [Tuple
                                || Tuple <- X, owner == element(1, Tuple)],
            % Note that Pid1 is owner of created ets table
            % When Pid1 is died ets table is destroyed too
            ?assertEqual(Pid1, Owner),
            timer:sleep(timer:seconds(2))
    end,
    Pid1 ! self(),
    receive
        {'EXIT', Pid, Reason} ->
            ?debugFmt("FAILURE: ~p died because of ~p.~n",
                      [Pid, Reason])
    end,
    timer:sleep(timer:seconds(1)),
    ?assert((undefined == ets:info(planemos))).

% Check meta data of new ets table
check_setup() ->
    PlanemoTable = ets:new(planemos,
                           [named_table, {keypos, #planemo.name}]),
    Result = ets:info(PlanemoTable),
    ?debugMsg("\n\n====== Check setup ======\n\n"),
    ?debugFmt("~n~p~n", [Result]),
    ?debugFmt("Length: ~p~n", [length(Result)]),
    is_list(Result),
    [{name, Name}] = [Tuple
                      || Tuple <- Result, name == element(1, Tuple)],
    %   ,?debugFmt("Name: ~p~n", [Name])
    ?assertEqual(planemos, Name),
    [{named_table, IsNamedTable}] = [Tuple
                                     || Tuple <- Result, named_table == element(1, Tuple)],
    ?assert(IsNamedTable),
    [{keypos, KeyPos}] = [Tuple
                          || Tuple <- Result, keypos == element(1, Tuple)],
    ?assertEqual(2, KeyPos),
    [{protection, Protection}] = [Tuple
                                  || Tuple <- Result, protection == element(1, Tuple)],
    ?assertEqual(protected, Protection),
    [{size, Size}] = [Tuple
                      || Tuple <- Result, size == element(1, Tuple)],
    ?assertEqual(0, Size),
    [{node, Node}] = [Tuple
                      || Tuple <- Result, node == element(1, Tuple)],
    ?assertEqual(nonode@nohost, Node).

% Check that planemo ets table is not exist
check_no_ets_table() ->
    ?assertEqual(undefined, (ets:info(planemos))).
