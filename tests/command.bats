#!/usr/bin/env bats

load "$BATS_PATH/load.bash"

setup() {
    export BUILDKITE_PLUGIN_TEST_BOOL_PARAM=true
}

@test "Required parameter is echoed if it exists" {
    run hooks/command

    assert_success
    assert_output --partial "This is the command hook!"
    assert_output --partial "Boolean parameter: ${BUILDKITE_PLUGIN_TEST_BOOL_PARAM}"
}

@test "Plugin exits if required parameter does not exist" {
    unset BUILDKITE_PLUGIN_TEST_BOOL_PARAM
    
    run hooks/command

    assert_failure
    assert_output --partial "This is the command hook!"
    assert_output --partial "Missing required parameter: `bool_param`"
    refute_output --partial "Boolean parameter: ${BUILDKITE_PLUGIN_TEST_BOOL_PARAM}"
}
