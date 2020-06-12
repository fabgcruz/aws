import boto3

region = 'sa-east-1'
instances = ['REDACTED-INSTANCE-ID']

def lambda_handler(event, context):
    
    ec2 = boto3.client('ec2', region_name=region)
    ec2.stop_instances(InstanceIds=instances)
