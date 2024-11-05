public class Assign405 {
    public static void main() {
        List<PricebookEntry> pricebookEntryList = [
            SELECT Id, Pricebook2Id, Product2.Id, Product2.Name
            FROM PricebookEntry
        ];

        Map<Id, List<Product2>> productsByPricebookMap = new Map<Id, List<Product2>>();

        for (PricebookEntry pbe : pricebookEntryList) {
            Id pricebookId = pbe.Pricebook2Id;
            Product2 product = pbe.Product2;

            if (!productsByPricebookMap.containsKey(pricebookId)) {
                productsByPricebookMap.put(pricebookId, new List<Product2>());
            }

            productsByPricebookMap.get(pricebookId).add(product);
        }
        System.debug('Products grouped by PricebookId: ' + productsByPricebookMap);
    }
}