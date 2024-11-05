// Write a method that checks if all students in the list are over the age of 18.

public class AgeOver18 {
    public static Boolean cal() {
        List<String> students = new List<String>();
        students.add('John Doe, 20, Sophomore, Computer Science');
        students.add('Emily Smith, 19, Freshman, Biology');
        students.add('Michael Johnson, 21, Junior, Mathematics');
        students.add('Sophia Williams, 22, Senior, Chemistry');
        students.add('James Brown, 23, Senior, Physics');
        students.add('Olivia Garcia, 18, Freshman, Economics');
        students.add('Liam Martinez, 20, Sophomore, Business Administration');
        students.add('Ava Rodriguez, 19, Sophomore, History');
        students.add('Noah Lee, 21, Junior, Electrical Engineering');
        students.add('Isabella Walker, 22, Senior, Political Science');

        for (String record : students) {
            String[] data = record.split(', ');
            Integer age = Integer.valueOf(data[1]);

            if (age < 18) {
                return false; 
            }
        }

        return true; 
    }

    public static void main() {
        Boolean result = cal();
        System.debug(result);
    }
}