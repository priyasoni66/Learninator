trigger Assign603 on Contact (before insert) {
    Assign603Handler.main(Trigger.new);
}