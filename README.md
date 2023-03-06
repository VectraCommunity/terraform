# About

This terraform can be used to automate adding a Vectra Sensor in AWS.  

There are 3 resources in this Terraform.
The first resource uses the MasterCard REST API provider (https://github.com/Mastercard/terraform-provider-restapi).  The purpose of this is to do an API call to the Vectra Brain and generate a new registration token for the Vectra Sensor using the /api/v2.2/sensor_token path.  This is then stored as a variable.

The second resource uses the AWS provider to launch a CloudFormation Stack to create a NLB in AWS.  The ARN is stored as a variable for the Vectra Sensor.  A NLB is required if you have more than 10 traffic mirror session using AWS Traffic Mirroring.  (https://docs.aws.amazon.com/vpc/latest/mirroring/traffic-mirroring-limits.html).  The base template has been provided by Vectra. 

The third resource uses the AWS provider to launch a CloudFormation Stack to create the Vectra Sensor in AWS.  The base template has been copied form the Vectra Sensor AWS Marketplace subscription.  
#
# To use: 

## Clone repo
git clone https://github.com/VectraCommunity/terraform

## Install aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

unzip awscliv2.zip

sudo ./aws/install

## Configure AWS Profile

aws configure --profile <NAME>

export AWS_PROFILE=<NAME>

## Get API token from Vectra Brain
Vectra uses a token for API authentication.  Log into the Brain, go to “My Profile” and you can either copy the existing token or create one if one doesn’t exist.  Careful if one exists as something may already be using it.  You will NOT want to generate a new token in that case as it will overwrite the existing.  Once you have a token you want to assign it in the terraform.tfvars (APIauth).  You only need to create this authorization token once.
