public with sharing class ProductListCtrl {
 
    @AuraEnabled(cacheable=true)
    public static List<ProductListItem> getProductsList() {
        List<ProductListItem> products = new List<ProductListItem>();
        try {
            products = ProductService.getProductsList();
        } catch (Exception e) {
            System.debug('Error fetching product list: ' + e.getMessage());
            AuraHandledException ex = new AuraHandledException(e.getMessage());
            ex.setMessage(e.getMessage());
            throw ex;
        }
        if (products == null || products.isEmpty()) {
            AuraHandledException ex = new AuraHandledException(ProductException.NO_PRODUCT_FOUND);
            ex.setMessage(ProductException.NO_PRODUCT_FOUND);
            throw ex;
        }
        return products;
    }
}
