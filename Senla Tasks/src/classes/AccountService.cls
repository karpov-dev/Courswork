public with sharing class AccountService {

    @InvocableMethod
    public static void SetTimeTaskFourField(List<Account> accounts){
        if(accounts == null) return;

        List<Account> accountsToUpdate = new List<Account>();
        for(Account account : accounts){
            Account accountToUpdate = new Account(Id =  account.Id);
            accountToUpdate.Task_Four_Date_Time__c = Datetime.now();
            accountsToUpdate.add(accountToUpdate);
        }

        update accountsToUpdate;
    }

}