-module(list_generator_test).
-include_lib("eunit/include/eunit.hrl").

%% Rather than have separate _test() functions, you can use a test generator to return a list of tests. This can
%% sometimes be more compact.
list_generator_test_() ->
    [
        % The test can be an anonymous function.
        fun() -> ?assertEqual(55.0, calculator:divide(110, 2)) end,

        % Or it can use the ?_test macro.
        ?_test(?assertEqual(34, calculator:add(28, 6))),

        % Or it can use one of the ?_assert macros.
        ?_assertEqual(33, calculator:subtract(35, 2))
    ].

single_generator_test_() ->
    % Remember that a generator doesn't have to return a list. It can return a single fun/0 or use a generator macro.
    ?_assertEqual(36, calculator:multiply(3, 12)).
