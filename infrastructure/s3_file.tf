resource "aws_s3_bucket_object" "python_code" {
  bucket = aws_s3_bucket.datalake.id
  key    = "code/python/job_tf.py"
  acl    = "private"
  source = "../job.py"
  etag   = filemd5("../job.py")
}
