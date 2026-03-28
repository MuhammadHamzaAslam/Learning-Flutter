import 'dart:io';

void main() {
  var practice = LoopPractice();

  // Table Generator
  practice.generateTable();

  // Fruit name filter (name contain a letters)
  practice.fruitFilter();
}

class LoopPractice {
  void generateTable() {
    print(' ---- Table Generator ----- ');
    stdout.writeln('Enter the table number:');
    int number = int.parse(stdin.readLineSync()!);
    stdout.writeln('Enter the limit:');
    int limit = int.parse(stdin.readLineSync()!);
    for (var i = 1; i <= limit; i++) {
      print('$number x $i = ${number * i}');
    }
  }

  void fruitFilter() {
    var fruitNames = [
      'Apple',
      'Mango',
      'Berry',
      'Kiwi',
      'Banana',
      'Fig',
      'Orange',
    ];
    for (var fruit in fruitNames) {
      if (fruit.toLowerCase().contains('a')) {
        print('Names of fruit containing letter a: $fruit');
      }
    }
  }
}

//    ************************ Object Oriented Programming *************************

// void main() {
//   print("Hello World!");
//   var myClass = operatorPractice();
//   stdout.writeln('Enter First Number:');
//   int num1 = int.parse(stdin.readLineSync()!);
//   stdout.writeln('Enter Second Number:');
//   int num2 = int.parse(stdin.readLineSync()!);

//   stdout.writeln(
//     'Enter the operation (addition,subtraction,Multiply,Divide,Modulus) :',
//   );
//   String operation = stdin.readLineSync()!;
//   var Result = myClass.performOperation(operation, num1, num2);
//   print('Result: $Result');
// }

// class operatorPractice {
//   dynamic performOperation(String operation, int num1, int num2) {
//     operation = operation.toLowerCase();
//     if (operation == 'plus' || operation == 'addition') {
//       int sum = num1 + num2;
//       return sum;
//     } else if (operation == 'subtract' || operation == 'minus') {
//       int sum = num1 - num2;
//       return sum;
//     } else if (operation == 'multiply' || operation == 'multiplication') {
//       int sum = num1 * num2;
//       return sum;
//     } else if (operation == 'modulus') {
//       int sum = num1 % num2;
//       return sum;
//     } else if (operation == 'divide') {
//       int sum = num1 ~/ num2;
//       return sum;
//     }
//     return 'Error! Operation dosenot exist';
//   }
// }
