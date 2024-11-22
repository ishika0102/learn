package InterfaceInJava;

// Define the first interface
interface Animal {
        void eat();

        void sleep();
}

// Define the second interface
interface Swimmer {
        void swim();
}

// Define the third interface
interface Flyer {
        void fly();
}

// Concrete class implementing multiple interfaces
public class Duck implements Animal, Swimmer, Flyer {

        // Implementing methods from Animal interface
        @Override
        public void eat() {
                System.out.println("Duck eats insects and plants.");
        }

        @Override
        public void sleep() {
                System.out.println("Duck sleeps at night.");
        }

        // Implementing method from Swimmer interface
        @Override
        public void swim() {
                System.out.println("Duck swims in water.");
        }

        // Implementing method from Flyer interface
        @Override
        public void fly() {
                System.out.println("Duck flies in the sky.");
        }

        // Main method to test the implementation
        public static void main(String[] args) {
                Duck myDuck = new Duck();

                myDuck.eat(); // Output: Duck eats insects and plants.
                myDuck.sleep(); // Output: Duck sleeps at night.
                myDuck.swim(); // Output: Duck swims in water.
                myDuck.fly(); // Output: Duck flies in the sky.
        }
}
