import { LightningElement, api } from 'lwc';

export default class SubwindowButtonLWC extends LightningElement {
    @api recordId; // Id of the object record

    handleClick() {
        // Get the record Id of the current record
        const recordId = this.recordId;

        // Form the URL for the subwindow using the record Id
        const subwindowUrl = window.location.origin + '/lightning/r/ObjectApiName/' + recordId + '/view';

        // Open the subwindow
        window.open(subwindowUrl, '_blank', 'width=600,height=400');
    }
}