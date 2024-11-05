// Assign-303

public class CheckProductAvailability {
	Integer stock;
	Double price;
	Boolean status;
	
    public CheckProductAvailability(Integer stock, Double price){
        this.stock = stock;
		this.price = price;
    }
    
    public void prodAvailable(){
        if(stock > 0){
            status = true;
			System.debug(stock + ' Available ' + price);
        }else{
            status = false;
            System.debug(stock + ' Out of Stock ' + price);
        }
    }
}