package DataTypes;

public class DataTypesExample {

        public static void main(String[] args) {
                // 1. Primitive Data Types

                // Integer Types
                byte byteVar = 100; // 8-bit signed integer
                System.out.println("Byte Value: " + byteVar + " (Range: " + Byte.MIN_VALUE + " to " + Byte.MAX_VALUE
                                + ")");

                short shortVar = 10000; // 16-bit signed integer
                System.out.println("Short Value: " + shortVar + " (Range: " + Short.MIN_VALUE + " to " + Short.MAX_VALUE
                                + ")");

                int intVar = 100000; // 32-bit signed integer
                System.out.println("Int Value: " + intVar + " (Range: " + Integer.MIN_VALUE + " to " + Integer.MAX_VALUE
                                + ")");

                long longVar = 100000L; // 64-bit signed integer
                System.out.println("Long Value: " + longVar + " (Range: " + Long.MIN_VALUE + " to " + Long.MAX_VALUE
                                + ")");

                // Floating-Point Types
                float floatVar = 10.5f; // 32-bit floating-point
                System.out.println("Float Value: " + floatVar + " (Range: " + Float.MIN_VALUE + " to " + Float.MAX_VALUE
                                + ")");

                double doubleVar = 10.5; // 64-bit floating-point
                System.out.println("Double Value: " + doubleVar + " (Range: " + Double.MIN_VALUE + " to "
                                + Double.MAX_VALUE + ")");

                // Character Type
                char charVar = 'A'; // 16-bit Unicode character
                System.out.println("Char Value: " + charVar + " (Range: " + Character.MIN_VALUE + " to "
                                + Character.MAX_VALUE + ")");

                // Boolean Type
                boolean boolVar = true; // 1-bit value (true or false)
                System.out.println("Boolean Value: " + boolVar);

                // 2. Non-Primitive Data Types

                // String Type
                String stringVar = "Hello, World!";
                System.out.println("String Value: " + stringVar);

                // Array Type
                int[] arrayVar = { 1, 2, 3, 4, 5 };
                System.out.print("Array Values: ");
                for (int i : arrayVar) {
                        System.out.print(i + " ");
                }
                System.out.println();

                // 3. Wrapper Classes (For each primitive type)
                Byte byteWrapper = 10;
                System.out.println("Byte Wrapper Value: " + byteWrapper);

                Short shortWrapper = 100;
                System.out.println("Short Wrapper Value: " + shortWrapper);

                Integer intWrapper = 1000;
                System.out.println("Integer Wrapper Value: " + intWrapper);

                Long longWrapper = 10000L;
                System.out.println("Long Wrapper Value: " + longWrapper);

                Float floatWrapper = 10.5f;
                System.out.println("Float Wrapper Value: " + floatWrapper);

                Double doubleWrapper = 20.5;
                System.out.println("Double Wrapper Value: " + doubleWrapper);

                Character charWrapper = 'B';
                System.out.println("Character Wrapper Value: " + charWrapper);

                Boolean booleanWrapper = false;
                System.out.println("Boolean Wrapper Value: " + booleanWrapper);
        }
}
