resource "aws_instance" "cloned" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.key_name
  
  # If the existing instance has an IAM role, add:
  # iam_instance_profile = "your-instance-profile-name"
  
  # Root volume configuration (adjust based on existing instance)
  root_block_device {
    volume_type           = "gp3"      # or gp2, io1, etc.
    volume_size           = 8          # Size in GB
    delete_on_termination = true
    encrypted             = false      # Set to true if encrypted
    
    # If using gp3:
    # iops       = 3000
    # throughput = 125
  }
  
  # If there are additional EBS volumes, add them:
  # ebs_block_device {
  #   device_name           = "/dev/sdf"
  #   volume_type           = "gp3"
  #   volume_size           = 100
  #   delete_on_termination = true
  #   encrypted             = false
  # }
  
  # User data script (if the existing instance has one)
  # user_data = file("user-data.sh")
  # OR
  # user_data = <<-EOF
  #   #!/bin/bash
  #   echo "Hello World"
  # EOF
  
  # Enable detailed monitoring if needed
  monitoring = false
  
  # Tags
  tags = {
    Name        = var.instance_name
    Environment = "production"  # Adjust as needed
    ManagedBy   = "OpenTofu"
    ClonedFrom  = "i-xxxxx"     # Reference to original instance
  }
  
  # Volume tags
  volume_tags = {
    Name = "${var.instance_name}-root"
  }
  
  # Metadata options (IMDSv2)
  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"    # Enforce IMDSv2
    http_put_response_hop_limit = 1
  }
}
