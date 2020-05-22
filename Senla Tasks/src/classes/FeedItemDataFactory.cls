@IsTest
public class FeedItemDataFactory {

    public static FeedItem getTextPostFeedItem(Id parentId){
        FeedItem item = new FeedItem();
        item.Type = 'TextPost';
        item.Title = 'Text Post';
        item.Body = 'This is item was created by Data Factory';
        item.ParentId = parentId;
        return item;
    }
    
}