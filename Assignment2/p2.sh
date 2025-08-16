# Write a shell script that sorts an array of integers using any well-known sorting algorithm except Bubble sort.

# Check if no arguments are given
if [ $# -eq 0 ]; then
  echo "Error: No numbers provided."
  echo "Usage: $0 num1 num2 num3 ..."
  exit 1
fi

# Validate that all arguments are integers (positive or negative)
for num in "$@"; do
  if ! [[ "$num" =~ ^-?[0-9]+$ ]]; then
    echo "Error: '$num' is not a valid integer."
    exit 1
  fi
done

# Store all arguments in an array
arr=("$@")
n=$#

# -------------------------------
# Selection Sort Algorithm
# -------------------------------
for ((i=0; i<n-1; i++)); do
  # Assume the current index i has the minimum value
  min=$i

  # Compare with remaining elements
  for ((j=i+1; j<n; j++)); do
    if [ "${arr[j]}" -lt "${arr[min]}" ]; then
      min=$j
    fi
  done

  # Swap if a smaller element was found
  temp=${arr[i]}
  arr[i]=${arr[min]}
  arr[min]=$temp
done

# Print the sorted array
echo "Sorted array in ascending order: ${arr[@]}"