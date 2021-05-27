-module(mph_drop_test).

-include_lib("eunit/include/eunit.hrl").

%%
%% Tests
%%
lounch_test_() ->
    {spawn,
     [fun check_earth/0,
      fun check_eris/0,
      fun check_makemake/0,
      fun check_mercury/0,
      fun check_venus/0,
      fun check_moon/0,
      fun check_mars/0,
      fun check_ceres/0,
      fun check_jupiter/0,
      fun check_saturn/0,
      fun check_uranus/0,
      fun check_neptune/0,
      fun check_pluto/0,
      fun check_haumea/0]}.

check_earth() ->
    Pid = spawn(mph_drop, mph_drop, []),
    Pid ! {earth, 20},
    timer:sleep(timer:seconds(1) div 5),
    ?assertEqual("On earth, a fall of 20 meters yields "
                 "a velocity of 44.289078952755766 mph.\n",
                 (?capturedOutput)),
    ?assertEqual((io_lib:format("On earth, a fall of 20 meters yields "
                                "a velocity of 44.289078952755766 mph.~n",
                                [])),
                 (?capturedOutput)),
    Pid ! {stopped},
    wait_removing_table(planemos).

check_eris() ->
    Pid1 = spawn(mph_drop, mph_drop, []),
    Pid1 ! {eris, 20},
    timer:sleep(timer:seconds(1) div 5),
    ?assertEqual("On eris, a fall of 20 meters yields "
                 "a velocity of 12.65402255793022 mph.\n",
                 (?capturedOutput)),
    Pid1 ! {stopped},
    wait_removing_table(planemos).

check_makemake() ->
    Pid1 = spawn(mph_drop, mph_drop, []),
    Pid1 ! {makemake, 20},
    timer:sleep(timer:seconds(1) div 5),
    ?assertEqual("On makemake, a fall of 20 meters yields "
                 "a velocity of 10.003883211552367 mph.\n",
                 (?capturedOutput)),
    Pid1 ! {stopped},
    wait_removing_table(planemos).

check_mercury() ->
    Pid1 = spawn(mph_drop, mph_drop, []),
    Pid1 ! {mercury, 20},
    timer:sleep(timer:seconds(1) div 5),
    % ,?debugFmt("~n~p~n",[?capturedOutput])
    ?assertEqual("On mercury, a fall of 20 meters yields "
                 "a velocity of 27.213504494952623 mph.\n",
                 (?capturedOutput)),
    Pid1 ! {stopped},
    wait_removing_table(planemos).

check_venus() ->
    Pid1 = spawn(mph_drop, mph_drop, []),
    Pid1 ! {venus, 20},
    timer:sleep(timer:seconds(1) div 5),
    % ,?debugFmt("~n~p~n",[?capturedOutput])
    ?assertEqual("On venus, a fall of 20 meters yields "
                 "a velocity of 42.2064295069454 mph.\n",
                 (?capturedOutput)),
    Pid1 ! {stopped},
    wait_removing_table(planemos).

check_moon() ->
    Pid1 = spawn(mph_drop, mph_drop, []),
    Pid1 ! {moon, 20},
    timer:sleep(timer:seconds(1) div 5),
    % ,?debugFmt("~n~p~n",[?capturedOutput])
    ?assertEqual("On moon, a fall of 20 meters yields "
                 "a velocity of 17.89549032 mph.\n",
                 (?capturedOutput)),
    Pid1 ! {stopped},
    wait_removing_table(planemos).

check_mars() ->
    Pid1 = spawn(mph_drop, mph_drop, []),
    Pid1 ! {mars, 20},
    timer:sleep(timer:seconds(1) div 5),
    % ,?debugFmt("~n~p~n",[?capturedOutput])
    ?assertEqual("On mars, a fall of 20 meters yields "
                 "a velocity of 27.213504494952623 mph.\n",
                 (?capturedOutput)),
    Pid1 ! {stopped},
    wait_removing_table(planemos).

check_ceres() ->
    Pid1 = spawn(mph_drop, mph_drop, []),
    Pid1 ! {ceres, 20},
    timer:sleep(timer:seconds(1) div 5),
    % ,?debugFmt("~n~p~n",[?capturedOutput])
    ?assertEqual("On ceres, a fall of 20 meters yields "
                 "a velocity of 7.3513227944095085 mph.\n",
                 (?capturedOutput)),
    Pid1 ! {stopped},
    wait_removing_table(planemos).

check_jupiter() ->
    Pid1 = spawn(mph_drop, mph_drop, []),
    Pid1 ! {jupiter, 20},
    timer:sleep(timer:seconds(1) div 5),
    % ,?debugFmt("~n~p~n",[?capturedOutput])
    ?assertEqual("On jupiter, a fall of 20 meters yields "
                 "a velocity of 67.9969762867403 mph.\n",
                 (?capturedOutput)),
    Pid1 ! {stopped},
    wait_removing_table(planemos).

check_saturn() ->
    Pid1 = spawn(mph_drop, mph_drop, []),
    Pid1 ! {saturn, 20},
    timer:sleep(timer:seconds(1) div 5),
    % ,?debugFmt("~n~p~n",[?capturedOutput])
    ?assertEqual("On saturn, a fall of 20 meters yields "
                 "a velocity of 42.442881942521616 mph.\n",
                 (?capturedOutput)),
    Pid1 ! {stopped},
    wait_removing_table(planemos).

check_uranus() ->
    Pid1 = spawn(mph_drop, mph_drop, []),
    Pid1 ! {uranus, 20},
    timer:sleep(timer:seconds(1) div 5),
    % ,?debugFmt("~n~p~n",[?capturedOutput])
    ?assertEqual("On uranus, a fall of 20 meters yields "
                 "a velocity of 41.72950538888042 mph.\n",
                 (?capturedOutput)),
    Pid1 ! {stopped},
    wait_removing_table(planemos).

check_neptune() ->
    Pid1 = spawn(mph_drop, mph_drop, []),
    Pid1 ! {neptune, 20},
    timer:sleep(timer:seconds(1) div 5),
    % ,?debugFmt("~n~p~n",[?capturedOutput])
    ?assertEqual("On neptune, a fall of 20 meters yields "
                 "a velocity of 46.92237147489824 mph.\n",
                 (?capturedOutput)),
    Pid1 ! {stopped},
    wait_removing_table(planemos).

check_pluto() ->
    Pid1 = spawn(mph_drop, mph_drop, []),
    Pid1 ! {pluto, 20},
    timer:sleep(timer:seconds(1) div 5),
    % ,?debugFmt("~n~p~n",[?capturedOutput])
    ?assertEqual("On pluto, a fall of 20 meters yields "
                 "a velocity of 10.958704995228914 mph.\n",
                 (?capturedOutput)),
    Pid1 ! {stopped},
    wait_removing_table(planemos).

check_haumea() ->
    Pid1 = spawn(mph_drop, mph_drop, []),
    Pid1 ! {haumea, 20},
    timer:sleep(timer:seconds(1) div 5),
    % ,?debugFmt("~n~p~n",[?capturedOutput])
    ?assertEqual("On haumea, a fall of 20 meters yields "
                 "a velocity of 9.384474294979649 mph.\n",
                 (?capturedOutput)),
    Pid1 ! {stopped},
    wait_removing_table(planemos).

%% Util

wait_removing_table(TableName) ->
    case ets:info(TableName) of
        undefined ->
            % ?debugFmt("Table ~p is deleted~n",[TableName]),
            ok;
        _ ->
            timer:sleep(timer:seconds(1) div 5),
            wait_removing_table(TableName)
    end.
