public class Assign201 {
    public static void main() {
        List<Account> accounts = [
            Select Id, Name, 
            (Select Id From Opportunities), 
            (Select Id From Cases) 
            From Account
        ];
        List<Account> resultAccounts = new List<Account>();
        for (Account acc : accounts) {
            Integer oppCount = acc.Opportunities.size();
            Integer caseCount = acc.Cases.size();
            if (oppCount > caseCount) {
                resultAccounts.add(acc);
            }
        }
		for (Account acc : resultAccounts) {
            System.debug('Account Name: ' + acc.Name);
        }
    }
}