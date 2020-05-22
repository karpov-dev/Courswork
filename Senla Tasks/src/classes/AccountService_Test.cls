@IsTest
private class AccountService_Test {

    @IsTest static void SetTimeTaskFourField_NormalData() {
        List<Account> accountsToTest = new List<Account>();
        for(Integer i = 0; i < 10; i++){
            accountsToTest.add(AccountDataFactory.getAccountByName('Account number ' + i));
        }
        insert accountsToTest;

        Test.startTest();
        AccountService.SetTimeTaskFourField(accountsToTest);
        Test.stopTest();


        List<Id> accountIds = new List<Id>();
        for(Account account : accountsToTest){
            accountIds.add(account.Id);
        }

        List<Account> updatedAccounts = [SELECT Task_Four_Date_Time__c
                                         FROM Account
                                         WHERE Id IN :accountIds];

        Datetime currentDate = Datetime.now();
        for(Account account : updatedAccounts){
            System.assert(updatedAccounts != null);
            System.assertEquals(true, account.Task_Four_Date_Time__c != null);
            System.assertEquals(currentDate.time().hour(), account.Task_Four_Date_Time__c.hour());
        }
    }

}