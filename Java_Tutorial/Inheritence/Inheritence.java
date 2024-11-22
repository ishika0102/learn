package Inheritence;

// Superclass (Parent class)
class Animal {
        // Private member (not accessible by subclasses)
        private String name;
        // Protected member (accessible by subclasses)
        protected int age;

        // Default constructor
        Animal() {
                System.out.println("Animal Constructor");
        }

        // Parameterized constructor
        Animal(String name, int age) {
                this.name = name;
                this.age = age;
                System.out.println("Animal Constructor with parameters");
        }

        // Public method
        public void eat() {
                System.out.println("Animal eats");
        }

        // Protected method
        protected void sleep() {
                System.out.println("Animal sleeps");
        }

        // Final method (cannot be overridden)
        public final void breathe() {
                System.out.println("Animal breathes");
        }

        // Private method (not accessible by subclasses)
        private void makeSound() {
                System.out.println("Animal makes sound");
        }
}

// Subclass (Child class)
class Dog extends Animal {
        // Constructor of subclass
        Dog() {
                // Calling superclass constructor
                super();
                System.out.println("Dog Constructor");
        }

        // Parameterized constructor of subclass
        Dog(String name, int age) {
                // Calling superclass constructor with parameters
                super(name, age);
                System.out.println("Dog Constructor with parameters");
        }

        // Overriding method from superclass
        @Override
        public void eat() {
                System.out.println("Dog eats food");
        }

        // Subclass specific method
        public void bark() {
                System.out.println("Dog barks");
        }

        // Attempting to override a final method (this will cause a compile-time error)

        // @Override
        // public void breathe() {
        // System.out.println("Dog breathes differently");
        // }

}

public class Inheritence {
        public static void main(String[] args) {
                // Creating an object of Dog class
                Dog myDog = new Dog("Buddy", 5);

                // Accessing methods
                myDog.eat(); // This will call the overridden method in Dog class
                myDog.sleep(); // This will call the method inherited from Animal class
                myDog.breathe(); // This will call the final method inherited from Animal class
                myDog.bark(); // This will call the method specific to Dog class

                // Accessing fields (age is protected and accessible, name is private and not
                // accessible)
                // System.out.println(myDog.name); // Compile-time error: name has private
                // access in Animal
                System.out.println(myDog.age); // This will print the age
        }
}
