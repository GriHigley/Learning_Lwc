public with sharing class ProductListItem {
    @AuraEnabled
    public String product_id { get; set; }

    @AuraEnabled
    public String price { get; set; }

    @AuraEnabled
    public String price_percentage_change_24h { get; set; }

    @AuraEnabled
    public String volume_24h { get; set; }

    @AuraEnabled
    public String volume_percentage_change_24h { get; set; }

    @AuraEnabled
    public String base_name { get; set; }

    @AuraEnabled
    public String quote_name { get; set; }

    @AuraEnabled
    public String status { get; set; }

    @AuraEnabled
    public String display_name { get; set; }

    @AuraEnabled
    public String approximate_quote_24h_volume { get; set; }

    // Default constructor
    public ProductListItem() {}
    
    public ProductListItem(String product_id, String price, String price_percentage_change_24h, String volume_24h,
                   String volume_percentage_change_24h, String base_name){
        this.product_id = product_id;
        this.price = price;         
        this.price_percentage_change_24h = price_percentage_change_24h;
        this.volume_24h = volume_24h;
        this.volume_percentage_change_24h = volume_percentage_change_24h;
        this.base_name = base_name;
    } 
    // Parameterized constructor for convenience
    public ProductListItem(String product_id, String price, String price_percentage_change_24h, String volume_24h,
                   String volume_percentage_change_24h, String base_name, String quote_name, String status,
                   String display_name, String approximate_quote_24h_volume) {
        this.product_id = product_id;
        this.price = price;
        this.price_percentage_change_24h = price_percentage_change_24h;
        this.volume_24h = volume_24h;
        this.volume_percentage_change_24h = volume_percentage_change_24h;
        this.base_name = base_name;
        this.quote_name = quote_name;
        this.status = status;
        this.display_name = display_name;
        this.approximate_quote_24h_volume = approximate_quote_24h_volume;
    }
}