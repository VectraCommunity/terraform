#Variables for Templates
region = "us-west-2"
baseName = "bxp-tf"
brainIP = "192.168.1.100"
instanceType = "r5.large"
mgtPrivateIP = "AWS::NoValue"
mgtSecurityGroup = "AWS::NoValue"
mgtSubnet = "subnet-AAAA"
mgtVpc = "vpc-BBBB"
networkLB = "AWS::NoValue"
registrationToken = "AWS::NoValue"
sshKey = "sample_dev"
tenancy = "default"
trafficPrivateIP = "AWS::NoValue"
trafficSecurityGroup = "AWS::NoValue"
trafficSubnet = "subnet-CCCC"
trafficVpc = "vpc-DDDD"

#Templates for Sensor and LB
templateSensor = "https://s3.amazonaws.com/awsmp-fulfillment-cf-templates-prod/a94aa1e6-cb82-42c6-89de-b9309ef5c6e1.c0067ec9-a080-4021-7589-c580c626eca7.template"
templateNLB = "https://cognito-public-deployment-tools.s3.us-west-2.amazonaws.com/AwsSensor/6.15/loadBalancerTemplate.json"

#Variables for API
APIauth = "YYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
BrainURI = "https://192.168.1.100/"

#AWS Porfile fot Terraform
AWSprofile = "test"
