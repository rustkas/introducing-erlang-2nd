-module(planemo_storage_test).

-include("records.hrl").

-include_lib("eunit/include/eunit.hrl").

%%
%% Tests
%%
lounch_test_() ->
    [{spawn, fun check_setup/0},
     {spawn, fun check_planemo_content/0},
     {spawn, fun check_lookup/0},
     {spawn, fun check_insert/0}].

check_setup() ->
    Info = planemo_storage:setup(),
    [{size, Size}] = [Tuple
                      || Tuple <- Info, size == element(1, Tuple)],
    ?assertEqual(14, Size).

check_planemo_content() ->
    planemo_storage:setup(),
    DataList = ets:tab2list(planemos),
    % Records do not work here. So I have to use tuples...
    check_planemo(DataList, mercury, 3.7, 4878, 57.9),
    check_planemo(DataList, venus, 8.9, 12104, 108.2),
    check_planemo(DataList, earth, 9.8, 12756, 149.6),
    check_planemo(DataList, moon, 1.6, 3475, 149.6),
    check_planemo(DataList, mars, 3.7, 6787, 227.9),
    check_planemo(DataList, ceres, 0.27, 950, 413.7),
    check_planemo(DataList, jupiter, 23.1, 142796, 778.3),
    check_planemo(DataList, saturn, 9.0, 120660, 1427.0),
    check_planemo(DataList, uranus, 8.7, 51118, 2871.0),
    check_planemo(DataList, neptune, 11.0, 30200, 4497.1),
    check_planemo(DataList, pluto, 0.6, 2300, 5913.0),
    check_planemo(DataList, haumea, 0.44, 1150, 6484.0),
    check_planemo(DataList, makemake, 0.5, 1500, 6850.0),
    check_planemo(DataList, eris, 0.8, 2400, 10210.0).

check_lookup() ->
    planemo_storage:setup(),
    % ,[Eris] = ets:lookup(planemos,eris1)
    check_lookup(eris),
    check_lookup(eriseris).

check_lookup(PlanemoName) ->
    case ets:lookup(planemos, PlanemoName) of
        [Planemo] ->
            % ?debugFmt("~n~p~n",[Planemo]),
            check_planemo(Planemo, 0.8, 2400, 10210.0);
        [] -> ok
    end.

check_insert() ->
    planemo_storage:setup(),
    PlanemoName = mercury,
    [Planemo] = ets:lookup(planemos, PlanemoName),
    % Check that insertion will be successful.
    % Note that gravity is different
    ?assert((ets:insert(planemos,
                        #planemo{name = PlanemoName, gravity = 3.9,
                                 diameter = 4878, distance_from_sun = 57.9}))),
    [FoundPlanemo] = ets:lookup(planemos, PlanemoName),
    ?assert((element(3, Planemo) =/=
                 element(3, FoundPlanemo))).

%% Util

check_planemo(DataList, PlanemoName, Gravity, Diameter,
              DistanceFromSun) ->
    [Planemo] = [Planemo
                 || Planemo <- DataList,
                    PlanemoName == element(2, Planemo)],
    check_planemo(Planemo,
                  Gravity,
                  Diameter,
                  DistanceFromSun).

check_planemo(Planemo, Gravity, Diameter,
              DistanceFromSun) ->
    ?assertEqual(Gravity, (element(3, Planemo))),
    ?assertEqual(Diameter, (element(4, Planemo))),
    ?assertEqual(DistanceFromSun, (element(5, Planemo))).
