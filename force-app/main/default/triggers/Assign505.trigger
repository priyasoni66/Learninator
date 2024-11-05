trigger Assign505 on Product2 (before insert) {

    Set<String> proSKU = new Set<String>();

    for(Product2 pro : trigger.new){
        if(pro.StockKeepingUnit == null){
        	pro.StockKeepingUnit = 'N/A';
        }
        proSKU.add(pro.StockKeepingUnit);
    }
    
    List<Product2> existingProducts = [
        SELECT StockKeepingUnit 
		FROM Product2 
        WHERE StockKeepingUnit IN :proSKU
    ];
    
    Set<String> existingSKUs = new Set<String>();
    for (Product2 existingProduct : existingProducts) {
        existingSKUs.add(existingProduct.StockKeepingUnit);
    }
    
    for (Product2 pro : Trigger.new) {
        if (proSKU.contains(pro.StockKeepingUnit)) {
            pro.addError('The SKU must be unique');
        }
    }
}