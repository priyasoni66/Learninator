// Assign-331

public class CollegeAdmission {
    public static void cal(Double gpa, Integer testScore, Date applicationDate, Integer extracurriculars) {
        String admissionDecision = 'Regular Admission';
        String scholarship = 'No Scholarship';
        Integer admissionScore = 0;
        Date academicYearStart = Date.newInstance(Date.today().year(), 9, 1);
        if (gpa > 3.8 && testScore > 90) {
            scholarship = 'Automatic Scholarship Offered';
        }
        if (applicationDate.addMonths(6) < academicYearStart) {
            admissionDecision = 'Early Decision Acceptance';
        }
        if (extracurriculars >= 5) {
            admissionScore += 10; 
        }
        System.debug('Admission Decision: ' + admissionDecision);
        System.debug('Scholarship Status: ' + scholarship);
        System.debug('Final Admission Score: ' + admissionScore);
    }
}