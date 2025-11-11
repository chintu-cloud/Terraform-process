# ===========================
# Outputs
# ===========================
output "ec2_instance_id" {
  value = aws_instance.name.id
}

output "ec2_public_ip" {
  value = aws_instance.name.public_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.name.bucket
}