@IsTest
private class FeedItemServiceUtils_Test {

    @IsTest static void TrackedChangeToTextPost_NormalData() {
        Account sourceAccount = AccountDataFactory.getAccountByName('Source Account');
        Account targetAccount = AccountDataFactory.getAccountByName('Target Account');
        insert  sourceAccount;
        insert  targetAccount;

        List<FeedItem> trackedChangeItems = FeedItemManager.getItemsByParentIdAndType(sourceAccount.Id, 'TrackedChange');

        Test.startTest();
        FeedItem textPostItem = FeedItemServiceUtils.TrackedChangeToTextPost(trackedChangeItems, targetAccount.Id);
        Test.stopTest();

        System.assertEquals(targetAccount.Id, textPostItem.ParentId);
    }

    @IsTest static void TrackedChangeToTextPost_NullData() {
        Test.startTest();
        FeedItem textPostItem = FeedItemServiceUtils.TrackedChangeToTextPost(null, null);
        Test.stopTest();

        System.assertEquals(true,  textPostItem.Type != 'TextPost');
    }

}