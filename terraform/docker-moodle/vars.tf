variable "ami" { 
	default = "ami-0b8d86d4bf91850af"	
}

variable "key_name" { 
	default = "DEVOPS"	
}

variable "cdirs_full_access" {
	type = list
	default = ["xx.xx.xxx.x","xx.xxx.x.xx/32"]
}
