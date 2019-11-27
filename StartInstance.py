import boto3
region = 'eu-west-1'
instances = ['i-0615ec0a9a507b7c5']
ec2 = boto3.client('ec2', region_name=region)

def lambda_handler(event, context):
    ec2.start_instances(InstanceIds=instances)
    print('started your instances: ' + str(instances))