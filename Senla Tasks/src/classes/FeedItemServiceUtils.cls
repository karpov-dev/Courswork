/**
 * Created by passa on 15.05.2020.
 */

public with sharing class FeedItemServiceUtils {

    public static FeedItem TrackedChangeToTextPost(List<FeedItem> trackedChangeItems, Id targetId){
        FeedItem textPostItem = new FeedItem();
        if(trackedChangeItems == null || String.isEmpty(targetId)) return textPostItem;

        textPostItem.ParentId = targetId;
        textPostItem.Title = 'Tracked Change Post';
        textPostItem.Type = 'TextPost';
        textPostItem.Body = '';
        for(FeedItem item : trackedChangeItems){
            for(FeedTrackedChange trackedItem : item.FeedTrackedChanges){
                textPostItem.Body += 'Field: ' + trackedItem.FieldName + '. Old Value: ' + trackedItem.OldValue + '. New Value: ' + trackedItem.NewValue + '. \n';
            }
        }
        return  textPostItem;
    }

}