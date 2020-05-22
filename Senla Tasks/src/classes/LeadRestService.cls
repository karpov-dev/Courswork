/**
 * Created by passa on 20.05.2020.
 */

@RestResource(UrlMapping='/Leads/*')
global with sharing class LeadRestService {

    @HttpGet
    global static Lead getLeadById(){
        String leadId = RestContext.request.params.get('id');
        return LeadManager.getLeadById(leadId);
    }

    @HttpPost
    global static Task createLeadTaskById(Id leadId){
        Task newTask = new Task();
        if(String.isBlank(leadId)) return newTask;

        newTask.WhoId = leadId;
        insert newTask;
        return newTask;
    }
}