import { LightningElement, api } from 'lwc';
import getProductDetail from '@salesforce/apex/ProductDetailCtrl.getProductDetail';
export default class ProductDetail extends LightningElement {
    @api product = null;
    isLoading = false ;
    error = null;
    _productId = null;
    @api set productId(productId) {
        console.log('Product ID set:', productId);
        this._productId = productId;
        this.fetchProductDetails(productId);
    }
    
    get productId() {
        return this._productId;  
    }
    
    fetchProductDetails(productId) {
        this.product = null;
        this.isLoading = true;
        this.error = null;
        // Check if productId is valid
        if (!productId) {
            this.isLoading = false;
            this.error = 'Invalid product ID';
            console.error(this.error);
            // Optionally, you can dispatch an event or show a toast message to inform the user
            this.dispatchEvent(new ShowToastEvent({
                title: 'Error',
                message: this.error,
                variant: 'error',
            }));
            return;
        }
        // Call the Apex controller method to get product details
        getProductDetail({ 'product_id': productId })
        .then(product => {
            this.isLoading = false;
            this.product = product;
        })
        .catch(error => {
            this.product = null;
            this.isLoading = false;
            console.error('Error fetching product details:', error);
        });
    }
    
}