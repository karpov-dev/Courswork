public with sharing class LeadManager {

    public static Lead getLeadById(Id id){
        if(String.isBlank(id)) return new Lead();

        return [SELECT Id, Name, Phone, Email
                FROM Lead
                WHERE Id = :id];
    }

}