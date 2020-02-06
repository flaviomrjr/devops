variable "amis" {
	type = map
	
	default = {
		"sa-east-1" = "ami-05494b93950efa2fd"
		"us-east-2" = "ami-02ccb28830b645a41" 	
	}	
}

variable "cdirs_acesso_remoto" {
	type = list
	default = ["firstip/32","secondip/32"]
}

variable "key_name" { 
	default = "DEVOPS"	
}
