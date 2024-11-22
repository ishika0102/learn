package AccessSpecifiers.example;

import AccessSpecifiers.OtherClass;

public class Main {
        public static void main(String[] args) {
                AccessSpecifierExample example = new AccessSpecifierExample();

                // Accessing members from the same package
                System.out.println("Public member: " + example.publicField);
                System.out.println("Protected member: " + example.protectedField);
                System.out.println("Default member: " + example.defaultField);
                // System.out.println("Private member: " + example.privateField); // Not
                // accessible

                example.publicMethod();
                example.protectedMethod();
                example.defaultMethod();
                // example.privateMethod(); // Not accessible

                // Accessing members from a different package
                OtherClass otherClass = new OtherClass();
                otherClass.testAccess();
        }
}
