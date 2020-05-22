@IsTest
public class ContactDataFactory  {

	public static Contact getContact(){
		return new Contact(FirstName='Factrory', LastName='Item', Phone='1234567890', Email='test@test.com');
	}

}