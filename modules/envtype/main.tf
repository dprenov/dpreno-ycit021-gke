locals {
  environments = {
    "dev"  : local.dev,
    "uat"  : local.uat,
	"qa"   : local.qa,
    "prod" : local.prod
  }
}