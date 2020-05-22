public class FeedItemManager {
	
    public static List<FeedItem> getItemsByParentIdAndType (Id parentId, String itemType){

		if(String.isBlank(parentId) || String.isBlank(itemType)) return new List<FeedItem>();

        return [SELECT Id, ParentId, Body, (SELECT ID, FieldName, OldValue, NewValue FROM FeedTrackedChanges)
				FROM FeedItem
                WHERE ParentId = :parentId AND FeedItem.Type = :itemType
				ORDER BY CreatedDate DESC];
    }
    
}