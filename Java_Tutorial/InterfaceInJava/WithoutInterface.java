package InterfaceInJava;

// Base class for PaymentMethod
class PaymentMethod {
        public void processPayment() {
                System.out.println("Processing payment...");
        }
}

// CreditCard class extending PaymentMethod
class CreditCard extends PaymentMethod {
        public void chargeCard() {
                System.out.println("Charging credit card...");
        }
}

// PayPal class extending PaymentMethod
class PayPal extends PaymentMethod {
        public void sendMoney() {
                System.out.println("Sending money via PayPal...");
        }
}

// Attempt to handle both types in a single class
class PaymentProcessor extends PaymentMethod {
        private CreditCard creditCard;
        private PayPal payPal;

        public void processCreditCardPayment() {
                creditCard = new CreditCard();
                creditCard.processPayment();
                creditCard.chargeCard();
        }

        public void processPayPalPayment() {
                payPal = new PayPal();
                payPal.processPayment();
                payPal.sendMoney();
        }
}

public class WithoutInterface {

}
