@isTest
public class FeedItemService_Test  {
	
	@isTest static void cloneTextPost_NormalData(){
		Account sourceAccount = AccountDataFactory.getAccountByName('Source Account');
		Account targetAccount = AccountDataFactory.getAccountByName('Target Account');
		insert sourceAccount;
		insert targetAccount;
		FeedItem item = FeedItemDataFactory.getTextPostFeedItem(sourceAccount.Id);
		insert item;

		Test.startTest();
		List<FeedItem> clonedItems = FeedItemService.cloneTextPost(sourceAccount.Id, targetAccount.Id);
		Test.stopTest();

		System.assertEquals(1, clonedItems.size());
		System.assertEquals(targetAccount.Id, clonedItems[0].ParentId);
	}

	@IsTest static void cloneTextPost_cloneAccountToContact(){
		Account sourceAccount = AccountDataFactory.getAccountByName('Source Account');
		Contact targetContact = ContactDataFactory.getContact();
		insert sourceAccount;
		insert targetContact;
		FeedItem item = FeedItemDataFactory.getTextPostFeedItem(sourceAccount.Id);
		insert item;

		Test.startTest();
		List<FeedItem> clonedItems = FeedItemService.cloneTextPost(sourceAccount.Id, targetContact.Id);
		Test.stopTest();

		System.assertEquals(1, clonedItems.size());
	}

	@isTest static void cloneTextPost_AccountWithoutFeedItems(){
		Account sourceAccount = AccountDataFactory.getAccountByName('Source Account');
		Account targetAccount = AccountDataFactory.getAccountByName('Target Account');
		insert sourceAccount;
		insert targetAccount;

		Test.startTest();
		List<FeedItem> clonedItems = FeedItemService.cloneTextPost(sourceAccount.Id, targetAccount.Id);
		Test.stopTest();

		System.assertEquals(0, clonedItems.size());
	}

	@isTest static void cloneTextPost_NullData(){
		Test.startTest();
		List<FeedItem> clonedItems = FeedItemService.cloneTextPost(null, null);
		Test.stopTest();

		System.assertEquals(0, clonedItems.size());
	}

	@IsTest static void cloneTextPost_EmptyData(){
		//accounts before insert (without id)
		Account sourceAccount = AccountDataFactory.getAccountByName('Source Account');
		Account targetAccount = AccountDataFactory.getAccountByName('Target Account');

		Test.startTest();
		List<FeedItem> clonedItems = FeedItemService.cloneTextPost(sourceAccount.Id, targetAccount.Id);
		Test.stopTest();

		System.assertEquals(0, clonedItems.size());
	}

	@IsTest static void  cloneTrackedChangeToTextPost_NullData() {
		Account sourceAccount = AccountDataFactory.getAccountByName('Source Account');
		Account targetAccount = AccountDataFactory.getAccountByName('Target Account');
		insert sourceAccount;
		insert targetAccount;
		sourceAccount.Phone = '987654321';
		update  sourceAccount;

		Test.startTest();
		FeedItem clonedItems = FeedItemService.cloneTrackedChangeToTextPost(sourceAccount.Id, targetAccount.Id);
		Test.stopTest();

		System.assertEquals(null, clonedItems.Id);
	}

	@IsTest static void  cloneTrackedChangeToTextPost_SourceChanged(){
		Account sourceAccount = AccountDataFactory.getAccountByName('Source Account');
		Account targetAccount = AccountDataFactory.getAccountByName('Target Account');
		insert sourceAccount;
		insert targetAccount;

		Test.startTest();
		FeedItem clonedItems = FeedItemService.cloneTrackedChangeToTextPost(sourceAccount.Id, targetAccount.Id);
		Test.stopTest();

		System.assertEquals(null, clonedItems.Id);
	}

	@IsTest static void  cloneTrackedChangeToTextPost_EmptyData(){
		Account sourceAccount = AccountDataFactory.getAccountByName('Source Account');
		Account targetAccount = AccountDataFactory.getAccountByName('Target Account');

		Test.startTest();
		FeedItem clonedItems = FeedItemService.cloneTrackedChangeToTextPost(sourceAccount.Id, targetAccount.Id);
		Test.stopTest();

		System.assertEquals(null, clonedItems.Id);
	}
}