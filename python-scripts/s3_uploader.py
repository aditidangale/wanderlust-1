import boto3
import sys

bucket = sys.argv[1]
file_path = sys.argv[2]

s3 = boto3.client('s3')

s3.upload_file(file_path, bucket, file_path)

print(f"Uploaded {file_path} to {bucket}")
