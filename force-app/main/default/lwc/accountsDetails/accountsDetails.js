import { LightningElement, api } from 'lwc';

export default class AccountDetailsModal extends LightningElement {
    @api selectedAccount;

    closeModal() {
        this.dispatchEvent(new CustomEvent('close'));
    }
}