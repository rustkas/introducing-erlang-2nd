-module(drop_sup).

-behaviour(supervisor).

-export([start_link/0]). % convenience call for startup

-export([init/1]). % supervisor calls

-define(SERVER, ?MODULE).

%%% convenience method for startup
start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%% supervisor callback
init([]) ->
    SupFlags = #{strategy => one_for_one, intensity => 1,
                 period => 5},
    Drop = #{id => drop, start => {drop, start_link, []},
             restart => permanent, shutdown => 5000, type => worker,
             modules => [drop]},
    {ok, {SupFlags, [Drop]}}.

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    %     {"Initialize superviser, work, stop", fun check_0/0}
    %     ,
    [{"Check wrong input", fun check_1/0}].

check_0() ->
    {ok, Pid} = drop_sup:start_link(),
    timer:sleep(timer:seconds(1) div 5),
    ?assertEqual({ok, 34.292856398964496},
                 (gen_server:call(drop, 60))),
    ?assert((whereis(drop) =/= Pid)),
    unlink(Pid),
    gen_server:stop(drop),
    gen_server:stop(drop_sup).

check_1() ->
    {ok, Pid} = drop_sup:start_link(),
    unlink(Pid),
    timer:sleep(timer:seconds(1) div 5),
    DropPid = whereis(drop),
    %     ?assertError(badarith, (gen_server:call(drop, -60))),
    %     timer:sleep(timer:seconds(1)),
    %     ?assert((whereis(drop) =/= DropPid)),
    %     gen_server:stop(drop),
    gen_server:stop(drop_sup).

-endif.
