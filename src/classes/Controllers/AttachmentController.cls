public with sharing class AttachmentController {

    @AuraEnabled(cacheable=true)
    public static List<Attachment> getAttachmentsByOwnerId(String ownerId) {
        List<Attachment> attachments = new List<Attachment>();
        if (String.isBlank(ownerId)) return attachments;

        attachments = [SELECT Id FROM Attachment WHERE ParentId = :ownerId];
        return attachments;
    }
}