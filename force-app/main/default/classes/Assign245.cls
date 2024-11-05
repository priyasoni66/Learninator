public class Assign245 {
    public static void main() {
        List<Account> accountsWithBillingAddress = [
            SELECT BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry, 
                   Id, Name, 
                   (SELECT Name, MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry 
                    FROM Contacts) 
            FROM Account 
            WHERE BillingStreet != null
        ];
        for (Account acc : accountsWithBillingAddress) {
            if (acc.Contacts != null && acc.Contacts.size() > 0) {
                for (Contact con : acc.Contacts) {
                    if (acc.BillingStreet == con.MailingStreet &&
                        acc.BillingCity == con.MailingCity &&
                        acc.BillingState == con.MailingState &&
                        acc.BillingPostalCode == con.MailingPostalCode &&
                        acc.BillingCountry == con.MailingCountry) {
                        System.debug('Contact Name: ' + con.Name);
                        System.debug('Account Name: ' + acc.Name);
                    }
                }
            }
        }
    }
}