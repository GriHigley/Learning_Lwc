public with sharing class ProductDetailCtrl {
    @AuraEnabled(cacheable=true)
    public static ProductDetail getProductDetail(String product_id){
        ProductDetail productDetail;
        try {
            productDetail = ProductService.getProductDetail(product_id);
        } catch (Exception e) {
            System.debug('Error fetching product detail: ' + e.getMessage());
            AuraHandledException ex = new AuraHandledException(e.getMessage());
            ex.setMessage(e.getMessage());
            throw ex;
        }
        if (productDetail == null) {
            AuraHandledException ex = new AuraHandledException(ProductException.NO_PRODUCT_FOUND);
            ex.setMessage(ProductException.NO_PRODUCT_FOUND);
            throw ex;
        }
        return productDetail;
    }
}
