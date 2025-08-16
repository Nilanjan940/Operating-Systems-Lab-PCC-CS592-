#Write a shell script to find out the factorial of a given number.
# Prompt user for input
echo "Enter a number:"
read num

# Validate input: must be a positive integer (0,1,2,...)
if ! [[ "$num" =~ ^[0-9]+$ ]]; then
  echo "Invalid input. Only positive integers allowed."
  exit 1
fi

# Initialize factorial result as 1
fact=1

# Initialize counter variable i as 1
i=1

# Loop from 1 to num (inclusive)
while [ $i -le $num ]
do
  # Multiply fact by current i
  fact=$((fact * i))

  # Increment counter i by 1
  i=$((i + 1))
done

# Display the result
echo "Factorial of $num is $fact"