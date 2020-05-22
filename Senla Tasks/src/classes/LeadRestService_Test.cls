@IsTest
public class LeadRestService_Test {

    @IsTest static void getLeadById_FoundData(){
        Lead lead = LeadDataFactory.getLeadByName('Test', 'Lead');
        insert lead;

        Map<String, String> params = new Map<String, String>();
        params.put('id', lead.Id);
        RestRequest request = RequestDataFactory.getRestRequest('Leads', 'GET', params);
        RestContext.request =  request;

        Test.startTest();
        Lead result = LeadRestService.getLeadById();
        Test.stopTest();

        System.assert(result != null);
        System.assertEquals(lead.id, result.Id);
    }

    @IsTest static void getLeadById_NotFoundData(){
        Lead lead = LeadDataFactory.getLeadByName('Test', 'Lead');

        Map<String, String> params = new Map<String, String>();
        params.put('id', lead.Id);
        RestRequest request = RequestDataFactory.getRestRequest('Leads', 'GET', params);
        RestContext.request =  request;

        Test.startTest();
        Lead result = LeadRestService.getLeadById();
        Test.stopTest();

        System.assert(result != null);
        System.assertEquals(null, result.Id);
    }

    @IsTest static void createLeadTaskById_NormalData(){
        Lead lead = LeadDataFactory.getLeadByName('Test', 'Lead');
        insert lead;

        Test.startTest();
        Task result = LeadRestService.createLeadTaskById(lead.Id);
        Test.stopTest();

        List<Task> tasksInDatabase = TaskManager.getTasksByWhoId(lead.Id);

        System.assert(result != null);
        System.assertEquals(lead.Id, result.WhoId);
        System.assertEquals(1, tasksInDatabase.size());
    }

    @IsTest static void createLeadTaskById_EmptyLeadId(){
        Lead lead = LeadDataFactory.getLeadByName('Test', 'Lead');

        Test.startTest();
        Task result = LeadRestService.createLeadTaskById(lead.Id);
        Test.stopTest();

        List<Task> tasksInDatabase = TaskManager.getTasksByWhoId(lead.Id);

        System.assert(result != null);
        System.assertEquals(null, result.WhoId);
        System.assertEquals(0, tasksInDatabase.size());
    }

    @IsTest static void createLeadTaskById_NullLeadIdParam(){
        Test.startTest();
        Task result = LeadRestService.createLeadTaskById(null);
        Test.stopTest();

        System.assert(result != null);
        System.assertEquals(null, result.WhoId);
    }
}