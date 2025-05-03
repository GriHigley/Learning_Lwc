public with sharing class ProductListCalloutMock implements HttpCalloutMock{
    public HttpResponse respond(HttpRequest request) {
        // Mock the HTTP response
        HttpResponse mockResponse = new HttpResponse();
        mockResponse.setHeader('Content-Type', 'application/json');
        mockResponse.setBody('{"products": [{"product_id": "BTC-USDC", "price": "96410.21", "price_percentage_change_24h": "2.3547703525345", "volume_24h": "8338.43536309", "volume_percentage_change_24h": "27.94030466291752", "base_name": "Bitcoin", "quote_name": "USDC", "status": "online", "display_name": "BTC-USDC", "approximate_quote_24h_volume": "803910304.43"}, {"product_id": "ETH-USDC", "price": "1840.12", "price_percentage_change_24h": "1.23456789", "volume_24h": "1234.56789", "volume_percentage_change_24h": "15.67890123", "base_name": "Ethereum", "quote_name": "USDC", "status": "online", "display_name": "ETH-USDC", "approximate_quote_24h_volume": "12345678.90"}]}');
        mockResponse.setStatusCode(200);
        
        return mockResponse;
    }
}