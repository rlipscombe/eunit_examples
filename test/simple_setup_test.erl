-module(simple_setup_test).
-include_lib("eunit/include/eunit.hrl").

suite_setup() ->
    % Setup for a group of tests goes here.
    % For example:
    {ok, Pid} = some_server:start_link(),
    Pid.

suite_cleanup(Pid) ->
    % The result from suite_setup is passed as the argument to suite_cleanup.
    exit(Pid, kill),
    ok.

simple_setup_test_() ->
    % 'setup' sets up a single fixture for running all of the specified tests.
    {setup, fun suite_setup/0, fun suite_cleanup/1, [
        fun pass/0,
        fun() -> ?assert(true) end,
        ?_assert(true)
    ]}.

pass() -> ?assert(true).
