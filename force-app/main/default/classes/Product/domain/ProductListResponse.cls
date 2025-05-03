public with sharing class ProductListResponse {
    @AuraEnabled
    public List<ProductListItem> products { get; set; }

    // Default constructor
    public ProductListResponse() {
        this.products = new List<ProductListItem>();
    }

}