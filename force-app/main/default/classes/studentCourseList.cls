public class studentCourseList{
    public static void main(){
        List<String> studentList = new List<String>();
        studentList.add('1,student1,student1@gmail.com,101');
        studentList.add('2,student2,student2@gmail.com,102');
        studentList.add('3,student3,student3@gmail.com,103');
        studentList.add('4,student4,student4@gmail.com,104');
        studentList.add('5,student5,student5@gmail.com,105');
        System.debug('Student List: ' + studentList);
        
        List<String> courseList = new List<String>();
        courseList.add('101,Salesforce Development,Instructor1');
        courseList.add('102,Salesforce Administrator,Instructor2');
        courseList.add('103,Salesforce Consultant,Instructor3');
        System.debug('Course List: ' + courseList);

        List<String> studentWithCourse = new List<String>();
        for (String s : studentList) {
            List<String> studentDetails = s.split(',');
            String studentName = studentDetails[1];
            String courseId = studentDetails[3];
            String courseName = '';
            
            for (String c : courseList) {
                List<String> courseDetails = c.split(',');
                if (courseDetails[0] == courseId) {
                    courseName = courseDetails[1];
                    break;  
                }
            }
            studentWithCourse.add(studentName + ' is enrolled in ' + courseName);
        }
        System.debug('Student with course list: ' + studentWithCourse);
    }
}