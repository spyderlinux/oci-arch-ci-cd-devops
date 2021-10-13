data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.tenancy_ocid
}

# Gets home and current regions

data "oci_identity_tenancy" "tenant_details" {
  tenancy_id = var.tenancy_ocid
  provider   = oci.current_region
}

data "oci_identity_regions" "home_region" {
  filter {
    name   = "key"
    values = [data.oci_identity_tenancy.tenant_details.home_region_key]
  }

  provider = oci.current_region
}

# Randoms
resource "random_string" "deploy_id" {
  length  = 4
  special = false
}