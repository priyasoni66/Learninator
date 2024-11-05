// Assign-309

public class UsersNextBirthday {
    public static void cal(Date birthDate){
        Date today = Date.today();
        Integer birthMonth = birthDate.month();
        Integer birthDay = birthDate.day();
        Date nextBirthday = Date.newInstance(today.year(), birthMonth, birthDay);
        if (nextBirthday < today) {
            nextBirthday = Date.newInstance(today.year() + 1, birthMonth, birthDay);
        }
        Integer daysRemaining = today.daysBetween(nextBirthday);
        System.debug(daysRemaining);
    }
}