#!/usr/bin/env bats

load "$BATS_PATH/load.bash"

setup() {
    export BUILDKITE_PLUGIN_TEST_STR_PARAM="test-string"
    export BUILDKITE_PLUGIN_TEST_INT_PARAM=123
}

@test "Optional parameters are echoed if they exist" {
    run hooks/pre-exit

    assert_success
    assert_output --partial "This is the pre-exit hook!"
    assert_output --partial "String parameter: ${BUILDKITE_PLUGIN_TEST_STR_PARAM}"
    assert_output --partial "Integer parameter: ${BUILDKITE_PLUGIN_TEST_INT_PARAM}"
}

@test "Optional parameters are not echoed if they don't exist" {
    unset BUILDKITE_PLUGIN_TEST_STR_PARAM
    unset BUILDKITE_PLUGIN_TEST_INT_PARAM
    
    run hooks/pre-exit

    assert_success
    assert_output --partial "This is the pre-exit hook!"
    refute_output --partial "String parameter: ${BUILDKITE_PLUGIN_TEST_STR_PARAM}"
    refute_output --partial "Integer parameter: ${BUILDKITE_PLUGIN_TEST_INT_PARAM}"
}
