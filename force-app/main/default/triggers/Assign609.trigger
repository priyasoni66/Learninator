trigger Assign609 on Contact (after insert, after delete) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            Assign609Handler.main(Trigger.new);
        } else if (Trigger.isDelete) {
            Assign609Handler.main(Trigger.old);
        }
    }
}