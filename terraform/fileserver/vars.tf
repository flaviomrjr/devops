variable "ami" { 
	default = "ami-0ace3320f5f88d40b"	
}

variable "key_name" { 
	default = "DEVOPS"	
}

variable "cdirs_full_access" {
	type = list
	default = ["ips01","ips02"]
}
