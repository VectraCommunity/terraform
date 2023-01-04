provider "aws" {
  region  = var.region
  profile = "sample"
}


resource "aws_cloudformation_stack" "sensor_stack" {
  name = "sensor-stack"
  parameters = {
    baseName          = var.baseName
    brainIP           = var.brainIP
    instanceType      = var.instanceType
    mgtPrivateIP      = var.mgtPrivateIP
    mgtSecurityGroup  = var.mgtSecurityGroup
    mgtSubnet         = var.mgtSubnet
    mgtVpc            = var.mgtVpc
    networkLB         = var.networkLB
    registrationToken = var.registrationToken
    sshKey            = var.sshKey
    tenancy           = var.tenancy
    trafficPrivateIP  = var.trafficPrivateIP
    trafficSecurityGroup = var.trafficSecurityGroup
    trafficSubnet     = var.trafficSubnet
    trafficVpc        = var.trafficVpc
  }

  template_url = var.templateURL

}

output "sensor_instance_id" {
  value = aws_cloudformation_stack.sensor_stack.outputs.InstanceId
}


output "sensor_private_mgt_ip" {
  value = aws_cloudformation_stack.sensor_stack.outputs.PrivateManagementIP
}
