public class FeedItemService {

    public static List<FeedItem> cloneTextPost(Id sourceId, Id targetId){
        List<FeedItem> clonedFeedItems = new List<FeedItem>(); 
		if(String.isBlank(sourceId) || String.isBlank(targetId)) return clonedFeedItems;

		List<FeedItem> sourceFeedItems = FeedItemManager.getItemsByParentIdAndType(sourceId, 'TextPost');
		if(sourceFeedItems.size() < 1) return clonedFeedItems;

		for(FeedItem item : sourceFeedItems){
			FeedItem clonedItem = item.clone();
            clonedItem.ParentId = targetId;
            clonedFeedItems.add(clonedItem);
        }

		upsert clonedFeedItems;
		return clonedFeedItems;
	}

	public static FeedItem cloneTrackedChangeToTextPost(Id sourceId, Id targetId){
		FeedItem clonedItem = new FeedItem();
		if(String.isBlank(sourceId) || String.isBlank(targetId)) return clonedItem;

		List<FeedItem> sourceFeedItems = FeedItemManager.getItemsByParentIdAndType(sourceId, 'TrackedChange');
		if(sourceFeedItems.size() < 1) return clonedItem;

		insert FeedItemServiceUtils.TrackedChangeToTextPost(sourceFeedItems, targetId);
		return clonedItem;
	}



}