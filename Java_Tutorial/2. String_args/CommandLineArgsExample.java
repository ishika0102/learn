public class CommandLineArgsExample {
        public static void main(String[] args) {
                // Loop through and print each command-line argument
                for (int i = 0; i < args.length; i++) {
                        System.out.println("Argument " + i + ": " + args[i]);
                }
        }
}
