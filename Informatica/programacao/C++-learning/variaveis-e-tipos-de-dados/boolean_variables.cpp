#include <iostream>

int main() {
    // Declaring boolean variables
    bool isStudent = true;
    bool hasPassedExam = false;

    // Printing boolean values
    std::cout << "Is Student: " << std::boolalpha << isStudent << std::endl;
    std::cout << "Passed Exam: " << hasPassedExam << std::endl;

    // Comparison operations that result in boolean values
    int age = 20;
    bool isAdult = (age >= 18);
    std::cout << "Is Adult: " << isAdult << std::endl;

    // Logical operations
    bool hasScholarship = true;
    bool canEnroll = isStudent && isAdult;
    std::cout << "Can Enroll: " << canEnroll << std::endl;

    // Negation
    bool isUnemployed = !hasPassedExam;
    std::cout << "Is Unemployed: " << isUnemployed << std::endl;

    // Conditional statement using boolean
    if (isStudent && hasPassedExam) {
        std::cout << "Congratulations! You can proceed to the next level." << std::endl;
    } else {
        std::cout << "You need to improve your academic performance." << std::endl;
    }

    return 0;
}