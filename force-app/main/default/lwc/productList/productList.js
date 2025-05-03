import { LightningElement, api, wire } from 'lwc';
import { FlowAttributeChangeEvent } from 'lightning/flowSupport';
import  getProductsList from '@salesforce/apex/ProductListCtrl.getProductsList'; // Import the Apex method
import { ShowToastEvent } from 'lightning/platformShowToastEvent'; // Import the ShowToastEvent
export default class ProductList extends LightningElement {
    @api products = [];
    error;

    @wire(getProductsList)
    wiredProducts({ error, data }) {
        if (data) {
            console.log('Data from Apex:', data); // Log the data received from the Apex method
            this.products = data; // Assign the list of products to the products property
            this.error = undefined;
        } else if (error) {
            toast = new ShowToastEvent({
                title: 'Error loading products',
                message: error.body.message,
                variant: 'error',
            });
            this.dispatchEvent(toast); // Dispatch the toast event to show the error message
            // Optionally, you can also log the error to the console
            console.error('Error from Apex:', error); // Log the error if the Apex method fails
            this.error = error; // Capture the error if the Apex method fails
            this.products = [];
        }
    }

    @api columns = [
        { label: 'Product ID', fieldName: 'product_id' },
        { label: 'Display Name', fieldName: 'display_name' },
        { label: 'Price', fieldName: 'price', type: 'currency', typeAttributes: { currencyCode: 'USD' } },
        { label: '24h Price Change (%)', fieldName: 'price_percentage_change_24h', type: 'percent', typeAttributes: { step: '0.01' } },
        { label: '24h Volume', fieldName: 'volume_24h', type: 'number' },
        { label: '24h Volume Change (%)', fieldName: 'volume_percentage_change_24h', type: 'percent', typeAttributes: { step: '0.01' } },
        { label: 'Status', fieldName: 'status' },
        { label: 'Base Name', fieldName: 'base_name' },
        { label: 'Quote Name', fieldName: 'quote_name' },
        { label: '24h Quote Volume', fieldName: 'approximate_quote_24h_volume', type: 'currency', typeAttributes: { currencyCode: 'USD' } },
    ];

    @api selectedRow; // To store the selected row and expose it to the flow

    handleRowSelection(event) {
        const selectedRows = event.detail.selectedRows;
        console.log('Selected rows:', selectedRows); // Log the selected rows
        if (selectedRows.length > 0) {
            this.selectedRow = selectedRows[0]; // Since max-row-selection is 1, take the first row
            console.log('Selected row:', this.selectedRow); // Log the selected row
            // Publish the change event to the flow
            const attributeChangeEvent = new FlowAttributeChangeEvent('selectedRow', this.selectedRow);
            this.dispatchEvent(attributeChangeEvent);
        }
    }
}