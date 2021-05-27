-module(drop).

-behaviour(gen_server).

-export([start_link/0]). % convenience call for startup

-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

% gen_server calls
-define(SERVER,
        ?MODULE). % macro that just defines this module as server

-record(state, {count}). % simple counter state

%%% convenience method for startup
start_link() ->
    gen_server:start_link({local, ?SERVER},
                          ?MODULE,
                          [],
                          []).

%%% gen_server callbacks
init([]) -> {ok, #state{count = 0}}.

handle_call(_Request, _From, State) ->
    Distance = _Request,
    Reply = {ok, fall_velocity(Distance)},
    NewState = #state{count = State#state.count + 1},
    {reply, Reply, NewState}.

handle_cast(_Msg, State) ->
   
    io:format("So far, calculated ~w velocities.~n",
              [State#state.count]),
    {noreply, State}.

handle_info(_Info, State) -> {noreply, State}.

terminate(_Reason, _State) -> ok.

code_change(_OldVsn, State, _Extra) -> {ok, State}.

%%% Internal functions

fall_velocity(Distance) ->
    math:sqrt(2 * 9.8 * Distance).

%%
%% Tests
%%
-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

all_my_test_() ->
    [{"Initialize, work, stop", fun check_0/0},
     {"Initialize, work, terminate", fun check_1/0},
     {"drop 40", fun check_drop_40/0},
     {"drop 60", fun check_drop_60/0},
     {"error drop -60", fun check_error_drop_60/0},
     {"cast", fun check_cast/0}].

check_0() ->
    drop:start_link(),
    timer:sleep(timer:seconds(1) div 5),
    ?assertEqual({ok, 19.79898987322333},
                 (gen_server:call(drop, 20))),
    timer:sleep(timer:seconds(1) div 5),
    gen_server:stop(drop).

check_1() ->
    drop:start_link(),
    timer:sleep(timer:seconds(1) div 5),
    ?assertEqual({ok, 19.79898987322333},
                 (gen_server:call(drop, 20))),
    timer:sleep(timer:seconds(1) div 5),
    drop:terminate(normal, "End of work").

check_drop_40() ->
    drop:start_link(),
    timer:sleep(timer:seconds(1) div 5),
    ?assertEqual({ok, 28.0}, (gen_server:call(drop, 40))),
    timer:sleep(timer:seconds(1) div 5),
    drop:terminate(normal, "End of work").

check_drop_60() ->
    drop:start_link(),
    timer:sleep(timer:seconds(1) div 5),
    ?assertEqual({ok, 34.292856398964496},
                 (gen_server:call(drop, 60))),
    timer:sleep(timer:seconds(1) div 5),
    drop:terminate(normal, "End of work").

check_error_drop_60() ->
    drop:start_link(),
    timer:sleep(timer:seconds(1) div 5),
    ?assertError(badarith,
                 (gen_server:call(drop, -60))).

check_cast() ->
    drop:start_link(),
    timer:sleep(timer:seconds(1) div 5),
    gen_server:call(drop, 20),
    gen_server:call(drop, 40),
    gen_server:call(drop, 60),
    
    
    % Note that when you call gen_server:cast the process drop will be terminated.
    % Please, explore stacktrace information and find out the reason termination.
    % gen_server:cast(drop, {}),

    % timer:sleep(timer:seconds(1) div 5),

    ?assertError(terminated, gen_server:cast(drop, {})).
    

    

-endif.
