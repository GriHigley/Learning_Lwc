global class ProductDetailCalloutMock implements HttpCalloutMock {
    global HttpResponse respond(HttpRequest request) {
        // Create a mock HTTP response
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setHeader('Content-Type', 'application/json');

        // Mock JSON response
        String mockResponse = '{"product_id": "BTC-USD", "price": "97083.07", "price_percentage_change_24h": "2.6790798519302", "volume_24h": "8314.85439636", "volume_percentage_change_24h": "26.41780392824511", "base_increment": "0.00000001", "quote_increment": "0.01", "quote_min_size": "1", "quote_max_size": "150000000", "base_min_size": "0.00000001", "base_max_size": "3400", "base_name": "Bitcoin", "quote_name": "US Dollar", "status": "online", "display_name": "BTC-USD", "approximate_quote_24h_volume": "807231591.4"}';
        response.setBody(mockResponse);

        return response;
    }
}