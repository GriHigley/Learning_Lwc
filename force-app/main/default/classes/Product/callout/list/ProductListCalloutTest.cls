@IsTest
public with sharing class ProductListCalloutTest {
    @IsTest
    public static void testGetProductList() {
        // Start the test
        Test.startTest();
        
        // Set up the mock response
        Test.setMock(HttpCalloutMock.class, new ProductListCalloutMock());
        
        // Call the method to test
        List<ProductListItem> products = ProductListCallout.getProductListItemsFromApi();
        System.debug('Products: ' + products);
        // Validate the results
        System.assertNotEquals(null, products, 'The product list should not be null.');
        System.assertEquals(2, products.size(), 'The product list should contain 2 products.');
        System.assertEquals('BTC-USDC', products[0].product_id, 'The first product ID should match.');
        System.assertEquals('ETH-USDC', products[1].product_id, 'The second product ID should match.');
        System.assertEquals('Bitcoin', products[0].base_name, 'The base name of the first product should match.');
        System.assertEquals('Ethereum', products[1].base_name, 'The base name of the second product should match.');
        
        // Stop the test
        Test.stopTest();
    }
}
