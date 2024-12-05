public with sharing class recordPageLayout {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(Integer limitSize, Integer offsetSize) {
        try {
            return [
                SELECT Id, Name, Email, Phone, Account.Name
                FROM Contact
                ORDER BY LastName
                LIMIT :limitSize OFFSET :offsetSize
            ];
        } catch (Exception e) {
            throw new AuraHandledException('Error fetching contacts: ' + e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static Integer getContactCount() {
        return [SELECT COUNT() FROM Contact];
    }

    @AuraEnabled
    public static void deleteContacts(List<Id> contactIds) {
        try {
            List<Contact> contactsToDelete = [
                SELECT Id FROM Contact WHERE Id IN :contactIds
            ];
            delete contactsToDelete;
        } catch (Exception e) {
            throw new AuraHandledException('Error deleting contacts: ' + e.getMessage());
        }
    }
}