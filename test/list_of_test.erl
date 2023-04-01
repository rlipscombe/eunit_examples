-module(list_of_test).
-include_lib("eunit/include/eunit.hrl").

list_of_test_() ->
    [
        fun something/0,
        fun() -> ?assert(true) end,
        ?_assert(true),
        {"description of test", ?_assert(true)},
        {<<"another test">>, fun another_thing/0}
    ].

something() -> ?assert(true).
another_thing() -> ?assert(true).
