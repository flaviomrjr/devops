variable "ami" { 
	default = "ami-08cfd57f1015c67eb"	
}

variable "key_name" { 
	default = "DEVOPS"	
}

variable "cdirs_full_access" {
	type = list
	default = ["xxx.xx.x.xx/32","x.xx.xxx.x/32"]
}

variable "vpcid" {
	default = "vpc-xxxxxxxxxxxxxxx"
}
