public class ProductException extends Exception {
    public static final String UNABLE_TO_FETCH_PRODUCT_LIST = 'Unable to fetch product list. Please try again later.';
    public static final String UNABLE_TO_FETCH_PRODUCT_DETAIL = 'Unable to fetch product detail. Please try again later.';
    public static final String NO_PRODUCT_FOUND = 'No product found.';
    public static final String NO_PRODUCT_DETAIL_FOUND = 'No product detail found.';
    public static final String INVALID_PRODUCT_ID = 'Invalid product ID.';
    public static final String PRODUCT_LIST_API_ERROR = 'Error fetching product list from API.';
    public static final String PRODUCT_DETAIL_API_ERROR = 'Error fetching product detail from API.';
    public static final String PRODUCT_LIST_EMPTY = 'Product list is empty.';
    public static final String PRODUCT_DETAIL_EMPTY = 'Product detail is empty.';
    public static final String PRODUCT_LIST_API_TIMEOUT = 'Product list API request timed out.';
    public static final String PRODUCT_DETAIL_API_TIMEOUT = 'Product detail API request timed out.';
    public static final String PRODUCT_LIST_API_UNAUTHORIZED = 'Unauthorized access to product list API.';
    public static final String PRODUCT_DETAIL_API_UNAUTHORIZED = 'Unauthorized access to product detail API.';
    public static final String UNKNOWN_ERROR = 'An unknown error occurred while fetching product data.';
}