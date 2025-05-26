provider "aws" {
    region = "ap-south-1"
}

import {
  to = aws_instance.vm
  id = "i-06fc33be4eb09849d" 
}
