#Write a shell script to find the sum of digits of a user supplied number. Also, check for invalid user inputs and show appropriate error message.

# Prompt user for input
echo "Enter a number:"
read num

# Validate input: must be a positive integer
if ! [[ "$num" =~ ^[0-9]+$ ]]; then
  echo "Invalid input. Please enter a positive integer."
  exit 1
fi

# Initialize sum as 0
sum=0

# Loop until number becomes 0
while [ $num -gt 0 ]; do
  # Extract the last digit (remainder when divided by 10)
  digit=$((num % 10))

  # Add digit to sum
  sum=$((sum + digit))

  # Remove the last digit (integer division by 10)
  num=$((num / 10))
done

# Display the result
echo "Sum of digits: $sum"