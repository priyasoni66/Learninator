// Assign-302

public class StoreUserInfo {
    String fullName;
	Integer age;
	Boolean salesforceEmployee;

    public StoreUserInfo(String fullName, Integer age, Boolean salesforceEmployee){
        this.fullName = fullName;
        this.age = age;
        this.salesforceEmployee = salesforceEmployee;
    }
    public void isEmp(){
        if(salesforceEmployee){
            System.debug('Salesforce Employee');
        }else{
            System.debug('Not Salesforce Employee');
        }
    }
}