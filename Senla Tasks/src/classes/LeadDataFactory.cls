@IsTest
public class LeadDataFactory {
    public static Lead getLeadByName(String firstName, String lastName){
        return new Lead(FirstName = firstName, LastName = lastName, Phone = '123456789', Email='test@test.com', Company='Test Company');
    }
}