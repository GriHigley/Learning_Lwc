@IsTest
public with sharing class ProductDetailCalloutTest {
    @IsTest
    static void testGetProductDetail() {
        // Start the test
        Test.startTest();
        // Set up the mock response
        Test.setMock(HttpCalloutMock.class, new ProductDetailCalloutMock());

        // Call the method to test
        String testProductId = 'BTC-USD';
        ProductDetail result = ProductDetailCallout.getProductDetail(testProductId);

        // Verify the result
        System.assert(result <> null,'The result should not be null.');
        System.assertEquals('BTC-USD', result.product_id, 'The product_id should match the mock response.');
        System.assertEquals('97083.07', result.price, 'The price should match the mock response.');
        System.assertEquals('Bitcoin', result.base_name, 'The base_name should match the mock response.');
        System.assertEquals('US Dollar', result.quote_name, 'The quote_name should match the mock response.');
        
        // Stop the test
        Test.stopTest();
    }
}