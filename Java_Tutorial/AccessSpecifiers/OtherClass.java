package AccessSpecifiers;

import AccessSpecifiers.example.AccessSpecifierExample;

public class OtherClass extends AccessSpecifierExample {
        public void testAccess() {
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
                // example.protectedMethod(); // Not accessible
                // example.defaultMethod(); // Not accessible
                // example.privateMethod(); // Not accessible
        }
}
