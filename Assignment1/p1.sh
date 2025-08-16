 #Write a shell script to implement a menu driven integer calculator having the following operations,
#1. Addition of 2 numbers
#2. Subtraction of 2 numbers
#3. Multiplication of 2 numbers
#4. Division of 2 numbers
#5. Modulo of 2 numbers
#6. Exit
#For each operation the operands should be user input.

# Loop runs until the user chooses to exit
while true; do
  echo "Select an operation:"
  echo "+. Addition"
  echo "-. Subtraction"
  echo "*. Multiplication"
  echo "/. Division"
  echo "%. Modulo"
  echo "Press any other key to Exit"

  # Take operator choice
  read -p "Enter your choice: " operator

  case $operator in
    +)
      # Take two integer inputs
      read -p "Enter first integer: " num1
      read -p "Enter second integer: " num2

      # Validate integers using regex
      if ! [[ "$num1" =~ ^-?[0-9]+$ ]] || ! [[ "$num2" =~ ^-?[0-9]+$ ]]; then
        echo "Invalid input. Please enter valid integers."
        continue
      fi

      # Perform addition
      result=$((num1 + num2))
      echo "Result: $num1 + $num2 = $result"
      ;;
    -)
      read -p "Enter first integer: " num1
      read -p "Enter second integer: " num2
      if ! [[ "$num1" =~ ^-?[0-9]+$ ]] || ! [[ "$num2" =~ ^-?[0-9]+$ ]]; then
        echo "Invalid input. Please enter valid integers."
        continue
      fi
      result=$((num1 - num2))
      echo "Result: $num1 - $num2 = $result"
      ;;
    \*)
      read -p "Enter first integer: " num1
      read -p "Enter second integer: " num2
      if ! [[ "$num1" =~ ^-?[0-9]+$ ]] || ! [[ "$num2" =~ ^-?[0-9]+$ ]]; then
        echo "Invalid input. Please enter valid integers."
        continue
      fi
      result=$((num1 * num2))
      echo "Result: $num1 * $num2 = $result"
      ;;
    /)
      read -p "Enter first integer: " num1
      read -p "Enter second integer: " num2
      if ! [[ "$num1" =~ ^-?[0-9]+$ ]] || ! [[ "$num2" =~ ^-?[0-9]+$ ]]; then
        echo "Invalid input. Please enter valid integers."
        continue
      fi
      if [ "$num2" -eq 0 ]; then
        echo "Error: Division by zero is not allowed."
        continue
      fi
      result=$((num1 / num2))
      echo "Result: $num1 / $num2 = $result"
      ;;
    %)
      read -p "Enter first integer: " num1
      read -p "Enter second integer: " num2
      if ! [[ "$num1" =~ ^-?[0-9]+$ ]] || ! [[ "$num2" =~ ^-?[0-9]+$ ]]; then
        echo "Invalid input. Please enter valid integers."
        continue
      fi
      if [ "$num2" -eq 0 ]; then
        echo "Error: Modulo by zero is not allowed."
        continue
      fi
      result=$((num1 % num2))
      echo "Result: $num1 % $num2 = $result"
      ;;
    *)
      # Any other input exits the loop
      echo "Exiting..."
      break
      ;;
  esac
done