#! /bin/bash

display_usage(){
	 echo -e "\nExample Usage:\n$0 example us-west-2 subnet-56180a21 ami-9abea4fb t2.micro \n" 
	}

if [ $# -lt 5 ]
then
        display_usage
        exit 1
fi

NAME=$1
REGION=$2
SUBNET=$3
AMI=$4
TYPE=$5

#set -x
# Running playbook to create ec2 instace
echo "Provisioning a new EC2 instance based input information"
date 

#cd /etc/ansible
ID=$(ansible-playbook -i hosts ec2.yml -e "MACHINE_NAME=$NAME REGION=$REGION SUBNET_ID=$SUBNET AMI=$AMI INSTANCE_TYPE=$TYPE" | grep "i-")

echo "ID": $ID


#Update host file
#cd /etc/ansible
#ansible-playbook playbooks/updt_hosts_file_pb.yml

#Update inventory file
#cd /etc/ansible
#ansible-playbook playbooks/updt_inventory_file_pb.yml 

# Update base for the instance
#ansible-playbook /playbooks/base_pb.yml

