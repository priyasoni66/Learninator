// Q6 Write a method that returns a new list containing only students in the "Freshman" grade.

public class FreshmanStudents {
	public static list<String> cal(){
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
        
        list<String> newList = new list<String>();
        for(String record : students){
            String[] data = record.split(',');
            if(data[2] == ' Freshman'){
            	newList.add(record);
            }
        }
        return newList;
    }
    public static void main(){
        List<String> student = cal();
        for (String i : student) {
            System.debug(i);
        }
    }
}