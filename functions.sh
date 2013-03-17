#!/bin/bash

POW_DIR=$HOME/.pow

function echo_start_items() {
  echo '<?xml version="1.0"?>'
  echo '<items>'
}

function echo_end_items() {
  echo '</items>'
}

function echo_item() { # uid, arg, valid, autocomplete, title, subtitle, icon
  echo "<item uid='$1' arg='$2' valid='$3' autocomplete='$4'>"
  echo "<title>$5</title>"
  echo "<subtitle>$6</subtitle>"
  echo "<icon>$7</icon>"
  echo "</item>"
}

function restart_pow() {
  touch $POW_DIR/restart.txt
  echo "is restarting..."
}

function restart_pow_app() {
  if [[ -n "$1" && -e "$POW_DIR/$1" ]]
  then
    mkdir -p $POW_DIR/$1/tmp 2> /dev/null
    touch $POW_DIR/$1/tmp/restart.txt
    echo "$1 is restarting..."
  else
    echo "$1 is not a valid app."
  fi
}

function launch_pow_app() {
  if [[ -n "$1" && -e "$POW_DIR/$1" ]]
  then
    open http://$1.dev/
  fi
}
