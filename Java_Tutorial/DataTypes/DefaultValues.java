package DataTypes;

public class DefaultValues {
        // Primitive Data Types
        byte byteVar;
        short shortVar;
        int intVar;
        long longVar;
        float floatVar;
        double doubleVar;
        char charVar;
        boolean boolVar;

        // Non-Primitive Data Types
        String stringVar;
        int[] arrayVar;

        public static void main(String[] args) {
                DefaultValues defaults = new DefaultValues();

                System.out.println("Default Values of Primitive Data Types:");
                System.out.println("byte: " + defaults.byteVar); // Default: 0
                System.out.println("short: " + defaults.shortVar); // Default: 0
                System.out.println("int: " + defaults.intVar); // Default: 0
                System.out.println("long: " + defaults.longVar); // Default: 0L
                System.out.println("float: " + defaults.floatVar); // Default: 0.0f
                System.out.println("double: " + defaults.doubleVar); // Default: 0.0d
                System.out.println("char: '" + defaults.charVar + "' (Unicode value: " + (int) defaults.charVar + ")"); // Default:
                                                                                                                        // '\u0000'
                                                                                                                        // (null
                                                                                                                        // character)
                System.out.println("boolean: " + defaults.boolVar); // Default: false

                System.out.println("\nDefault Values of Non-Primitive Data Types:");
                System.out.println("String: " + defaults.stringVar); // Default: null
                System.out.println("Array: " + defaults.arrayVar); // Default: null

                System.out.println("Default float and double equal: " + (defaults.floatVar == defaults.doubleVar));
        }
}
