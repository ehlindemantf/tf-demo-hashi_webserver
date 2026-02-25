#!/bin/bash
export instance_type="${instance_type}"
export environment="${environment}"
export region="${region}"

# Update and install Apache (Ubuntu uses apt + apache2, not yum + httpd)
sudo apt-get update -y
sudo apt-get install -y apache2
sudo systemctl enable apache2
sudo systemctl start apache2
sudo systemctl status apache2

sudo cat <<EOF > /var/www/html/index.html
<h1>Hello! This is a sales demo from the SE Team using the tf-demo-hashi repo</h1>
<p>Instance Type: $instance_type</p>
<p>Environment: $environment</p>
<p>Region: $region</p>
EOF
