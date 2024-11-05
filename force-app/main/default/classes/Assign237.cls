public class Assign237 {
    public static void main(){
        List<Account> accWithTechIndustry = [
        	SELECT Id, Name, Industry 
            FROM Account
			WHERE Industry = 'Technology'
        ];
        for(Account acc : accWithTechIndustry){
            System.debug('Account Name: ' + acc.Name);
            System.debug('Industry: ' + acc.Industry);
        }
    }
}