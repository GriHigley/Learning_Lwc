public with sharing class ProductService {
    public static List<ProductListItem> getProductsList() {
        if(Test.isRunningTest()) {
            return ProductServiceMock.getProductsList();
        }
        return ProductListCallout.getProductListItemsFromApi();
    }
    public static ProductDetail getProductDetail(String product_id) {
        if(Test.isRunningTest()) {
            return ProductServiceMock.getProductDetail(product_id);
        }
        return ProductDetailCallout.getProductDetail(product_id);
    }   
}