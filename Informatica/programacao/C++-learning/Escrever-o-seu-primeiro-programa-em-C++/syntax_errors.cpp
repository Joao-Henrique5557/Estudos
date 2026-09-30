#include <iostream>

int main() {
    // Common syntax error: Missing semicolon
    std::cout << "This line has an error";  // Missing semicolon here!
    std::cout << "This line will not compile" << std::endl;

    // Correct version with semicolons
    std::cout << "This line is correct" << std::endl;
    std::cout << "All statements end with a semicolon" << std::endl;

    return 0;  // Don't forget the semicolon here too!
}