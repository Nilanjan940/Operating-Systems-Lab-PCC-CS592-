#Write a shell script to find the summation of N natural numbers, where the values of N natural numbers are passed as command line arguments.
#e.g.  $  ./mysum.sh  2 3 4 5 6 7 8 9 10 11 12 13 14 15

# Check if no arguments are given
if [ $# -eq 0 ]; then
  echo "Error: No numbers provided."
  echo "Usage: $0 num1 num2 num3 ..."
  exit 1
fi

# Initialize sum as 0
sum=0

# Loop through each argument provided
for num in "$@"; do
  # Validate: must be a natural number (1,2,3,... no zero or negatives)
  if ! [[ "$num" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: '$num' is not a natural number."
    exit 1
  fi

  # Add number to sum
  sum=$((sum + num))
done

# Print the result
echo "The sum of the $# natural numbers: $sum"