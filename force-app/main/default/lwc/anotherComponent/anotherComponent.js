import { LightningElement, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getAccounts from '@salesforce/apex/CustomTable.getAccounts';

export default class CustomAccountTable extends NavigationMixin(LightningElement) {
    accountData = [];

    @wire(getAccounts)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accountData = data;
        } else if (error) {
            // Handle error
        }
    }

    handleRowClick(event) {
        const accountId = event.currentTarget.dataset.id;
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: accountId,
                objectApiName: 'Account',
                actionName: 'view'
            }
        });
    }
}