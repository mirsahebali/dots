# String
text="learn/dsa/go"

# Set space as the delimiter
IFS='/'

# Read the split words into an array
# based on space delimiter
read -ra newarr <<<"$text"

# Print each value of the array by using
# the loop
last_idx="$((${#newarr[@]} - 1))"
echo "${newarr[$last_idx]}"
