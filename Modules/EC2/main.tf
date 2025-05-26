# EC2 - Main.tf

# To create ec2 instance
resource "aws_instance" "this"{
    count         = var.instance_count
    ami           = var.ami_id
    instance_type = var.instance_type

    tags = {
       Name = "${var.name_prefix}-${count.index}"
    }
}
