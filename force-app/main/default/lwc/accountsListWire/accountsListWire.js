import { LightningElement,wire } from 'lwc';

import getAccountsByRating from '@salesforce/apex/AccountsControllerUserLwc.getAccountsByRating';

const COLUMNS = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Rating', fieldName: 'Rating' },
    { label: 'Industry', fieldName: 'Industry' },
    { label: 'Phone', fieldName: 'Phone' }
];

export default class AccountsListWire extends LightningElement {

     selectedRating = '';
     accounts = {};

    columns = COLUMNS;

    ratingOptions = [
        { label: 'Hot', value: 'Hot' },
        { label: 'Warm', value: 'Warm' },
        { label: 'Cold', value: 'Cold' }
    ];

    handleChange(event) {
        this.selectedRating = event.detail.value;
    }

    @wire(getAccountsByRating, { rating: '$selectedRating' })
    wiredAccounts(response){
        this.accounts = response;
    }
}