#include <iostream>
#include <limits>

int main() {
    // Demonstrating integer overflow with short int
    short smallInt = 32767;  // Maximum value for short
    std::cout << "Original Value: " << smallInt << std::endl;

    // Overflow occurs when incrementing beyond maximum
    smallInt++;
    std::cout << "After Overflow: " << smallInt << std::endl;

    // Using unsigned integers to prevent negative overflow
    unsigned int positiveOnly = 0;
    std::cout << "Unsigned Integer Start: " << positiveOnly << std::endl;

    // Decrementing unsigned integer causes wrap-around
    positiveOnly--;
    std::cout << "Unsigned Integer Wrap-around: " << positiveOnly << std::endl;

    // Checking integer limits
    std::cout << "\nInteger Type Limits:" << std::endl;
    std::cout << "Short Max: " << std::numeric_limits<short>::max() << std::endl;
    std::cout << "Short Min: " << std::numeric_limits<short>::min() << std::endl;

    // Safe increment method
    try {
        if (smallInt < std::numeric_limits<short>::max()) {
            smallInt++;
            std::cout << "Safe Increment: " << smallInt << std::endl;
        } else {
            std::cout << "Cannot increment further" << std::endl;
        }
    } catch (const std::overflow_error& e) {
        std::cout << "Overflow Error: " << e.what() << std::endl;
    }

    return 0;
}