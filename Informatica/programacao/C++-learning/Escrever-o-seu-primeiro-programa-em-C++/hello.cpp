#include <iostream>

int main() {
    // Using std::endl for line breaks
    std::cout << "Hello, World!" << std::endl;
    std::cout << "Welcome to C++ Programming!" << std::endl;

    // Using \n for line breaks
    std::cout << "Using newline character:\n";
    std::cout << "Line 1\n";
    std::cout << "Line 2\n";

    // Mixing both methods
    std::cout << "Mixing methods: " << std::endl;
    std::cout << "Line with endl\n";
    std::cout << "Line with newline character" << std::endl;

    return 0;
}