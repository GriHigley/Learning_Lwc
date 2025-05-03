@IsTest
public with sharing class ProductListCtrlTest {
    @IsTest
    static void testGetProductsList_Success() {
        // Arrange: Create mock data for the ProductService
        List<ProductListItem> mockProducts = new List<ProductListItem>();
        mockProducts.add(new ProductListItem('BTC-USDC', 'Bitcoin', 'USDC', '96410.21', '2.35', '8338.43'));
        mockProducts.add(new ProductListItem('ETH-USDC', 'Ethereum', 'USDC', '1840.12', '1.23', '1234.56'));

        // Mock the ProductService.getProductsList method
        Test.startTest();
        ProductServiceMock.setMockProducts(mockProducts);
        List<ProductListItem> result = ProductListCtrl.getProductsList();
        Test.stopTest();

        // Assert: Verify the results
        System.assert(result <> null, 'The result should not be null.');
        System.assertEquals(2, result.size(), 'The result should contain 2 products.');
        System.assertEquals('BTC-USDC', result[0].product_id, 'The first product ID should match.');
        System.assertEquals('ETH-USDC', result[1].product_id, 'The second product ID should match.');
    }

    @IsTest
    static void testGetProductsList_NoProducts() {
        // Arrange: Mock the ProductService to return an empty list
        Test.startTest();
        ProductServiceMock.setErrorMessage(ProductException.NO_PRODUCT_FOUND);
        ProductServiceMock.setMockProducts(new List<ProductListItem>());
        ProductServiceMock.setThrowException(true);
        try {
            ProductListCtrl.getProductsList();
        } catch (AuraHandledException e) {
            // Assert: Verify the exception message
            System.assertEquals(ProductException.NO_PRODUCT_FOUND, e.getMessage(), 'The exception message should match.');
        }
        Test.stopTest();
    }

    @IsTest
    static void testGetProductsList_Exception() {
        // Arrange: Mock the ProductService to throw an exception
        Test.startTest();
        ProductServiceMock.setThrowException(true);
        ProductServiceMock.setErrorMessage(ProductException.UNABLE_TO_FETCH_PRODUCT_LIST);
        try {
            ProductListCtrl.getProductsList();
        } catch (AuraHandledException e) {
            // Assert: Verify the exception message
            System.assertEquals(ProductException.UNABLE_TO_FETCH_PRODUCT_LIST, e.getMessage(), 'The exception message should match.');
        }
        Test.stopTest();
    }
}