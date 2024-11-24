trigger Assign512 on Role__c (after insert) {
    List<Table__c> tables = [
        SELECT Id, Name 
		FROM Table__c
    ];

    List<Permission__c> permissionsToCreate = new List<Permission__c>();

    for (Role__c role : Trigger.New) {
        for (Table__c table : tables) {
            Permission__c permission = new Permission__c();
            permission.Name = table.Name + '-' + role.Name;
            permission.Table__c = table.Id;
            permission.Role__c = role.Id;
            permissionsToCreate.add(permission);
        }
    }

    if (permissionsToCreate.size() > 0) {
        insert permissionsToCreate;
    }
}