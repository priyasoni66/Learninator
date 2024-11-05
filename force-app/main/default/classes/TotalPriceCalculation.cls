// Assign-301

public class TotalPriceCalculation{
    Integer quantityOfItems;
    Double pricePerItem;
    Double discount = 0.10;
    
    public TotalPriceCalculation(Integer quantityOfItems, Double pricePerItem){
		this.quantityOfItems = quantityOfItems;
		this.pricePerItem = pricePerItem;
		Double totalPrice = quantityOfItems * pricePerItem;
        System.debug(totalPrice);
        if(totalPrice > 500){
		   Double discountAmount = totalPrice * discount;
           totalPrice = totalPrice - discountAmount; 
        }
        System.debug(totalPrice);
    }
}