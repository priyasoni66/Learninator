// Assign-311

public class TotalPriceOfPurchase {
    Integer numberOfItemPurchased;
    Double pricePerItem;
	Boolean isMember;
    
    public TotalPriceOfPurchase(Integer numberOfItemPurchased, Double pricePerItem, Boolean isMember) {
    	this.numberOfItemPurchased = numberOfItemPurchased;
    	this.pricePerItem = pricePerItem;
		this.isMember = isMember;   
	}
	
    public void totalPrice(){
      	Double loyaltyPoint = 0;
        Double totalPrice = numberOfItemPurchased * pricePerItem;
        System.debug(totalPrice);
        if(isMember == true){
            if(totalPrice >= 500){
                loyaltyPoint = 2 * (totalPrice / 100);
                
            } else {
                loyaltyPoint = totalPrice / 100; 
            }
        } else {
            loyaltyPoint = totalPrice / 100; 
        }
            System.debug(loyaltyPoint);
    }
}