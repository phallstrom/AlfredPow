#!/usr/bin/env roundup

source functions.sh

describe "pow echo"

it_echos_start_items() {
  result=$(echo_start_items)
  [[ "${result//$'\n'/}" == "<?xml version=\"1.0\"?><items>" ]]
}

it_echos_end_items() {
  result=$(echo_end_items)
  [[ "$result" == "</items>" ]]
}

it_echos_item_with_no_args() {
  result=$(echo_item)
  [[ "${result//$'\n'/}" == "<item uid='' arg='' valid='' autocomplete=''><title></title><subtitle></subtitle><icon></icon></item>" ]]
}

it_echos_item_with_all_args() {
  result=$(echo_item uid arg valid autocomplete title subtitle icon)
  [[ "${result//$'\n'/}" == "<item uid='uid' arg='arg' valid='valid' autocomplete='autocomplete'><title>title</title><subtitle>subtitle</subtitle><icon>icon</icon></item>" ]]
}

