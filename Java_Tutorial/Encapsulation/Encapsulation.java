package Encapsulation;

class BankAccountWithEncapsulation {
        // Private fields
        private String accountNumber;
        private double balance;
        private String accountHolderName;

        // Constructor
        public BankAccountWithEncapsulation(String accountNumber, String accountHolderName) {
                this.accountNumber = accountNumber;
                this.accountHolderName = accountHolderName;
                this.balance = 0.0;
        }

        // Public getter for account number
        public String getAccountNumber() {
                return accountNumber;
        }

        // Public getter for account holder name
        public String getAccountHolderName() {
                return accountHolderName;
        }

        // Public method to deposit money
        public void deposit(double amount) {
                if (amount > 0) {
                        balance += amount;
                        System.out.println(amount + " deposited. New balance: " + balance);
                } else {
                        System.out.println("Invalid deposit amount.");
                }
        }

        // Public method to withdraw money
        public void withdraw(double amount) {
                if (amount > 0 && amount <= balance) {
                        balance -= amount;
                        System.out.println(amount + " withdrawn. New balance: " + balance);
                } else {
                        System.out.println("Invalid or insufficient funds for withdrawal.");
                }
        }

        // Public getter for balance
        public double getBalance() {
                return balance;
        }

        // Public setter for account holder name with validation
        public void setAccountHolderName(String accountHolderName) {
                if (accountHolderName != null && !accountHolderName.isEmpty()) {
                        this.accountHolderName = accountHolderName;
                } else {
                        System.out.println("Invalid account holder name.");
                }
        }
}

public class Encapsulation {
        public static void main(String[] args) {
                // Creating a bank account object
                BankAccountWithEncapsulation account = new BankAccountWithEncapsulation("123456789", "John Doe");

                // Displaying account details
                System.out.println("Account Number: " + account.getAccountNumber());
                System.out.println("Account Holder: " + account.getAccountHolderName());

                // Performing transactions
                account.deposit(500);
                account.withdraw(100);
                account.withdraw(500);

                // Displaying the balance
                System.out.println("Final Balance: " + account.getBalance());

                // Attempting to set an invalid account holder name
                account.setAccountHolderName("");
                System.out.println("Account Holder (after invalid attempt): " + account.getAccountHolderName());

                // Setting a valid account holder name
                account.setAccountHolderName("Jane Doe");
                System.out.println("Account Holder (after valid attempt): " + account.getAccountHolderName());
        }
}
