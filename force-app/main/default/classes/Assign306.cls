public class Assign306 {
    public static void insertOpportunityLineItems() {
        List<Opportunity> newOpportunities = [
            SELECT Id, Name, Pricebook2Id
            FROM Opportunity
            WHERE CreatedDate = LAST_N_DAYS:7
        ];

        List<Product2> predefinedProducts = [
            SELECT Id, Name
            FROM Product2
            WHERE Name IN ('GenWatt Diesel 1000KW', 'SLA: Bronze', 'xyz')
        ];

        List<PricebookEntry> pricebookEntries = [
            SELECT Id, Product2Id, UnitPrice, Pricebook2Id
            FROM PricebookEntry
            WHERE Product2Id IN :predefinedProducts
            AND IsActive = true
        ];

        List<OpportunityLineItem> lineItemsToInsert = new List<OpportunityLineItem>();

        for (Opportunity opp : newOpportunities) {
            if (opp.Pricebook2Id != null) {
                for (PricebookEntry pbe : pricebookEntries) {
                    if (opp.Pricebook2Id == pbe.Pricebook2Id) {
                        OpportunityLineItem oli = new OpportunityLineItem();
                        oli.OpportunityId = opp.Id;
                        oli.PricebookEntryId = pbe.Id;
                        oli.Quantity = 1; 
                        oli.UnitPrice = pbe.UnitPrice;
                        lineItemsToInsert.add(oli);
                    }
                }
            }
        }

        if (!lineItemsToInsert.isEmpty()) {
            insert lineItemsToInsert;
            System.debug('Inserted ' + lineItemsToInsert.size() + ' OpportunityLineItem records.');
        } else {
            System.debug('No line items to insert.');
        }
    }
}