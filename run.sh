#!/bin/bash

# Build and run C++ project, then clean up

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}Building project...${NC}"

# Create build directory if it doesn't exist
mkdir -p build
cd build

# Configure and build
if cmake .. && make; then
    echo -e "${GREEN}Build successful!${NC}"
    echo -e "${BLUE}Running program...${NC}"
    echo "----------------------------------------"
    
    # Run the executable
    ./prog
    
    echo "----------------------------------------"
    echo -e "${BLUE}Program finished. Cleaning up...${NC}"
    
    # Go back to project root and delete build directory
    cd ..
    rm -rf build
    
    echo -e "${GREEN}Build files cleaned!${NC}"
else
    echo -e "${RED}Build failed!${NC}"
    cd ..
    exit 1
fi
