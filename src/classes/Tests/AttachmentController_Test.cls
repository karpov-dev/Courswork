@IsTest
private class AttachmentController_Test {

    @IsTest static void getAttachmentsByOwnerId_FoundData() {
        Product2 product = ProductFactory.getProduct();
        insert product;
        Attachment attachment = new Attachment(ParentId = product.Id);
        attachment.Name = 'test';
        attachment.Body = Blob.valueOf('test');
        insert attachment;

        Test.startTest();
        List<Attachment> result = AttachmentController.getAttachmentsByOwnerId(product.Id);
        Test.stopTest();

        System.assert(!result.isEmpty());
        System.assertEquals(1, result.size());
    }
    @IsTest static void getAttachmentsByOwnerId_NotFoundData() {
        Product2 product = ProductFactory.getProduct();
        insert product;

        Test.startTest();
        List<Attachment> result = AttachmentController.getAttachmentsByOwnerId(product.Id);
        Test.stopTest();

        System.assert(result.isEmpty());
    }
    @IsTest static void getAttachmentsByOwnerId_EmptyParentID() {
        Test.startTest();
        List<Attachment> result = AttachmentController.getAttachmentsByOwnerId(null);
        Test.stopTest();

        System.assert(result.isEmpty());
    }
}