#!/bin/sh
info=`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I`
ssid=`echo "${info}" | grep -w SSID | awk '{print $2}'`
rssi=`echo "${info}" | grep -w agrCtlRSSI | awk '{print $2}'`
stat=`echo "${info}" | grep -w state | awk '{print $2}'`
rate=`echo "${info}" | grep -w lastTxRate | awk '{print $2}'`
if [ ${ssid} = '' ]; then
  echo 'Wi-Fi off'
elif [ ${stat} != 'running' ]; then
  echo 'Wi-Fi off'
else
  sigLev=''

  # if [ $rssi -ge -80 ]; then
  #   sigLev='▉'
  # elif [ $rssi -ge -82 ]; then
  #   sigLev='▇'
  # elif [ $rssi -ge -84 ]; then
  #   sigLev='▆'
  # elif [ $rssi -ge -86 ]; then
  #   sigLev='▅'
  # elif [ $rssi -ge -88 ]; then
  #   sigLev='▃'
  # elif [ $rssi -ge -90 ]; then
  #   sigLev='▂'
  # elif [ $rssi -ge -92 ]; then
  #   sigLev='▁'
  # fi

  # levels=(▁ ▃ ▅ ▇)
  # for i in {0..4}; do
  #   case "${i}" in
  #     0 )
  #       if [ $rssi -gt -94 ]; then
  #         sigLev="${sigLev}${levels[${i}]}"
  #       else
  #         sigLev="${sigLev} "
  #       fi
  #       ;;
  #     1 )
  #       if [ $rssi -gt -92 ]; then
  #         sigLev="${sigLev}${levels[${i}]}"
  #       else
  #         sigLev="${sigLev} "
  #       fi
  #       ;;
  #     2 )
  #       if [ $rssi -gt -86 ]; then
  #         sigLev="${sigLev}${levels[${i}]}"
  #       else
  #         sigLev="${sigLev} "
  #       fi
  #       ;;
  #     3 )
  #       if [ $rssi -gt -79 ]; then
  #         sigLev="${sigLev}${levels[${i}]}"
  #       else
  #         sigLev="${sigLev} "
  #       fi
  #       ;;
  #   esac
  # done
  # sigLev="[${sigLev}]"

  colour="#[fg=colour246]"
  echo "${colour}${ssid} ${rate}Mbps ${sigLev}"
fi
