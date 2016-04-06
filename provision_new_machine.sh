#! /bin/bash

display_usage(){
	 echo -e "\nExample Usage:\n$0 <NAME> <REGION> <MACHINE_TYPE> \n"
	 echo -e "\nExample Usage:\n$0 example us-east-1 collector \n" 
	}

if [ $# -lt 3 ]
then
        display_usage
        exit 1
fi

NAME=$1
REGION=$2
MACHINE_TYPE=$3

if [[ "$MACHINE_TYPE" != "collector" && "$MACHINE_TYPE" != "kafka" && "$MACHINE_TYPE" != "prearchiver" ]];
then
	echo "MACHINE_TYPE must be collector, kafka or prearchiver"
	exit 1
fi
#set -x
# Running playbook to create ec2 instace
echo "Provisioning a new EC2 instance based input information"
date 

#cd /etc/ansible
#ansible-playbook -i hosts ec2.yml -e "MACHINE_NAME=$NAME REGION=$REGION SUBNET_ID=$SUBNET AMI=$AMI INSTANCE_TYPE=$TYPE"

#ID=$(ec2-describe-tags --region $REGION | grep $NAME | awk '/instance/{ print $3}')
#IP=$(aws ec2 describe-instances --region $REGION --instance-ids $ID | awk ' /"PrivateIpAddress"/{gsub(/[",]+/, "", $2);print $2}' | sed -n '1p')

#echo "IP": $IP
#echo "ID": $ID


#Update host file
#cd /etc/ansible
#ansible-playbook playbooks/updt_hosts_file_pb.yml -e "ENV=qa IP=$IP SRVR_NAME=$NAME"

#Update inventory file
#cd /etc/ansible
#ansible-playbook playbooks/updt_inventory_file_pb.yml -e "MCN=$NAME"

echo "Sleep 2 minutes before it can provision base role"
date 
#sleep 120
# Update base for the instance
#ansible-playbook /playbooks/base_pb.yml -e "target=$NAME"

ansible-playbook playbooks/deploy_"$MACHINE_TYPE"_pb.yml
