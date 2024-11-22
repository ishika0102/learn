package Constructor;

class Person {
        private String name;
        private int age;

        // Constructor with parameters
        public Person(String name, int age) {
                // Shadowing problem: Local variables 'name' and 'age' shadow the class fields
                name = name;
                age = age;
        }

        // Method to display the person's details
        public void display() {
                System.out.println("Name: " + name + ", Age: " + age);
        }
}

public class ConstructorSP {
        public static void main(String[] args) {
                // Creating a Person object
                Person person = new Person("Alice", 30);

                // Displaying the person's details
                person.display(); // Output will be "Name: null, Age: 0" due to shadowing problem
        }
}
