#!/bin/bash -e

source test.functions

testHostnameCommand() {
	# Given a hostname command is provided
	export HOSTNAME_COMMAND='f() { echo "my-host"; }; f'

	# When the script is invoked
	source "$START_KAFKA"

	# Then the configuration uses the value from the command
	assertAbsent 'advertised.listeners'
	assertExpectedConfig 'listeners=PLAINTEXT://my-host:9092'
}

testHostnameCommand
