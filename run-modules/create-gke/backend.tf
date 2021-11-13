# The block below configures backend to use the 'GCS' bucket.
# variables or functions cannot be used.
# validate values match your environment. 
# specially the bucket value, it should match the bucket you created in GCP. 

terraform {
  required_version = ">= 0.12"
}

terraform {
  backend "gcs" {
    bucket      = var.bucket_name
    prefix      = "terraform/remote-module-state"
    credentials = file(var.gcp_auth_file)
  }
}
