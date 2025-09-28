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
read -p "enter num1: " num1
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

###### function with input
```
sumoftwo() {
  read -p "enter num 1 : " n1
  read -p "enter num 2 : " n2
  greet
  echo sum of $n1 and $n2 is : $((n1+n2)) 
}
```

###### function with input
```
# Define the function and use positional parameters $1 and $2
sumoftwo() {
    local n1=$1
    local n2=$2
    local sum=$((n1+n2))
    echo "sum of $n1 and $n2 is : $sum"
}

# --- Example of how to call the function ---

# Call the function with two numbers as arguments
sumoftwo 5 10

# Call the function with different numbers
sumoftwo 25 75

# Call the function using variables
a=100
b=200
sumoftwo $a $b
sumoftwo "$a" "$b"
```