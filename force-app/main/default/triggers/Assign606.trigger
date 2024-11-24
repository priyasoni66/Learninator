trigger Assign606 on Task (after update) {
    Assign606Handler.main(Trigger.new, Trigger.oldMap);
}