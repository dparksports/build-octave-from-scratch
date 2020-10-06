adddate() {
    while IFS= read -r line; do
        printf '%s %s\n' "$(date)" "$line";
    done
}

while :;
  do
  arp -i bridge100 -a | gawk '{ print strftime("[%Y-%m-%d %H:%M:%S]"), $0 }' >> arp.log
  tail -n 1 arp.log | grep "FF:" | grep -q '.' && afplay /System/Library/Sounds/Purr.aiff
  tail -n 1 arp.log | grep "incomplete" | grep -q '.' && afplay /System/Library/Sounds/Pop.aiff
  sleep 1
done

