-module(setup_result_test).
-include_lib("eunit/include/eunit.hrl").

suite_setup() ->
    {ok, Pid} = some_server:start_link(),
    Pid.

suite_cleanup(Pid) ->
    % Sending the 'kill' signal to the linked process also kills us, so trap exits:
    process_flag(trap_exit, true),
    exit(Pid, kill),
    ok.

setup_result_test_() ->
    % the result of Setup can be passed to each test, provided you wrap them in an instantiator:
    {setup, fun suite_setup/0, fun suite_cleanup/1, fun(_Pid) ->
        [
            fun() -> ?assert(true) end,
            ?_assert(true),
            % because of the hard-to-understand function names reported when using the above,
            % consider using an explicitly-named function:
            fun pass/0,
            % or a description:
            {"description", ?_assert(true)}
        ]
    end}.

pass() ->
    ?assert(true).

setup_result_list_test_nope() ->
    % It doesn't want a *list* of instantiators, just a *single* instantiator.
    {setup, fun suite_setup/0, fun suite_cleanup/1, [
        fun(_X) -> fun() -> ?assert(true) end end,
        fun(_X) -> ?_assert(true) end
    ]}.
