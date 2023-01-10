terraform {
  required_providers {
    restapi = {
      source = "Mastercard/restapi"
      version = "1.18.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.AWSprofile
}

provider "restapi" {
  alias               = "restapi_headers"
  uri                 = var.BrainURI
  headers =  {
    Authorization     = "Token ${var.APIauth}"
  }
  insecure = true
  write_returns_object = true
  update_method = "POST"
}

resource "restapi_object" "sensor" {
  provider = restapi.restapi_headers
  path = "/api/v2.2/sensor_token"
  data = "{}"
  id_attribute = "result"
  object_id = "update_sensor_token"
}

resource "aws_cloudformation_stack" "nlb_stack" {
  name = "${var.baseName}-nlb"
  parameters = {
    baseName          = var.baseName
    subnets           = var.trafficSubnet
  }

  template_url = var.templateNLB

}

resource "aws_cloudformation_stack" "sensor_stack" {
  name = "${var.baseName}-sensor"
  parameters = {
    baseName          = var.baseName
    brainIP           = var.brainIP
    instanceType      = var.instanceType
    mgtPrivateIP      = var.mgtPrivateIP
    mgtSecurityGroup  = var.mgtSecurityGroup
    mgtSubnet         = var.mgtSubnet
    mgtVpc            = var.mgtVpc
    networkLB         = aws_cloudformation_stack.nlb_stack.outputs.LoadBalancerARN
    registrationToken = restapi_object.sensor.api_data.token
    sshKey            = var.sshKey
    tenancy           = var.tenancy
    trafficPrivateIP  = var.trafficPrivateIP
    trafficSecurityGroup = var.trafficSecurityGroup
    trafficSubnet     = var.trafficSubnet
    trafficVpc        = var.trafficVpc
  }

  template_url = var.templateSensor

}

output "nlb_arn" {
  value = aws_cloudformation_stack.nlb_stack.outputs.LoadBalancerARN
}

output "sensor_instance_id" {
  value = aws_cloudformation_stack.sensor_stack.outputs.InstanceId
}

output "sensor_private_mgt_ip" {
  value = aws_cloudformation_stack.sensor_stack.outputs.PrivateManagementIP
}

output "token_used" {
  value = restapi_object.sensor.api_data.token
}
