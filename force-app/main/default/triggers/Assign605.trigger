trigger Assign605 on Contact (before insert) {
	    Assign605Handler.main(Trigger.new);
}