// Assign-328 

public class FlashSale {
    public static void cal(Double basePrice, DateTime purchaseTime, Double discountPercentage, Boolean isPremiumMember) {
        Double discount = 0;
        Double surcharge = 0;
        Double finalPrice = basePrice;
        
        Time flashSaleStartTime = Time.newInstance(9, 0, 0, 0);
        Time flashSaleEndTime = Time.newInstance(11, 0, 0, 0);
        
        Time purchaseHour = purchaseTime.time();
        
        if (purchaseHour >= flashSaleStartTime && purchaseHour <= flashSaleEndTime) {
            discount += 30;
        }
        
        if (isPremiumMember) {
            discount += 10;
        }

        Time surchargeStartTime = Time.newInstance(17, 0, 0, 0);
        if (purchaseHour > surchargeStartTime) {
            surcharge = 5;
        }
        
        Double discountAmount = (discount / 100) * basePrice;
        finalPrice = basePrice - discountAmount;
        
        Double surchargeAmount = (surcharge / 100) * finalPrice;
        finalPrice += surchargeAmount;
        
        System.debug('Original Price: ' + basePrice);
        System.debug('Discount Applied: ' + discountAmount);
        System.debug('Surcharge Applied: ' + surchargeAmount);
        System.debug('Final Price: ' + finalPrice);
    }
}