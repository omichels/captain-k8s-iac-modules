variable "secret" {

  type = map(object({
    value = string
  }))
  sensitive = true
}


variable "key_vault_id" {
  type = string
}


resource "azurerm_key_vault_secret" "this" {

  for_each     = nonsensitive(var.secret)
  name         = each.key
  value        = lookup(each.value, "value")
  key_vault_id = var.key_vault_id
}
