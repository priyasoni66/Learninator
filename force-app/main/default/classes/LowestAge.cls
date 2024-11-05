// Q7 Write a method that iterates through the list and finds the student with the lowest age.

public class LowestAge {
public static String lowestAgeCal() {
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

        
        String youngestStudent = '';
        Integer minAge = 100; 

        for (String record : students) {
            String[] data = record.split(', ');
            Integer age = Integer.valueOf(data[1]);

            if (age < minAge) { 
                minAge = age;
                youngestStudent = record;
            }
        }

        return youngestStudent;
    }

    public static void main() {
        String youngestStudent = lowestAgeCal();
        System.debug('The youngest student is: ' + youngestStudent);
    }
}