variable "instances" {
  type        = map
 
}

variable "domain_name" {
  default = "daws82s.shop"
}

variable "zone_id" {
  default = "Z00702313P0TRPWAK2ADU"
}

variable "common_tags" {
    default = {
        Project = "expense"
        Terraform = "true"
    }
}

variable "tags" {

}

variable "environment" {
    
}