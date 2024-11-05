// Q2


public class HighestAge {
    public static String highestAgeCal() {
        List<String> students = new list<String>();
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

        
        String oldestStudent = '';
        Integer maxAge = -1;

        for (String record : students) {
            String[] data = record.split(', ');
            Integer age = Integer.valueOf(data[1]);

            if (age > maxAge) {
                maxAge = age;
                oldestStudent = record;
            }
        }

        return oldestStudent;
    }

    public static void main() {
        String oldestStudent = highestAgeCal();
        System.debug('The oldest student is: ' + oldestStudent);
    }
}