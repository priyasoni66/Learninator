// Q9 Write a method that checks if any student in the list is 21 years or older
// but still listed as a "Sophomore." If such a student exists, return the student's name.

public class CheckStuGrade {
public static String cal(){
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
        
    	
        for(String record : students){
            String[] data = record.split(',');
            Integer age = Integer.valueOf(data[1].trim());
            String grade = data[2].trim();
            if(age >= 21 && grade == 'Sophomore'){
            	return data[0];
            }
        }
        return null;
    }
    public static void main(){
        String stuName = cal();
        if (stuName != null) {
            System.debug('Student found: ' + stuName);
        } else {
            System.debug('No student found');
        }
    }
}