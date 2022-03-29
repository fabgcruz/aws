# delete-stack: Cloudformation stuck stacks

The delete-stack.sh is a simple script to delete all cloudformation stuck stacks. 

## Pre Requisites:

For run the script do you need create a list of stacks and write to file, for that you can use:

```
aws cloudformation list-stacks  --region=[region] --stack-status-filter DELETE_FAILED| grep -i stack-name > [filename].txt
```

After that you should verify the content of file, using the command:

```
cat [filename].txt 
```

Now, if you whish to verify how much lines was created use the follow command:

```
cat [filename].txt | wc -l
```

Next step: It is necessary to clean some characters that are in the lines contained in the file.

Sample of [filename].txt content: 

"StackName": "arn:aws:cloudformation:us-east-1:[ACCOUNT ID]:stack/[STACK-NAME],""
 

Now do you need to remove "StackName:" before run the script. You can run the commands (samples):

To remove quotes:

````
sed -i s/\"//g [filename].txt    
````

To remove "," :
````
sed  -i s/\,//g [filename].txt
````

To remove "StackName:"
```
sed -i s/\StackName://g [filename].txt
```

After that you must check if all characters have been removed:

```
cat [filename].txt 
```

Each line in the file refers to a stack name that must be deleted.


## Usage

```
./delete-stack.sh
```

## Check

After run the script delete-stack.sh you can check the status. For that use the command:

```
watch -n 60 'aws cloudformation list-stacks --region=[region]  --stack-status-filter DELETE_IN_PROGRESS | grep -i stackid > us-test.txt; cat us-test.txt | wc -l'
```

## Contributing
Pull requests are welcome! =D

