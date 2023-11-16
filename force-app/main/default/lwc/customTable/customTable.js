import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/CustomTable.getAccounts';

export default class CustomTableWithAccountName extends LightningElement{
    accountData = [];
    selectedAccountId = null;

    @wire(getAccounts)
    wiredAccounts({ error, data }) {
        if (data) {
            console.log(data)
            this.accountData = data        
        } else if (error) {
           console.error(error)
        }
    }
    toggleAccountDetails(event) {
        const accountId = event.currentTarget.dataset.id;
        this.selectedAccountId = accountId;
    }
}