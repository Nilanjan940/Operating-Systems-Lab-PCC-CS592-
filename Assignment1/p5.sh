#Write a shell script to generate Fibonacci series up to N-th term, where N is user input.

# Prompt user for input
echo "Enter number of terms:"
read n

# Validate input: must be a positive integer greater than 0
if ! [[ "$n" =~ ^[0-9]+$ ]] || [ "$n" -lt 1 ]; then
  echo "Invalid input. Only positive integers allowed."
  exit 1
fi

# First two Fibonacci numbers
a=0
b=1

echo "Fibonacci Series:"

# Loop from 0 to n-1
for ((i=0; i<n; i++)); do
  # Print current number without newline (-n option)
  echo -n "$a "

  # Next term is sum of previous two terms
  c=$((a + b))

  # Shift values: a becomes b, b becomes c
  a=$b
  b=$c
done

# Print newline after series
echo