// Q8 Write a method that categorizes students into two separate lists: 
// one for students majoring in "Engineering" (e.g., Electrical Engineering) and another for non-engineering students.

public class CategorizeStudents {
public static list<String> Engineers() {
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

        
       	list<String> Engineers = new list<String>();
        for (String record : students) {
            String[] data = record.split(', ');
            if(data[3].trim() == 'Electrical Engineering'){
                Engineers.add(record);
            }
    }
    return Engineers;
}
    public static list<String> nonEngineers() {
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

        
       	
    	list<String> nonEngineers = new list<String>();
        for (String record : students) {
            String[] data = record.split(', ');
            if(data[3].trim() != 'Electrical Engineering'){
                nonEngineers.add(record);
            }
        }
        return nonEngineers;
    }

    public static void main(){
        System.debug('Engineers');
        List<String> student = Engineers();
        for (String i : student) {
            System.debug(i);
        }
        System.debug('Non Engineers');
        List<String> student2 = nonEngineers();
        for (String i : student2) {
            System.debug(i);
    	}
    }
}