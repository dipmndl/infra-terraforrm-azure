
# The resource block defines the type of resource we want to work with
# The name and location are arguements for the resource block

resource "azurerm_resource_group" "sg_genai" {
  name     = "sg-genai"
  location = "South India"
  tags = {
    key   = "genai"
    value = "dev"
  }
}