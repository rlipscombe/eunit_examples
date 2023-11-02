-module(simple_setup_test).
-include_lib("eunit/include/eunit.hrl").

%% The 'setup' generator allows you to call some code before and after your tests run.

%% This test module uses an ETS table. We'll use a macro to define the name.
-define(TABLE, ?MODULE).

simple_setup_test_() ->
    {setup, fun setup/0, fun cleanup/1, [
        ?_assertError(badarg, ets:lookup_element(?TABLE, missing_key, 1)),

        % Don't do this. See below.
        fun not_member_test/0
    ]}.

setup() ->
    % Because setup and cleanup run in a different process from the test functions themselves, the table must be marked
    % 'public'. Rather than pass the table ID around (which we'll demonstrate elsewhere), we use a 'named_table'.
    ets:new(?TABLE, [set, public, named_table]).

cleanup(_) ->
    % We don't *need* to delete the table, since it's owned by the setup/cleanup process, and will be deleted
    % automatically.
    ets:delete(?TABLE).

not_member_test() ->
    % Beware: this test will be run *twice*:
    % 1. By naming it '_test()', it will be run directly by eunit.
    % 2. By returning it in the generator above, it will be run in that context.

    % If we did something like the following (commented out), the test will fail when run directly (because the ETS
    % table hasn't been created by 'setup' yet, or was already deleted).
    % This makes for a hard-to-find test failure.
    % ?assertNot(ets:member(?TABLE, missing_key)).

    % The ?debugHere macro prints out the file, line and pid; you can see it being output twice.
    ?debugHere,
    ok.
