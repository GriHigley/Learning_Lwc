@IsTest
public class ProductServiceMock {
    private static Boolean throwException = false;
    private static string exceptionMessage = ProductException.UNKNOWN_ERROR;
    
    private static List<ProductListItem> mockProducts;
    
    public static void setMockProducts(List<ProductListItem> products) {
        mockProducts = products;
    }
    
    private static ProductDetail mockProductDetail;
    public static void setMockProductDetail(ProductDetail productDetail) {
        // This method is not used in the current test cases but can be implemented if needed
        mockProductDetail = productDetail;
    }

    public static void setErrorMessage(String message) {
        exceptionMessage = message;
    }

    public static void setThrowException(Boolean shouldThrow) {
        throwException = shouldThrow;
    }

    @TestVisible
    public static List<ProductListItem> getProductsList() {
        if (throwException) {
            throw new ProductException(exceptionMessage);
        }
        return mockProducts;
    }
    @TestVisible
    public static ProductDetail getProductDetail(String product_id) {
        if (throwException) {
            throw new ProductException(exceptionMessage);
        }
        return mockProductDetail;
    }
}