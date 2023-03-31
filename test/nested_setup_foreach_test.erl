-module(nested_setup_foreach_test).
-include_lib("eunit/include/eunit.hrl").

nested_setup_foreach_test_() ->
    {setup, fun before_all/0, fun after_all/1,
        {foreach, fun before_each/0, fun after_each/1, [
            fun() -> ?assert(true) end,
            ?_assert(true)
        ]}}.

before_all() -> ok.
after_all(_) -> ok.

before_each() -> ok.
after_each(_) -> ok.
