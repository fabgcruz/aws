import boto3

ec2 = boto3.resource('ec2')


def lambda_handler(event, context):
    
    filters = [{
        'Name': 'tag:Autostartup',
        'Values': ['True']
    },
        {
            'Name': 'instance-state-name',
            'Values': ['stopped']
    }
    ]

    instances = ec2.instances.filter(Filters=filters)

    StoppedInstances = [instance.id for instance in instances]

    if len(StoppedInstances) > 0:
        startup = ec2.instances.filter(
        InstanceIds=StoppedInstances).start()
        print(startup)
    else:
        print("No Instances to init")
    
