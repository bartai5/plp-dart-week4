import 'dart:io';

// Interface
abstract class Flyable {
  void fly();
}

// Base class
class Animal {
  void makeSound() {
    print('Animal makes a sound');
  }
}

// Subclass inheriting from Animal and implementing Flyable interface
class Bird extends Animal implements Flyable {
  @override
  void makeSound() {
    print('Bird chirps');
  }

  @override
  void fly() {
    print('Bird is flying high');
  }
}

void main() {
  // Initializing instance with data from file
  var bird = readBirdDataFromFile('data.txt');

  // Demonstrate method overriding
  bird.makeSound(); // Output: Bird chirps

  // Demonstrate method implementation from interface
  bird.fly(); // Output: Bird is flying high

  // Demonstrate loop
  flyHigh(bird); // Output: Bird is flying high (5 times)
}

Bird readBirdDataFromFile(String filename) {
  // Sample data in file: "Parrot, green"
  var file = File(filename);
  var lines = file.readAsLinesSync();

  if (lines.isNotEmpty) {
    var parts = lines[0].split(', ');
    var bird = Bird();
    // Initialize bird properties from file data
    // Assuming first part is bird type and second part is color
    print('Initialized bird: ${parts[0]}, ${parts[1]}');
    return bird;
  } else {
    throw Exception('No data found in file');
  }
}

void flyHigh(Bird bird) {
  for (var i = 0; i < 5; i++) {
    bird.fly();
  }
}
