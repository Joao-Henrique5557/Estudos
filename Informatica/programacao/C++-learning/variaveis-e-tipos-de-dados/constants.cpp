#include <iostream>

int main() {
    // Defining constants with const keyword
    const int MAX_USERS = 100;
    const double PI = 3.14159;
    const char GRADE_SEPARATOR = '-';

    // Demonstrating constant usage
    std::cout << "Maximum Users: " << MAX_USERS << std::endl;
    std::cout << "Value of PI: " << PI << std::endl;
    std::cout << "Grade Separator: " << GRADE_SEPARATOR << std::endl;

    // Naming convention: constants typically use UPPERCASE
    const int DAYS_IN_WEEK = 7;
    const std::string WELCOME_MESSAGE = "Welcome to C++ Programming!";

    std::cout << "Days in a Week: " << DAYS_IN_WEEK << std::endl;
    std::cout << "Welcome Message: " << WELCOME_MESSAGE << std::endl;

    // Attempting to modify a constant (will cause a compilation error)
    // Uncomment the next line to see the error
    // MAX_USERS = 200;  // This would cause a compile-time error

    return 0;
}