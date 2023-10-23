# Define where your C++ files and compiled executables are
CPP_DIR="$HOME/.config/zsh/custom_functions"
BIN_DIR="$HOME/bin" # Assuming this is in your PATH

# Make sure the binary directory exists
mkdir -p $BIN_DIR

# Loop through all the C++ files and compile them if needed
for cpp_file in $CPP_DIR/*.cpp; do
  # Get the filename without the extension
  filename=$(basename -- "$cpp_file")
  filename_noext="${filename%.*}"
  
  # Define the corresponding executable name
  executable="$BIN_DIR/$filename_noext"
  
  # Compile the C++ file if the executable doesn't exist or is older
  if [ ! -f $executable ] || [ $cpp_file -nt $executable ]; then
    echo "Compiling $filename_noext..."
    g++ -std=c++17 $cpp_file -o $executable
  fi
done
