while :;
  do
  date >> leash.log;
  arp -i bridge100 -a >> leash.log
  tail -n 4 leash.log | grep "FF:" | grep -q '.' && afplay /System/Library/Sounds/Purr.aiff
  tail -n 4 leash.log | grep "incomplete" | grep -q '.' && afplay /System/Library/Sounds/Pop.aiff
  sleep 1
done
