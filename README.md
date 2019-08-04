# ns1_terraform_from_zone_file

This repository helps with creating a NS1 terraform resources from a zone file, to use this repo follow the next steps:
* Please add your zone file to the migration directory like a `migration/test.com.txt` file. 
* Run the script from migration directory `./terra_ns1_resources.sh <Zone name>` for example `./terra_ns1_resources.sh test.com`
* previous step creates the ns1_record resources for each line in zone file which you added in the first step.
* Configure the NS1 integration key `export NS1_APIKEY="<inegration key>"`
* Then use the `tf.sh` script
  * `./tf.sh plan`
  * `./tf.sh apply`
  
The script currently does not know how to handle cases when record have more than one answer or TXT and MS records.
