@IsTest
public with sharing class TaskManager_Test {

    @IsTest static void getTasksByWhoId_NormalData(){
        Lead lead = LeadDataFactory.getLeadByName('Test', 'Lead');
        insert lead;
        Task task = TaskDataFactory.getTaskWithWhoId(lead.Id);
        insert task;

        Test.startTest();
        List<Task> result = TaskManager.getTasksByWhoId(lead.Id);
        Test.stopTest();

        System.assert(result != null);
        System.assertEquals(1, result.size());
        System.assertEquals(lead.Id, result[0].WhoId);
    }

    @IsTest static void getTasksByWhoId_LeadWithoutTasks(){
        Lead lead = LeadDataFactory.getLeadByName('Test', 'Lead');
        insert lead;

        Test.startTest();
        List<Task> result = TaskManager.getTasksByWhoId(lead.Id);
        Test.stopTest();

        System.assert(result != null);
        System.assertEquals(0, result.size());
    }

    @IsTest static void getTasksByWhoId_EmptyLeadId(){
        Lead lead = LeadDataFactory.getLeadByName('Test', 'Lead');

        Test.startTest();
        List<Task> result = TaskManager.getTasksByWhoId(lead.Id);
        Test.stopTest();

        System.assert(result != null);
        System.assertEquals(0, result.size());
    }

    @IsTest static void getTasksByWhoId_NullId(){
        Test.startTest();
        List<Task> result = TaskManager.getTasksByWhoId(null);
        Test.stopTest();

        System.assert(result != null);
        System.assertEquals(0, result.size());
    }

}