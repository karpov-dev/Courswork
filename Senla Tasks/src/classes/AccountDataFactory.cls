@IsTest
public class AccountDataFactory {

    public static Account getAccount(){
        return new Account(Name = 'Test', Phone = '+1234567890');
    }

    public static Account getAccountByName(String name){
        return new Account(Name = name, Phone = '+1234567890');
    }
    
}