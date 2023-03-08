# TerransibleV2
python3 --version
If you don’t have python3, you can install it using the following command.

sudo yum install python3 -y
sudo yum -y install python-pip
Step 2: Install the boto3 library. Ansible uses the boto core to make API calls to AWS to retrieve ec2 instance details.

sudo pip install boto3
If you will not install boto3, you will get below error.

ERROR! The ec2 dynamic inventory plugin requires boto3 and botocore.
Step 3: Create an inventory directory under /opt and cd into the directory.

sudo mkdir -p /opt/ansible/inventory
cd /opt/ansible/inventory
Step 4: Create a file named aws_ec2.yaml in the inventory directory.

sudo vi aws_ec2.yaml

Step 5 : Create a file named aws_ec2.yaml in the inventory directory.

inventory directory: /opt/ansible

Default inventory is: /etc/ansible/hosts

You can change the inventory location as per your requirement, but you have to specify your inventory location in ansible configuration file.

 
Copy the following configuration to the aws_ec2.yaml file. 

---
plugin: aws_ec2


regions:
  - ap-south-1
filters:

  tag:Environment: prod
  
Note: You can change the tags as per the requirement.

Step 6 : Create a role with admin access policy and attach it to the server.

Note: if you don’t want to Create role, then you can put access and secret keys in the aws_ec2.yaml, but it is not a good practice.

Step 7 : Enable EC2 plugin

Open /etc/ansible/ansible.cfg file.

sudo vi /etc/ansible/ansible.cfg
Find the [inventory] section and add the following line to enable the ec2 plugin.

enable_plugins = aws_ec2
 
Step 8 : Now it’s time to test our dynamic inventory.

Run the below ad hoc command to test our dynamic inventory.

ansible-inventory -i /opt/ansible/inventory/aws_ec2.yaml --list
