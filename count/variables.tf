variable "instance_names" {
    type= list
    default= ["mongodb","reddis","mysql","rabbitmq","catalogue","user","cart","shipping","payment","dispatch","web"]
}

variable "ami_id" {
    default = "ami-0b4f379183e5706b9"

}