// Write a method that filters and returns a list of students who are in "Computer Science."

public class CS_Students {
    public static List<String> cal() {
        list<String> list1 = new list<String>();
        list1.add('John Doe, 20, Sophomore, Computer Science');
        list1.add('Emily Smith, 19, Freshman, Biology');
        list1.add('Michael Johnson, 21, Junior, Mathematics');
        list1.add('Sophia Williams, 22, Senior, Chemistry');
        list1.add('James Brown, 23, Senior, Physics');
        list1.add('Olivia Garcia, 18, Freshman, Economics');
        list1.add('Liam Martinez, 20, Sophomore, Business Administration');
        list1.add('Ava Rodriguez, 19, Sophomore, History');
        list1.add('Noah Lee, 21, Junior, Electrical Engineering');
        list1.add('Isabella Walker, 22, Senior, Political Science');
        
        list<String> csStudents = new list<String>();
        for(String record : list1){
            String[] data = record.split(', ');
            if(data[3] == 'Computer Science'){
                csStudents.add(record);
            }
        }
        
        return csStudents;
}
    
    public static void main() {
        List<String> student = cal();
        for (String i : student) {
            System.debug(i);
        }
    }
}