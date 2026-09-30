#include <iostream>

int main() {
    // Checking memory size of integer types
    std::cout << "Integer Types Memory Size:" << std::endl;
    std::cout << "short: " << sizeof(short) << " bytes" << std::endl;
    std::cout << "int: " << sizeof(int) << " bytes" << std::endl;
    std::cout << "long: " << sizeof(long) << " bytes" << std::endl;
    std::cout << "long long: " << sizeof(long long) << " bytes" << std::endl;

    // Checking memory size of floating-point types
    std::cout << "\nFloating-Point Types Memory Size:" << std::endl;
    std::cout << "float: " << sizeof(float) << " bytes" << std::endl;
    std::cout << "double: " << sizeof(double) << " bytes" << std::endl;
    std::cout << "long double: " << sizeof(long double) << " bytes" << std::endl;

    // Checking memory size of character and boolean types
    std::cout << "\nOther Types Memory Size:" << std::endl;
    std::cout << "char: " << sizeof(char) << " bytes" << std::endl;
    std::cout << "bool: " << sizeof(bool) << " bytes" << std::endl;

    // Checking memory size of specific variables
    int intVar = 42;
    double doubleVar = 3.14;
    char charVar = 'A';

    std::cout << "\nVariable Memory Size:" << std::endl;
    std::cout << "intVar: " << sizeof(intVar) << " bytes" << std::endl;
    std::cout << "doubleVar: " << sizeof(doubleVar) << " bytes" << std::endl;
    std::cout << "charVar: " << sizeof(charVar) << " bytes" << std::endl;

    return 0;
}