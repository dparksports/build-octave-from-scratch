# for mac only, for lacking watch
while :;
  do
  echo "$(date)" >> arp.out && arp -i bridge100 -a >> arp.out
  sleep 1
done
