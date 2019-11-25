#Set the terraform backend
terraform {
  backend "local" {} #Using a local backend just for the demo, the reco is to use a remote backend, see : https://jamesdld.github.io/terraform/Best-Practice/BestPractice-1/
}

#Set the Provider
provider "azurerm" {
  subscription_id = "e469a261-e6fc-4363-94f1-3d8cdb259ec7"
  version         = ">= 1.36.0" #1.36.0 to support the resource azurerm_bastion_host #1.37.0 fix a bug with the bastion host naming #With "=1.32.0" No warning with version the nsg and route linkd
}
