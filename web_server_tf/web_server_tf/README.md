# Nginx webserver on 8080

This Terraform module,
 - Creates a minimal Azure VM on Ubuntu and installs Nginx on it
 - Once VM is up Nginx is reloaded on port 8080
 - A Load balancer is created which exposes port 80 to outside and redirects the requests it receives to the VM on port 8080

Both VMSS & VM work the same way in terms of this web server and since a VM creation is quick that has been used.

## Running

After the repo is cloned run below commands,
> Note: Before running the commands please make sure to export AZURE Service Principal crendentials or do an AZ login to the required account where the resources need to be deployed !
> Also, the default name for the resource group is phani-test-rg
> Credentials for the launched VM instance are in modules/virtual-machine/vars.tf

```sh
terraform init
terraform apply -auto-approve
```

After the validation is done destroy the resources using,

```sh
terraform destroy -auto-approve
```
