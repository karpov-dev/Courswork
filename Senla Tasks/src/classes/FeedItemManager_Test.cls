@isTest
public class FeedItemManager_Test {
    
    @isTest static void getItemsByParentIdAndType_FoundData(){
        Account feedItemOwner = AccountDataFactory.getAccount();
        insert feedItemOwner;
        FeedItem feedItem = FeedItemDataFactory.getTextPostFeedItem(feedItemOwner.Id);
        insert feedItem;
        
		Test.startTest();
        List<FeedItem> returnedList = FeedItemManager.getItemsByParentIdAndType(feedItemOwner.Id, 'TextPost');
		Test.stopTest();
        
		System.assertEquals(1, returnedList.size());
		System.assertEquals(feedItemOwner.Id, returnedList[0].ParentId);     
    }
    @isTest static void getItemsByParentIdAndType_NotFoundData(){
        Account feedItemOwner = AccountDataFactory.getAccount();
        insert feedItemOwner;
        
		Test.startTest();
        List<FeedItem> returnedList = FeedItemManager.getItemsByParentIdAndType(feedItemOwner.Id, 'TextPost');
        Test.stopTest();
 
		System.assertEquals(0, returnedList.size());      
    }
    @isTest static void getItemsByParentIdAndType_NullData(){
		Test.startTest();      
        List<FeedItem> returnedList = FeedItemManager.getItemsByParentIdAndType(null, null);
		Test.stopTest();

        System.assertEquals(0, returnedList.size());         
    }
    @isTest static void getItemsByParentIdAndType_EmptyData(){
        //account without id (before insert)
        Account account = AccountDataFactory.getAccount();

		Test.startTest();
        List<FeedItem> returnedList = FeedItemManager.getItemsByParentIdAndType(account.Id, '');
		Test.stopTest();

        System.assertEquals(0, returnedList.size());         
    }
}