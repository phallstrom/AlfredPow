#/bin/bash

source functions.sh

#echo "$$=$1=$2=$3=" >> /tmp/output

case "$1" in
  'action')
    case "$2" in
      'restart')
        case "$3" in
          '')
            restart_pow
            ;;
          *)
            restart_pow_app $3
            ;;
        esac
        ;;
      'launch')
        launch_pow_app $3
        ;;
      *)
        echo "Unknown action:'$*'"
        ;;
    esac
    ;;
  'restart')
    echo_start_items
    [[ -z "$2" ]] && echo_item "pow_restart_pow" "action restart" "yes" "restart" "Restart Pow" "Restart Pow Itself" "icon.png"
    cd $POW_DIR
    for app in `ls -d *"$2"* 2>/dev/null`
    do
      echo_item "pow_restart_$app" "action restart $app" "yes" "restart $app" "$app" "Restart $app" "icon.png"
    done
    echo_end_items
    ;;
  *)
    echo_start_items
    [[ "restart" == *"$1"* ]] && echo_item "pow_restart" "restart" "no" "restart" "Restart Pow" "" "icon.png"
    cd $POW_DIR
    for app in `ls -d *"$1"* 2>/dev/null`
    do
      echo_item "pow_launch_$app" "action launch $app" "yes" "$app" "$app" "Luanch $app" "icon.png"
    done
    echo_end_items
    ;;
esac
