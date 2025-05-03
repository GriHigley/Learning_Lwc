public with sharing class ProductDetailCallout {
     public static ProductDetail getProductDetail(String productId) {
        // Validate the input
        if (String.isBlank(productId)) {
            throw new CalloutException('Product ID cannot be null or empty.');
        }

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:ProductDetail/' + productId);
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Accept', 'application/json');
        request.setTimeout(120000); // Set timeout to 120 seconds
        HttpResponse response;  
        try {
            response = http.send(request);
        } catch (System.CalloutException e) {
            throw new CalloutException('Callout failed: ' + e.getMessage());
        }
        if (response.getStatusCode() == 200) {
            // Parse the response and create a ProductDetail object
            String jsonResponse = response.getBody();
            ProductDetail productDetail = (ProductDetail) JSON.deserialize(jsonResponse, ProductDetail.class);
            return productDetail;
        } else {
            throw new CalloutException('Error: ' + response.getStatus());
        }
    }
}