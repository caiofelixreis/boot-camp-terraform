resource "aws_s3_bucket" "datalake" {
    bucket= var.datalake_bucket_name
    acl = "private"

    server_side_encryption_configuration {
      rule {
          apply_server_side_encryption_by_default {
              sse_algotithm = "AE256"
          }
      }
    }

    tags = {
        PURPOUSE = "learning"
    }
}

resource "aws_s3_bucket_object" "python_code" {
  bucket = aws_s3_bucket.datalake
  key = "code/python/job_tf.py"
  acl="private"
  source="../job.py"
  etag= filemd5("../job.py")
}

provider "aws" {
    profile = "default"
    region = var.aws_default_region
}
