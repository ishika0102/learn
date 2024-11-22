package Encapsulation;

class BankAccountWithoutEncapsulation {
        // Public fields
        public String accountNumber;
        public double balance;
        public String accountHolderName;
}

public class WithoutEncapsulation {
        public static void main(String[] args) {
                // Creating a bank account object
                BankAccountWithoutEncapsulation account = new BankAccountWithoutEncapsulation();
                account.accountNumber = "123456789";
                account.accountHolderName = "John Doe";
                account.balance = 500.0;

                // Directly accessing and modifying the fields
                System.out.println("Account Number: " + account.accountNumber);
                System.out.println("Account Holder: " + account.accountHolderName);
                System.out.println("Balance: " + account.balance);

                // Directly modifying the balance (no validation)
                account.balance = -1000.0; // Invalid operation
                System.out.println("Updated Balance: " + account.balance); // This should not be allowed

                // Directly changing account holder name to an empty string (no validation)
                account.accountHolderName = "";
                System.out.println("Updated Account Holder: " + account.accountHolderName); // This should not be
                                                                                            // allowed
        }
}
