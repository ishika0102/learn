package Constructor;

class User {
        String name;
        int age;

        // Default constructor
        User() {
                this.name = "Unknown";
                this.age = 0;
        }

        // Parameterized constructor
        User(String name, int age) {
                this.name = name;
                this.age = age;
        }

        // Copy constructor
        User(User other) {
                this.name = other.name;
                this.age = other.age;
        }

        void display() {
                System.out.println("Name: " + name + ", Age: " + age);
        }
}

public class ConstructorTypes {
        public static void main(String[] args) {
                // Using default constructor
                User p1 = new User();
                p1.display(); // Output: Name: Unknown, Age: 0

                // Using parameterized constructor
                User p2 = new User("John", 25);
                p2.display(); // Output: Name: John, Age: 25

                // Using copy constructor
                User p3 = new User(p2);
                p3.display(); // Output: Name: John, Age: 25
        }
}
