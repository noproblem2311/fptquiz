package Model;

public class Payment {
    private int paymentID;
    private int userID;
    private int isVIP; // Thay đổi kiểu dữ liệu thành int
    private String customerID;

    public Payment() {
        // Constructor mặc định
    }

    public Payment(int paymentID, int userID, int isVIP, String customerID) {
        this.paymentID = paymentID;
        this.userID = userID;
        this.isVIP = isVIP;
        this.customerID = customerID;
    }

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getIsVIP() {
        return isVIP;
    }

    public void setIsVIP(int isVIP) {
        this.isVIP = isVIP;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    @Override
    public String toString() {
        return "Payment{" +
                "paymentID=" + paymentID +
                ", userID=" + userID +
                ", isVIP=" + isVIP +
                ", customerID='" + customerID + '\'' +
                '}';
    }
}
