#Write a shell script to compute the Common Logarithm of an integer N. The value of N should be taken as command-line argument. The resulting value should not contain more than two digits after the decimal point.

# Check if no input is provided
if [ $# -eq 0 ]; then
  echo "Error: No input provided."
  echo "Usage: $0 <positive_integer>"
  exit 1
fi

# Check if more than one input is provided
if [ $# -gt 1 ]; then
  echo "Error: Multiple inputs provided. Only one expected."
  echo "Usage: $0 <positive_integer>"
  exit 1
fi

# Store the input number
n="$1"

# Validate: must be a positive integer (0,1,2,...)
if ! [[ "$n" =~ ^[0-9]+$ ]]; then
  echo "Error: '$n' is not a valid positive integer."
  exit 1
fi

# Special case: logarithm of 0 is undefined
if [ "$n" -eq 0 ]; then
  echo "Error: Logarithm of zero is undefined."
  exit 1
fi

# Use bc (with -l math library) to compute log10(n)
# Formula: log10(n) = ln(n) / ln(10)
log_result=$(echo "scale=4; l($n)/l(10)" | bc -l)

# Round to 2 decimal places using printf
rounded=$(printf "%.2f" "$log_result")

# Print final result
echo "Common logarithm (base 10) of $n is: $rounded"