import 'dart:async';

Future<void> main() async {
  // Create a student object containing the student's details and grades.
  try {
    final Student student = Student(
      name: 'Bhea',
      age: 21,
      scores: [98, 96, 97],
    );

    // Display the student's profile using an instance method.
    student.displayProfile();

    // Calculate the student's average grade.
    final double average = calculateAverage(student.scores);

    print('\n--- Grade Results ---');
    print('Average Grade: ${average.toStringAsFixed(2)}');

    // Determine the student's performance using conditional statements.
    print('Status: ${getGradeStatus(average)}');

    // Display each grade using a loop.
    print('\n--- Individual Grades ---');
    for (int i = 0; i < student.scores.length; i++) {
      print('Subject ${i + 1}: ${student.scores[i]}');
    }

    // Wait for the asynchronous function to return a message.
    final String message = await getStudyMessage(student.name);
    print('\n$message');
  } catch (error) {
    // Display an error message if something goes wrong.
    print('An error occurred: $error');
  }
}

// This class stores the student's personal information and grades.
class Student {
  final String name;
  final int age;
  final List<int> scores;

  // Initialize the student and validate the provided information.
  Student({
    required this.name,
    required this.age,
    required this.scores,
  }) {
    if (name.trim().isEmpty) {
      throw ArgumentError('Student name cannot be empty.');
    }

    if (age <= 0) {
      throw ArgumentError('Age must be greater than zero.');
    }

    if (scores.isEmpty) {
      throw ArgumentError('At least one grade is required.');
    }

    if (scores.any((score) => score < 0 || score > 100)) {
      throw ArgumentError('Grades must be between 0 and 100.');
    }
  }

  // Display the student's personal information.
  void displayProfile() {
    print('=== Student Profile ===');
    print('Name: $name');
    print('Age: $age');
  }
}

// Calculate and return the average of all grades.
double calculateAverage(List<int> scores) {
  if (scores.isEmpty) {
    throw ArgumentError('Cannot calculate an average without grades.');
  }

  int total = 0;

  // Add every grade to the total.
  for (final int score in scores) {
    total += score;
  }

  // Return the total divided by the number of grades.
  return total / scores.length;
}

// Classify the student's performance using conditional statements.
String getGradeStatus(double average) {
  if (average >= 90) {
    return 'Passed with Excellent Performance';
  } else if (average >= 75) {
    return 'Passed';
  } else {
    return 'Failed';
  }
}

// Simulate an asynchronous operation that returns a study message.
Future<String> getStudyMessage(String name) async {
  await Future.delayed(const Duration(milliseconds: 300));
  return 'Keep practicing, $name!';
}
