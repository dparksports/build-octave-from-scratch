#!/bin/bash
NOWIPADDR="/home/structural/nowipaddr"
GETIPADDR="dig +short myip.opendns.com @resolver1.opendns.com"
LOG="/home/structural/ip.log"
timestamp=$( date +%T )
curDate=$( date +"%m-%d-%y" )

if [ -f $NOWIPADDR ]; then
  if [[ `$GETIPADDR` = $(< $NOWIPADDR) ]]; then
    echo $curDate $timestamp $(< $NOWIPADDR) >> $LOG
  else
    $GETIPADDR > $NOWIPADDR
    echo "Server IP" < $NOWIPADDR
    #mail -s "Server IP" email@gmail.com < $NOWIPADDR
  fi
else
  $GETIPADDR > $NOWIPADDR
  echo "Server IP" < $NOWIPADDR
  #mail -s "Server IP" email@gmail.com < $NOWIPADDR
fi
