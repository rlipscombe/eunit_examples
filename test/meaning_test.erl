-module(meaning_test).
-include_lib("eunit/include/eunit.hrl").

the_test() ->
    ?assertEqual(42, meaning:meaning_of([life, universe, everything])).
