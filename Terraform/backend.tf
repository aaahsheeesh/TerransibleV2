terraform {
  backend "s3" {
    bucket = "terransible-s3"
    key = "server_name/statefile"
    region = "ap-south-1"
  }
}  
