data "template_file" "userdata" {
  template = <<EOF
#!/bin/bash
apt-get install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
EOF
}
