#!/usr/bin/env roundup

source functions.sh

before() {
  POW_DIR=/tmp/alfred-pow
  rm -rf $POW_DIR
  mkdir $POW_DIR
  mkdir $POW_DIR/app1
  mkdir $POW_DIR/app2
}

after() {
  rm -rf /tmp/alfred-pow
}

describe "pow actions"

it_restarts_pow() {
  result=$(restart_pow)
  [[ -f $POW_DIR/restart.txt ]]
  [[ "$result" == "is restarting..." ]]
}

it_restarts_pow_app_no_arg() {
  result=$(restart_pow_app)
  [[ "$result" == " is not a valid app." ]]
}

it_restarts_pow_app_invalid_arg() {
  result=$(restart_pow_app 'invalid')
  [[ "$result" == "invalid is not a valid app." ]]
}

it_restarts_pow_app_valid_arg() {
  result=$(restart_pow_app 'app1')
  [[ -f $POW_DIR/app1/tmp/restart.txt ]]
  [[ "$result" == "app1 is restarting..." ]]
}

# override the 'open' command so we can test it
function open() {
  echo "open $*"
}

it_launches_pow_app_no_arg() {
  result=$(launch_pow_app)
  [[ "$result" == "" ]]
}

it_launches_pow_app_invalid_arg() {
  result=$(launch_pow_app 'invalid')
  [[ "$result" == "" ]]
}

it_launches_pow_app_valid_arg() {
  result=$(launch_pow_app 'app1')
  [[ "$result" == "open http://app1.dev/" ]]
}
