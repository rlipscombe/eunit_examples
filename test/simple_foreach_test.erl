-module(simple_foreach_test).
-include_lib("eunit/include/eunit.hrl").

simple_foreach_test_() ->
    % 'foreach' sets up a fixture for each of the specified tests.
    {foreach, fun setup/0, fun cleanup/1, [
        fun some_test/0,
        fun another_test/0
    ]}.

setup() ->
    {ok, Pid} = some_server:start_link(),
    Pid.

cleanup(Pid) ->
    % The result from suite_setup is passed as the argument to suite_cleanup.
    unlink(Pid),    % ...so we don't also get killed
    exit(Pid, kill),
    ok.

some_test() -> ?assert(true).
another_test() -> ?assert(true).
