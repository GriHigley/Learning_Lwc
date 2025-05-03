public with sharing class ProductDetail {
    @AuraEnabled public String product_id { get; set; }
    @AuraEnabled public String price { get; set; }
    @AuraEnabled public String price_percentage_change_24h { get; set; }
    @AuraEnabled public String volume_24h { get; set; }
    @AuraEnabled public String volume_percentage_change_24h { get; set; }
    @AuraEnabled public String base_increment { get; set; }
    @AuraEnabled public String quote_increment { get; set; }
    @AuraEnabled public String quote_min_size { get; set; }
    @AuraEnabled public String quote_max_size { get; set; }
    @AuraEnabled public String base_min_size { get; set; }
    @AuraEnabled public String base_max_size { get; set; }
    @AuraEnabled public String base_name { get; set; }
    @AuraEnabled public String quote_name { get; set; }
    @AuraEnabled public Boolean watched { get; set; }
    @AuraEnabled public Boolean is_disabled { get; set; }
    @AuraEnabled public Boolean is_new { get; set; }
    @AuraEnabled public String status { get; set; }
    @AuraEnabled public Boolean cancel_only { get; set; }
    @AuraEnabled public Boolean limit_only { get; set; }
    @AuraEnabled public Boolean post_only { get; set; }
    @AuraEnabled public Boolean trading_disabled { get; set; }
    @AuraEnabled public Boolean auction_mode { get; set; }
    @AuraEnabled public String product_type { get; set; }
    @AuraEnabled public String quote_currency_id { get; set; }
    @AuraEnabled public String base_currency_id { get; set; }
    @AuraEnabled public String fcm_trading_session_details { get; set; }
    @AuraEnabled public String mid_market_price { get; set; }
    @AuraEnabled public String alias { get; set; }
    @AuraEnabled public List<String> alias_to { get; set; }
    @AuraEnabled public String base_display_symbol { get; set; }
    @AuraEnabled public String quote_display_symbol { get; set; }
    @AuraEnabled public Boolean view_only { get; set; }
    @AuraEnabled public String price_increment { get; set; }
    @AuraEnabled public String display_name { get; set; }
    @AuraEnabled public String product_venue { get; set; }
    @AuraEnabled public String approximate_quote_24h_volume { get; set; }
    @AuraEnabled public String new_at { get; set; }

    // Default constructor
    public ProductDetail() {}

    // Parameterized constructor for convenience
    public ProductDetail(String product_id) {
        this.product_id = product_id;
    }
    public ProductDetail(String product_id, String base_name, String quote_name, String last_price, String change_24h, String volume_24h) {
        this.product_id = product_id;
        this.base_name = base_name;
        this.quote_name = quote_name;
        this.price = last_price;
        this.price_percentage_change_24h = change_24h;
        this.volume_24h = volume_24h;
    }
}