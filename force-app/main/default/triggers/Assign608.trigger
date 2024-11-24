trigger Assign608 on Opportunity (after update) {
    Assign608Handler.main(Trigger.new, Trigger.oldMap);
}