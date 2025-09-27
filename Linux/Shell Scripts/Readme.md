###### Print command
```
echo hello world
```

###### create variable
```
name=hero
```
###### or
```
export name=hero
```

###### print variable
```
echo $hero
```

###### input from user
```
read -p "enter num1: " $num1
```

###### perform addition
```
export n1=12
export n2=10
echo $n1 + $n2 = $((n1+n2)) # option 2: $(expr $n1 + $n2 )
```

###### perform exponent
```
echo $n1 + $n2 = $((n1**2))
```

###### write file
```
cat > hello.txt <<EOF
this is my way to
success. keep going.
EOF
```

###### create empty file
```
touch sample.txt
```

###### write file by appending
```
echo this is my way to >> sample.txt
echo success. keep going. >> sample.txt
```

###### write file by appending
```
echo "this is my way to" >> sample.txt
echo "success. keep going." >> sample.txt
```

##### create function
```
# Define a simple function
greet() {
  echo "Hello from the greet function!"
}

# Call the function
greet
```