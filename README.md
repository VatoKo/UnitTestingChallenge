# Unit Testing Challenge

Welcome to the Swift Unit Testing Challenge! This project is designed to help you sharpen your skills in writing unit tests by providing you with pre-implemented logic that needs thorough testing. The provided logic is crafted to be as familiar as possible to the challengers, making it easier to focus on writing effective unit tests. 

    Your goal is to write unit tests to achieve 100% line coverage.


## Table of Contents

1. [Introduction](#introduction)
2. [Project Structure](#project-structure)
3. [Getting Started](#getting-started)
4. [Instructions](#instructions)
5. [Additional Challenges](#additional-challenges)
    - [Async Code](#additional-challenges)
    - [ATMs](#atms)
6. [Tips for Writing Unit Tests](#tips-for-writing-unit-tests)
7. [Submitting Your Solution](#submitting-your-solution)

## Introduction

In this challenge, you'll be provided with a iOS Xcode project containing various functions and classes. Your task is to write tests that ensure every line of code is tested and covered. This is a great opportunity to practice and enhance your understanding of Swift's testing framework.

## Project Structure

The project has the following structure:

```
UnitTestingChallenge/
├── UnitTestingDemo/
│   ├── Pre-Implemented-Logic.swift
│   └── ...
├── UnitTestingDemoTests/
│   ├── BOWTests.swift
│   └── ...
├── README.md
└── ...
```

- **UnitTestingDemo/**: This directory contains the Swift files with the logic you need to test.
- **UnitTestingDemoTests/**: This directory is where you will write your unit tests.

## Getting Started

To get started with the project, follow these steps:

1. **Clone the repository:**
    ```bash
    git clone https://github.com/VatoKo/UnitTestingChallenge.git
    ```

2. **Navigate to cloned repository**:
    ```bash
    cd UnitTestingChallenge
    ```

2. **Open the project in Xcode:**
    ```bash
    xed .
    ```

3. **Explore the provided code:**
    - Navigate to the `UnitTestingDemo` directory and familiarize yourself with the implemented logic.


## Instructions

1. **Write Unit Tests:**
    - Open the `UnitTestingDemoTests` directory.
    - Create or update test files to cover the logic in the `UnitTestingDemo` directory.
    - Aim for 100% line coverage. You can check the coverage by enabling the code coverage feature in Xcode.

2. **Run Tests:**
    - Run your tests frequently to ensure they pass and cover all code.
    - Use the Xcode test navigator or command line to run the tests.

3. **Check Coverage:**
    - Enable code coverage in Xcode. [How to?](https://stackoverflow.com/a/76775661)
    - After running the tests, check the coverage report to see which lines are not covered.

## Additional Challenges

1. **Handle Asynchronous Code Execution:**
    - Identify any issues there might be while executing code asynchronously in the pre-implemented logic.
    - Write unit tests to check for issues related to asynchronous execution.
    - Make relevant changes in the logic to fix those issues, ensuring the code remains robust and reliable.

2. **Add a New Feature:** [ATMs](#atms)
    - Implement the pre-designed feature provided in the project documentation. [See below](#atms)
    - Write unit tests to cover the new feature.

## Tips for Writing Unit Tests

- **Test all code paths:** Ensure you cover different scenarios, including edge cases.
- **Use XCTAssert:** Utilize various XCTAssert functions to verify expected outcomes.
- **Mock dependencies:** If your code has dependencies, use mocks or stubs to isolate the unit being tested.

## Submitting Your Solution

1. Ensure all tests pass and you have achieved 100% line coverage.
2. Create a new branch (checkout from `master`) and name it after your team name. This will be your team's master branch:

    ```bash
    git checkout -b avengers-master
    ```

3. Commit your changes:

    ```bash
    git add .
    git commit -m "Test: Add comprehensive unit tests for 100% coverage"
    ```

4. Push your changes to the repository:

    ```bash
    git push origin avengers-master
    ```

## ATMs

Add cash withdrawal feature to a bank. A bank should be able to provide the nearest ATM for some location. An ATM on the other hand should handle cash withdrawal logics.

Possible interfaces could look something like this:

```swift
protocol Bank {
    func nearestATM(for location: Location) -> ATM
}
```

```swift
protocol ATM {
    func withdraw(amount: Double, from account: Account) throws
}
```

Make any necessary and relevant changes in the provided code to accomodate the need of cash withdrawal. Design your object structures wisely and, of course, do not forget to unit test your code.