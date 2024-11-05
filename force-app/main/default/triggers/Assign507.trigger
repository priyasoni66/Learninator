trigger Assign507 on Contact (before insert) {
    for (Contact con : trigger.new) {
        if (con.Birthdate != null) {
            Integer age = 0;
            if (con.Birthdate <= System.today()) {
                age = System.today().year() - con.Birthdate.year();
                if (System.today().month() < con.Birthdate.month() || 
                    (System.today().month() == con.Birthdate.month() && System.today().day() < con.Birthdate.day())) {
                    age--;
                }
            }

            System.debug('age: ' + age);
            if (age < 18) {
                con.addError('Age must be 18 or older.');
            }
        }
    }
}