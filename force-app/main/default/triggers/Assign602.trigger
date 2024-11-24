trigger Assign602 on Opportunity (before insert) {
    Assign602Handler.main(trigger.new);
}