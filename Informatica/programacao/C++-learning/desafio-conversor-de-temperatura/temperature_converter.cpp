#include <iostream>
#include <iomanip>

int main() {
    // TODO: Define constants for the conversion formula
    // Hint: Use CELSIUS_TO_FAHRENHEIT_FACTOR (9.0/5.0) and CELSIUS_TO_FAHRENHEIT_OFFSET (32.0)
    const double CELSIUS_TO_FAHRENHEIT_FACTOR = 9.0/5.0;
    const double CELSIUS_TO_FAHRENHEIT_OFFSET = 32.0;
    // Variable to store Celsius temperature
    double celsius;

    // Get user input
    std::cout << "Enter temperature in Celsius: "; // saida
    std::cin >> celsius; // entrada

    // TODO: Perform temperature conversion using the constants and static_cast
    // Hint: fahrenheit = static_cast<double>((celsius * FACTOR) + OFFSET)
    double fahrenheit = static_cast<double>((celsius * CELSIUS_TO_FAHRENHEIT_FACTOR) + CELSIUS_TO_FAHRENHEIT_OFFSET);

    // Format and display output
    std::cout << std::fixed << std::setprecision(2); // saida com precisão de 2 casas
    std::cout << celsius << " Celsius is equal to " << fahrenheit << " Fahrenheit" << std::endl;

    return 0;
}
