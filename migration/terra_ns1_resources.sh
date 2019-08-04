#!/bin/bash
zone_name=$1
rm -f ../zones/$zone_name/*

IFS=$'\n'
set -f
for line in $(cat < $zone_name.txt) ; do
echo $line | awk 'BEGIN {
    FS=" "
  }
  {
    resource_name = $1;
    gsub("\\.", "_", resource_name)
    gsub("\\-", "_", resource_name)
    print "resource \"ns1_record\" \"record_" resource_name "\" {"
    print "\t zone   = \"${var.zone}\""
    print "\t domain = \""$1".${var.zone}\""
    print "\t type   = \""$4"\""
    print "\t ttl    = "$2
    print "\t answers {"
    print "\t\t  answer = \""substr($5, 1, length($5)-1)"\""
    print "\t }"
    print "}"

    print "\n\n"
  }' > ../zones/$zone_name/$(echo $line | awk -F" " '{print $1}').tf
done
