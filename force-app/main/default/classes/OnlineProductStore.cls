// Assign-321

public class OnlineProductStore {
    public static void cal(Double basePrice, String category, Double discount, String cusType){
        discount = 0;
        System.debug('Base Price: ' + basePrice);
        if(category.equals('Electronics') && basePrice > 500){
            discount = basePrice*5/100;
            basePrice = basePrice - discount;
        }
        if(cusType.equals('VIP') && basePrice < 1000){
            discount = basePrice*10/100;
            basePrice = basePrice - discount;
        }
        if(basePrice > 1000){
            System.debug('Free Shipping Applied');
        }
        System.debug('Total Discount: ' + discount);
        System.debug('Final Price: ' + basePrice);
    }
}