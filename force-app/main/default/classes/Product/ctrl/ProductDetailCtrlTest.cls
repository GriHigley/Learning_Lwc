@isTest
public with sharing class ProductDetailCtrlTest {
    @isTest
    static void testGetProductDetail_Success() {
        // Arrange: Create mock data for the ProductService
        String productId = 'BTC-USDC';
        ProductDetail mockProductDetail = new ProductDetail(productId, 'Bitcoin', 'USDC', '96410.21', '2.35', '8338.43');

        // Mock the ProductService.getProductDetail method
        Test.startTest();
        ProductServiceMock.setMockProductDetail(mockProductDetail);
        ProductDetail result = ProductDetailCtrl.getProductDetail(productId);
        Test.stopTest();

        // Assert: Verify the results
        System.assert(result != null, 'The result should not be null.');
        System.assertEquals(productId, result.product_id, 'The product ID should match.');
        System.assertEquals('Bitcoin', result.base_name, 'The product name should match.');
        System.assertEquals('USDC', result.quote_name, 'The quote currency should match.');
        System.assertEquals('96410.21', result.price, 'The last price should match.');
        System.assertEquals('2.35', result.price_percentage_change_24h, 'The 24h change should match.');
        System.assertEquals('8338.43', result.volume_24h, 'The 24h volume should match.');

    }
    @isTest
    static void testGetProductDetail_NoProductFound() {
        // Arrange: Mock the ProductService to return null
        Test.startTest();
        ProductServiceMock.setThrowException(true);
        ProductServiceMock.setErrorMessage(ProductException.NO_PRODUCT_FOUND);
        try {
            ProductDetailCtrl.getProductDetail('INVALID-ID');
        } catch (AuraHandledException e) {
            // Assert: Verify the exception message
            System.assertEquals(ProductException.NO_PRODUCT_FOUND, e.getMessage(), 'The exception message should match.');
        }
        Test.stopTest();
    }
    @isTest
    static void testGetProductDetail_Exception() {
        // Arrange: Mock the ProductService to throw an exception
        Test.startTest();
        ProductServiceMock.setThrowException(true);
        ProductServiceMock.setErrorMessage(ProductException.UNABLE_TO_FETCH_PRODUCT_DETAIL);
        try {
            ProductDetailCtrl.getProductDetail('INVALID-ID');
        } catch (AuraHandledException e) {
            // Assert: Verify the exception message
            System.assertEquals(ProductException.UNABLE_TO_FETCH_PRODUCT_DETAIL, e.getMessage(), 'The exception message should match.');
        }
        Test.stopTest();
    }
}