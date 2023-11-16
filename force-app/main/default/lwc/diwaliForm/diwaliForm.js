import { LightningElement, track } from 'lwc';

export default class DiwaliGreetingForm extends LightningElement {
    @track email = '';
    @track password = '';
    @track showGreetingDialog = false;
    @track showError = false;

    handleEmailChange(event) {
        this.email = event.target.value;
        this.showError = false; 
    }

    handlePasswordChange(event) {
        this.password = event.target.value;
        this.showError = false; 
    }

    handleDialogOpen() {
        if (this.email === 'inzmamkhan0016@gmail.com' && this.password === 'Meerut@123') {
            this.showGreetingDialog = true;
        } else {
            this.showError = true; 
        }
    }

    handleDialogClose() {
        this.showGreetingDialog = false;
    }
}
