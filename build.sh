#/usr/bin/zsh

project_name=shanwer_stl

root_dir_path=/e/project/04-flyMe2theStar/02-TinySTL
src_dir_path=$root_dir_path/src
test_dir_path=$root_dir_path/test

build_dir_path=$test_dir_path/build
build_file_path=$build_dir_path/$project_name

# 1. check and clean test

if [ ! -d $test_dir_path ]; then
    echo "$test_dir_path not found, creating..."
    mkdir $test_dir_path
fi

if [ "$(ls -A $test_dir_path)" ]; then
    echo "Clearing existing files in test directory..."
    rm -r $test_dir_path/*
fi

echo "Copying files from src to test..."
cp $src_dir_path/* $test_dir_path/

# 2. make in test/

cd $test_dir_path

if [ -f CMakeLists.txt ]; then
    echo "Running make..."
    if [ ! -d $build_dir_path ]; then
        mkdir $build_dir_path
    fi
    cd $build_dir_path
    cmake $test_dir_path
    make
else
    echo "Makefile not found in test directory. Please check the configuration."
    exit 1
fi

# 3. run build file

if [ -f $build_file_path ]; then
    echo "Running the compiled executable..."
    echo "==========================="
    $build_file_path
    echo "\n==========================="
    echo "Script completed successfully."
else
    echo "Executable not found. Please check the compilation process."
    exit 1
fi

