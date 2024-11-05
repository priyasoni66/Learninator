// Assign-313

public class StudentsGrade {
    Integer engMarks;
	Integer sciMarks;
	Integer mathMarks;
    Integer totalDaysAttended;
    
    public StudentsGrade(Integer engMarks, Integer sciMarks, Integer mathMarks, Integer totalDaysAttended){
        this.engMarks = engMarks;
		this.sciMarks = sciMarks;
		this.mathMarks = mathMarks;
        this.totalDaysAttended = totalDaysAttended; 
    }
    
    public void finalGrade(){
        String grade;
        Integer avgScore;
        avgScore = (engMarks + sciMarks + mathMarks) / 3;
        if (avgScore >= 90 && totalDaysAttended >= 90){
            grade = 'A';
            Integer bonus = avgScore * 5 / 100;
            avgScore = avgScore + bonus;
            System.debug('bonus ' + bonus);
        } else if ((avgScore >= 80 || avgScore <= 89) && totalDaysAttended >= 85){
            grade = 'B';
        } else if ((avgScore >= 70 || avgScore <= 79) && totalDaysAttended >= 80){
            grade = 'C';
        } else {
            grade = 'D';
        }
        System.debug('avgScore ' + avgScore);
        System.debug('grade ' + grade);
    }
}