# Clone repo
git clone https://github.com/VectraCommunity/terraform

# Install aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Conifgure AWS Profile
aws configure --profile <NAME>
export AWS_PROFILE=<NAME>
