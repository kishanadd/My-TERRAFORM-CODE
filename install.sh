#!bin/bash

## Source Common Functions

curl -s "https://raw.githubusercontent.com/linuxautomations/scripts/master/common-functions.sh" >/tmp/common-functions.sh
#source /root/scripts/common-functions.sh
source /tmp/common-functions.sh
URL=$(curl  https://www.terraform.io/downloads.html | grep linux_amd64.zip | awk -F \" '{print $2}')
wget -q -O /tmp/terraform.zip $URL &>/dev/null
if [ $? -eq 0 ]; then
     success "Download Terraform"
else
    error "CANNOT download Terraform"     
    exit 1
fi
cd /tmp/
unzip -o terraform.zip &>/dev/null
if [ $? -eq 0 ]; then
     success "Exact Terraform from zip"
else
    error "Cannot -- Exact Terraform "     
    exit 1
fi

sudo mv terraform /bin
chmod +x /bin/terraform
/bin/terraform --version &>/dev/null
if [ $? -eq 0 ]; then
     success " Terraform moved to bin folder "
else
    error "Cannot -- move Terraform to bin "     
    exit 1
fi