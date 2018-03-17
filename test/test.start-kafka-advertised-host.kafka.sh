#!/bin/bash -e

source test.functions

testAdvertisedHost() {
	# Given a hostname is provided
	export KAFKA_ADVERTISED_HOST_NAME=monkey
	export KAFKA_ADVERTISED_PORT=8888

	# When the script is invoked
	source "$START_KAFKA"

	# Then the configuration file is correct
	assertAbsent 'advertised.listeners'
	assertExpectedConfig 'listeners=PLAINTEXT://monkey:8888'
}

testAdvertisedHost
