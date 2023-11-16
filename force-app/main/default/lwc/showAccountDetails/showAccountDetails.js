import { LightningElement,wire,api} from 'lwc';
import getAccountDetails from '@salesforce/apex/CustomTable.getAccountDetails';

export default class ShowAccountDetails extends LightningElement {

    @api accountId;
    account = {};

   
    @wire(getAccountDetails, { accountId: '$accountId' })
    wiredAccount({ error, data }) {
        if (data) {
            this.account = data;
        } else if (error) {
            console.error(error)
        }
    }
}