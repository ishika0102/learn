package DataTypes;

public class DataTypeSize {
        public static void main(String[] args) {
                System.out.println("Size of byte: " + Byte.BYTES + " byte");
                System.out.println("Size of short: " + Short.BYTES + " bytes");
                System.out.println("Size of int: " + Integer.BYTES + " bytes");
                System.out.println("Size of long: " + Long.BYTES + " bytes");
                System.out.println("Size of float: " + Float.BYTES + " bytes");
                System.out.println("Size of double: " + Double.BYTES + " bytes");
                System.out.println("Size of char: " + Character.BYTES + " bytes");

                // Boolean does not have a defined size method, so we cannot directly print its
                // size.
                System.out.println("Size of boolean: depends on JVM implementation");
        }
}
