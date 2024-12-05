public with sharing class LWC1007 {

    @AuraEnabled
    public static String uploadFile(String contactId, String fileName, Blob fileBody) {
        try {
            ContentVersion contentVersion = new ContentVersion();
            contentVersion.Title = fileName;
            contentVersion.PathOnClient = fileName;
            contentVersion.VersionData = fileBody;
            insert contentVersion;

            ContentDocumentLink contentDocLink = new ContentDocumentLink();
            contentDocLink.ContentDocumentId = [SELECT ContentDocumentId FROM ContentVersion WHERE Id = :contentVersion.Id].ContentDocumentId;
            contentDocLink.LinkedEntityId = contactId; 
            contentDocLink.ShareType = 'V'; 
            insert contentDocLink;

            return 'Success';
        } catch (Exception e) {
            throw new AuraHandledException('Error uploading file: ' + e.getMessage());
        }
    }
}