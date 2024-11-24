trigger Assign601 on Contact (after insert, after delete, after undelete) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert || Trigger.isUndelete) {
            Assign601Handler.main(Trigger.new);
        } else if (Trigger.isDelete) {
            Assign601Handler.main(Trigger.old);
        }
    }
}