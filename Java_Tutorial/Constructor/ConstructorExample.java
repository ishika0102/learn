package Constructor;

class PersonExample {
        private String name;
        private int age;

        // Constructor with parameters
        public PersonExample(String name, int age) {
                // Using 'this' keyword to refer to the class fields
                this.name = name;
                this.age = age;
        }

        // Method to display the person's details
        public void display() {
                System.out.println("Name: " + name + ", Age: " + age);
        }
}

public class ConstructorExample {
        public static void main(String[] args) {
                // Creating a Person object
                PersonExample person = new PersonExample("Alice", 30);

                // Displaying the person's details
                person.display(); // Output will be "Name: Alice, Age: 30"
        }
}
