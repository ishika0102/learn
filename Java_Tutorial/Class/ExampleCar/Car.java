package Class.ExampleCar;

import AccessSpecifiers.example.AccessSpecifierExample;

// Structure of a java program 
public class Car { // Class can only be public abstract and final
        // Has part of the structure of a class
        String name;
        String color;
        int cost;

        // Does part of the structure of a class
        void start() {
                System.out.println("Car started");
        }

        void stop() {
                System.out.println("Car stopped");
        }

        void accelerate() {
                System.out.println("Car accelerated");
        }

        void applyBrake() {
                System.out.println("Car applied brake");
        }

        // Constructor
        Car() {
                name = "Unknown";
                color = "Unknown";
                cost = 0;
        }
}

class ElectricCar extends Car {
        int batteryCapacity;

        public void charge() {
                System.out.println("Electric car is charging");
        }

}

class SportsCar extends Car {
        int maxSpeed;
        int fuelEfficiency;

        public void driveToWork() {
                System.out.println("Driving to work");
        }

}

class SUV extends Car {
        int cargoSpace;

        public void carryCargo() {
                System.out.println("Carrying cargo");
        }
}

class Access extends AccessSpecifierExample {
        AccessSpecifierExample example = new AccessSpecifierExample();

        // Accessing members from a different package
        System.out.println("Public member: " + example.publicField);
        System.out.println("Protected member: " + example.protectedField); // Not
        // accessible
        System.out.println("Default member: " + example.defaultField); // Not
        accessible
        System.out.println("Private member: " + example.privateField); // Not
        accessible

        example.publicMethod();
}