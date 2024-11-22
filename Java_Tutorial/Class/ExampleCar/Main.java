package Class.ExampleCar;

public class Main {
        public static void main(String[] args) {
                // Create an instance of the Car class
                Car myCar = new Car();

                // Perform basic operations
                myCar.name = "BMW";
                myCar.color = new String("Black");
                myCar.cost = 1000000;
                myCar.start();
                myCar.accelerate();
                myCar.applyBrake();
                myCar.stop();
                System.out.println("Car details: " + myCar.name + ", " + myCar.color + ", $" + myCar.cost);
                // Instead of setting each value seperatly in each line use constructor
                // myCar = new Car("Mercedes", "White", 1500000);
                // System.out.println("Car details: " + myCar.name + ", " + myCar.color + ", $"
                // + myCar.cost);
        }
}