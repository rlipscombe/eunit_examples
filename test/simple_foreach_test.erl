-module(simple_foreach_test).
-include_lib("eunit/include/eunit.hrl").

simple_foreach_test_() ->
    % 'foreach' sets up a fixture for each of the specified tests.
    {foreach, fun setup/0, fun cleanup/1, [
        fun() -> ?assert(true) end,
        ?_assert(true)
    ]}.

setup() -> ok.
cleanup(_) -> ok.
