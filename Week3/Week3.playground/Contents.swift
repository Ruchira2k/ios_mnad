import UIKit

var greeting = "Hello, playground"

let number = 1
switch (number) {
case 0:
    print("zero")
case 1:
    print("one")
default:
    print("Outside range")
}

let stringAnimal = "Dog"
switch (stringAnimal) {
case "Cat", "Dog":
    print("Animal is a house pet.")
default:
    print("Animal is not a house pet.")
}

let hourOfDay = 12
let timeOfDay: String
switch (hourOfDay) {
case 0...5:
    timeOfDay = "Early morning"
case 6, 7, 8, 9, 10, 11:
    timeOfDay = "Morning"
case 12...16:
    timeOfDay = "Afternoon"
case 17, 18, 19:
    timeOfDay = "Evening"
case 20...23:
    timeOfDay = "Late evening"
default:
    timeOfDay = "INVALID HOUR!"
}
print(timeOfDay)

var coordinatesNew: (x: Int, y: Int, z: Int) = (3, 2, 0)
switch (coordinatesNew) {
case (0, 0, 0): // 1
    print("Origin")
case (0, _, _): // 2
    print("On the x-axis.")
case (_, 0, _): // 3
    print("On the y-axis.")
case (_, _, 0): // 4
    print("On the z-axis.")
default: // 5
    print("Somewhere in space")
}

let coordinates: (x: Int, y: Int, z: Int) = (3, 9, 5)
switch (coordinates) {
case (let x, let y, _) where y == x:
    print("Along the y = x line.")
case (let x, let y, _) where y == x * x:
    print("Along the y = x^2 line.")
default:
break
}

for index in 0..<5 {
    print("hello")
}

for _ in 0..<5 {
    print("hello")
}

var sum = 0

for _ in 0..<5 {
    sum = sum + 1
}

print(sum)

//while (sum<10) {
//    if (sum == 5) {
//        continue
//    }
//
//    sum = sum + 1
//
//    if (sum == 8) {
//        break
//    }
//}

print(sum)

func printName(name: String){
    print(name)
}

printName(name: "John")

func printMiddlename(mName name: String){
    print(name)
}

printMiddlename(mName: "Franklin")

func printSurname(_ name:String) {
    print(name)
}

print("Cena")

func getUser(name: String, age: Int){
    print("\(name) is \(age) years old")
}

getUser(name: "Frank", age: 12)

func getPerson(name: String, age: Int) -> String {
    return "My name is \(name) and I'm \(age) years old"
}

var getPersonFunction: (String, Int) -> String = getPerson

let newPerson = getPersonFunction("Harry", 5)

let string1 = getPerson(name: "Swift", age: 14)
print(string1)

var num2 = 10

func updateValue(num: Int) -> Int { // Values passed through functions are always constants.
    let temp = num + 1
    return temp
}

func updateValue2(num: inout Int) { // Inout keyword makes parameter mutable.
    num += 1
}

num2 = updateValue(num: num2)
updateValue2(num: &num2)

func add(a: Int, b: Int) -> Int {
    return a + b
}

var addFunction: (Int, Int) -> Int = add

let result = addFunction(2, 4)

func printResult(function: (Int, Int) -> Int, a: Int, b: Int) {
    let result = function(a, b)
    
    print(result)
}

printResult(function: add, a: 4, b: 5)


class PersonClass { // Classes require the init function.
    var name: String
    var age: Int = 21
    
    init(name: String) {
        self.name = name
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func getPerson() {
        print("my name is \(name), my age is \(age)")
    }
}

extension PersonClass {
    func extensionFunction() {
        print("hello from extensionFunction")
    }
}

// Apple recommends usign struct over classes

struct PersonStruct { // Structs don't require an init function.
    var name: String
    var age: Int
}

var class1 = PersonClass(name: "swift")
class1.name
class1.age
class1.getPerson()
class1.extensionFunction()

var struct1 = PersonStruct(name: "swift struct", age: 22)
struct1.name
struct1.age

var class2 = class1
class2.name = "class2 name"
class2.getPerson()

class1.name
class1.age

class2.name
class2.age

var struct2 = struct1
struct2.name = "struct 2 name"

struct1.name

struct2.name

// Inheritance in swift
class Student: PersonClass {
    
}


