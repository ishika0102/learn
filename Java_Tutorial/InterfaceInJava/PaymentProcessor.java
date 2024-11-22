// package InterfaceInJava;

// // Define an interface for PaymentMethod
// interface PaymentMethod {
// void processPayment();
// }

// // Define a CreditCard class implementing PaymentMethod
// class CreditCard implements PaymentMethod {
// @Override
// public void processPayment() {
// System.out.println("Charging credit card...");
// }
// }

// // Define a PayPal class implementing PaymentMethod
// class PayPal implements PaymentMethod {
// @Override
// public void processPayment() {
// System.out.println("Sending money via PayPal...");
// }
// }

// // Define a PaymentProcessor class that can handle any PaymentMethod
// public class PaymentProcessor {
// public void process(PaymentMethod paymentMethod) {
// paymentMethod.processPayment();
// }

// public static void main(String[] args) {
// PaymentProcessor processor = new PaymentProcessor();

// PaymentMethod creditCard = new CreditCard();
// PaymentMethod payPal = new PayPal();

// processor.process(creditCard); // Output: Charging credit card...
// processor.process(payPal); // Output: Sending money via PayPal...
// }
// }
