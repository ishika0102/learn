package AccessSpecifiers.example;

public class AccessSpecifierExample {
        // Fields with different access specifiers
        public String publicField = "Public Field";
        protected String protectedField = "Protected Field";
        String defaultField = "Default Field"; // default (package-private) access
        private String privateField = "Private Field";

        // Methods with different access specifiers
        public void publicMethod() {
                System.out.println("Public Method");
        }

        protected void protectedMethod() {
                System.out.println("Protected Method");
        }

        void defaultMethod() {
                System.out.println("Default Method");
        }

        private void privateMethod() {
                System.out.println("Private Method");
        }

        public String usePrivateMethod() {
                privateMethod();
                return privateField;
        }

}
