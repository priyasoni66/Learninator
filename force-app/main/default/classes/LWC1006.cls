/**
* @File Name : LWC1006.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : December 4, 2024
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | December 4, 2024 |   | Initial Version
**/

public with sharing class LWC1006 {
    @AuraEnabled(cacheable=true)
    public static List<Task> fetchTasks() {
        return [SELECT Id, Subject, Status FROM Task WHERE Status IN ('Completed', 'Not Started')];
    }

    @AuraEnabled
    public static void updateTaskStatus(Id taskId, String status) {
        Task t = [SELECT Id, Status FROM Task WHERE Id = :taskId LIMIT 1];
        t.Status = status;
        update t;
    }
}