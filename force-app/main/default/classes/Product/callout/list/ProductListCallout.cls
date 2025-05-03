public with sharing class ProductListCallout{
 
    public static List<ProductListItem> getProductListItemsFromApi(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:ProductListItems?limit=12');
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json');
        try {
            HttpResponse response = http.send(request);
            if (response.getStatusCode() == 200) {
                // Assuming the response is in JSON format
                String jsonResponse = response.getBody();
                System.debug('Response: ' + jsonResponse);
                // Deserialize the JSON response into a list of ProductListItem objects
                ProductListResponse productListResponse = (ProductListResponse) JSON.deserialize(response.getBody(), ProductListResponse.class);
                System.debug('Product List Response: ' + productListResponse);
                // Return the list of product items
                return productListResponse.products;
            } else {
                System.debug('Error: ' + response.getStatus());
            }
        } catch (Exception e) {
            System.debug('Exception: ' + e.getMessage());
        }
        return new List<ProductListItem>();
    }
}