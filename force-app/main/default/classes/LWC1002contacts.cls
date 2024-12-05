/**
* @File Name : LWC1001contacts.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : December 3, 2024
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | December 3, 2024 |   | Initial Version
**/

public with sharing class LWC1002contacts {
    public class Response {
        @AuraEnabled
        public Boolean isSuccess;
        @AuraEnabled
        public String message;

        public Response(Boolean isSuccess, String message) {
            this.isSuccess = isSuccess;
            this.message = message;
        }
    }

    @AuraEnabled
    public static Response createContact(String name, String email, String phone) {
        try {
            Contact newContact = new Contact(
                LastName = name,
                Email = email,
                Phone = phone
            );
            insert newContact;
            return new Response(true, 'Contact created successfully: ' + newContact.Id);
        } catch (Exception e) {
            return new Response(false, 'Error: ' + e.getMessage());
        }
    }
}