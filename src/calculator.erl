-module(calculator).
-export([
    subtract/2,
    multiply/2
]).

subtract(L, R) -> L - R.
multiply(L, R) -> L * R.

%% You can keep tests next to the code they're testing. There are a few times this makes sense:
%% - You want to test a private function. Try to avoid this.
%% - Your application is simple enough that having the tests next to the code is better. This is a matter of opinion.
-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

subtract_test() ->
    ?assertEqual(12, subtract(18, 6)).
-endif.
