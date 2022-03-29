# delete-stack: Cloudformation stuck stacks

The delete-stack.sh is a simple script to delete all cloudformation stuck stacks. 

## Pre Requisites:

For run the script do you need create a list of stacks and write to file, for that you can use:

```
aws cloudformation list-stacks --region=[region] aws cloudformation list-stacks --stack-status-filter DELETE_FAILED| grep -i stackid > stacks.txt
```

Sample of stacks.txt content: 

"StackId": "arn:aws:cloudformation:us-east-1:[ACCOUNT ID]:stack/[STACK-NAME]", 

Now do you need to remove "StackId:" before run the script. You can run the commands (samples):

````
sed -i s/\"//g stacks.txt 
````

````
sed  -i s/\,//g stacks.txt
````

```
sed -i s/\StackId://g stacks.txt
```

After that, you can verify the file:


```
cat stacks.txt 
```

Sample of file stacks.txt:

arn:aws:cloudformation:us-east-1:XXXXX:stack/STACK-NAME

## Usage

```
./delete-stack.sh
```

## Contributing
Pull requests are welcome! =D

