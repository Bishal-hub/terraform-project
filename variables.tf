variable "stage" {                                                  # Resource selection variable

  description = "Select resource type"                              # Variable description

  type = string                                                     # Variable datatype
}

variable "instance_type" {                                          # EC2 instance type variable

  description = "EC2 instance type"                                 # Variable description

  type = string                                                     # Variable datatype
}

variable "bucket_name" {                                            # S3 bucket name variable

  description = "S3 bucket name"                                    # Variable description

  type = string                                                     # Variable datatype
}