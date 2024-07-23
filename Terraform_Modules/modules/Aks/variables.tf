variable "cluster_name" {

}
variable "rgname" {
    type = string
    default = "Resource_Group_name"
}

variable "location" {
    type = string
    default = "Central Us"
}
variable "ssh_public_key" {
    default = "~/.ssh/id_sra.pub"
}