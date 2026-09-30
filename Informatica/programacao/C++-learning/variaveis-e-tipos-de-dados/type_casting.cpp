#include <iostream>

int main() {
    // Implicit type casting (automatic conversion)
    int intValue = 10;
    double doubleValue = intValue;  // Automatically converts int to double
    std::cout << "Implicit Conversion (int to double): " << doubleValue << std::endl;

    // Explicit type casting (manual conversion)
    double pi = 3.14159;
    int truncatedPi = (int)pi;  // C-style cast, truncates decimal part
    std::cout << "Explicit Conversion (double to int): " << truncatedPi << std::endl;

    // Static cast for type conversion
    float floatValue = 7.5f;
    int roundedValue = static_cast<int>(floatValue);
    std::cout << "Static Cast (float to int): " << roundedValue << std::endl;

    // Conversion between numeric types with potential data loss
    long largeNumber = 1000000;
    short smallNumber = static_cast<short>(largeNumber);
    std::cout << "Large to Small Type Conversion: " << smallNumber << std::endl;

    // Mixing different numeric types in calculations
    int a = 5;
    double b = 2.5;
    double result = a + b;  // Implicit conversion of int to double
    std::cout << "Mixed Type Calculation: " << result << std::endl;

    return 0;
}