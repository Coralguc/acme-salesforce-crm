public class ATMlogin {
    
    Integer AvlBal = 100;
    Public integer Deposit(Integer balance)
    {
        AvlBal += balance;
        return AvlBal;   
    }
    
    Public integer Withdraw(Integer balance)
    {
        if (balance <= AvlBal)
        {
            AvlBal -= balance;
            return AvlBal;
        }
        else
            return AvlBal;
    }
}