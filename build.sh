#!/bin/sh

echo "Huffman Build script - IN505 C++ Project: Part 2\n"

./.check_dependencies.sh
ret=$?

if [ $ret -eq 0 ]
then
  echo "\nGenerating Makefile with cmake..."
  cmake CMakeLists.txt

  echo "\nBuilding C++ project..."
  make

  echo "\nBuild successful!"
  echo "Run with './partie_2'"
else
  echo "\nWARNING: Dependencies are not met."
  while true
  do
    read -r -p "Do you want to proceed to the build anyway? [Y/n] " input
    case $input in
    [yY]|[yY][eE][sS])
      echo "Proceeding to build..."

      echo "\nGenerating Makefile with cmake..."
      cmake CMakeLists.txt

      echo "\nBuilding C++ project..."
      make

      echo "\nBuild successful!"
      echo "Run with './partie_2'"
      break
      ;;

    [nN]|[nN][oO])
      echo "Try installing the necessary packages and re-run this script."
      break
      ;;

    *)
      echo "ERROR: Invalid input"
      ;;
    esac
  done
fi