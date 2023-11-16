import { LightningElement, track } from 'lwc';

export default class MyComponent extends LightningElement {
    @track inputFields = [];
    quickReplyAddDisable = false;

    handleClickAdd() {
        if (this.inputFields.length < 10) {
            this.inputFields.push({ key: Date.now(), value: '', placeHolderValue: '' });
            this.quickReplyAddDisable = this.inputFields.length >= 10;
        }
    }

    handleClickCloseMenu(event) {
        const index = event.currentTarget.dataset.index;
        this.inputFields.splice(index, 1);
        this.inputFields = [...this.inputFields];
        this.quickReplyAddDisable = this.inputFields.length >= 10;
    }

    handleInputChange(event) {
        const index = event.currentTarget.dataset.index;
        const value = event.target.value;

        this.inputFields[index].value = value;
        this.inputFields = [...this.inputFields];
    }

   
}