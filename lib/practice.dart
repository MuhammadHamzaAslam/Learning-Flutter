import 'dart:io';

void main() {
  print("Hello World!");
  var myClass = operatorPractice();
  stdout.writeln('Enter First Number:');
  int num1 = int.parse(stdin.readLineSync()!);
  stdout.writeln('Enter Second Number:');
  int num2 = int.parse(stdin.readLineSync()!);

  stdout.writeln(
    'Enter the operation (addition,subtraction,Multiply,Divide,Modulus) :',
  );
  String operation = stdin.readLineSync()!;
  var Result = myClass.performOperation(operation, num1, num2);
  print('Result: $Result');
}

class operatorPractice {
  dynamic performOperation(String operation, int num1, int num2) {
    operation = operation.toLowerCase();
    if (operation == 'plus' || operation == 'addition') {
      int sum = num1 + num2;
      return sum;
    } else if (operation == 'subtract' || operation == 'minus') {
      int sum = num1 - num2;
      return sum;
    } else if (operation == 'multiply' || operation == 'multiplication') {
      int sum = num1 * num2;
      return sum;
    } else if (operation == 'modulus') {
      int sum = num1 % num2;
      return sum;
    } else if (operation == 'divide') {
      int sum = num1 ~/ num2;
      return sum;
    }
    return 'Error! Operation dosenot exist';
  }
}
