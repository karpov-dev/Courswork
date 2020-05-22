@IsTest
public with sharing class LeadManager_Test {

    @IsTest static void getLeadById_NormalData(){
        Lead lead = LeadDataFactory.getLeadByName('Test', 'Lead');
        insert lead;

        Test.startTest();
        Lead result = LeadManager.getLeadById(lead.Id);
        Test.stopTest();

        System.assertNotEquals(null, result);
        System.assertEquals(lead.Id, result.Id);
    }

    @IsTest static void getLeadById_NullData(){
        Test.startTest();
        Lead result = LeadManager.getLeadById(null);
        Test.stopTest();

        System.assertNotEquals(null, result);
        System.assertEquals(result.Id, null);
    }

    @IsTest static void getLeadById_EmptyIdData(){
        Lead lead = LeadDataFactory.getLeadByName('Test', 'Lead');

        Test.startTest();
        Lead result = LeadManager.getLeadById(lead.Id);
        Test.stopTest();

        System.assertNotEquals(null, result);
        System.assertEquals(result.Id, null);
    }

}