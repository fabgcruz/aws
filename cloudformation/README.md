# delete-stack: Cloudformation stuck stacks

The delete-stack.sh is a simple script to delete all cloudformation stuck stacks. 

## Pre Requisites:

For run the script do you need create a list of stacks and write to file, for that you can use:

```
aws cloudformation list-stacks --region=[region] | grep -i stackid > stacks.txt
```

Sample of stacks.txt content: 

"StackId": "arn:aws:cloudformation:us-east-1:199337252292:stack/Marjan-Quicksight-Stack-ChildStack-1FMT0RTO92Q3D-ChildStack-13A7OBSR174N3-C-ChildStack-1PO4R7DQNJVSA/71a323b0-a9e3-11ec-a525-12bd19080301", 

Now do you need to remove "StackId:" before run the script. You can run the commands:

````
sed -i s/\"//g stacks.txt 
````

````
sed -i s/\,//g stacks.txt
````

```
sed -i s/\StackId://g stacks.txt
```

After that, you can verify the file:


```
cat stacks.txt 
```

Sample of file stacks.txt:

arn:aws:cloudformation:us-east-1:199337252292:stack/Marjan-Quicksight-Stack-ChildStack-1FMT0RTO92Q3D-ChildStack-13A7OBSR174N3-C-ChildStack-1PO4R7DQNJVSA/71a323b0-a9e3-11ec-a525-12bd19080301

## Usage

```
./delete-stack.sh
```

## Contributing
Pull requests are welcome! =D

