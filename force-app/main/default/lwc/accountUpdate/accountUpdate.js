import { LightningElement, wire, track, api } from 'lwc';
import { getRecord, notifyRecordUpdateAvailable,getFieldValue } from 'lightning/uiRecordApi';
import updateAccountName from '@salesforce/apex/AccountController.updateAccountName';
import ACCOUNT_NAME from "@salesforce/schema/Account.Name";
import ACCOUNT_DESCRIPTION from "@salesforce/schema/Account.Description";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AccountUpdate extends LightningElement {
    @api recordId;
    name;
    description;
   // isLoaded = false;
    @wire( getRecord, {
        recordId: '$recordId',
        fields: [ ACCOUNT_NAME, ACCOUNT_DESCRIPTION ]
    } )
    wiredRecord( { error, data } ) {
        if ( error ) {

            console.log(
                'Inside error block'
            );
            let message = 'Unknown error';

            if ( Array.isArray( error.body ) ) {

                message = error.body.map(e => e.message).join(', ');

            } else if ( typeof error.body.message === 'string' ) {

                message = error.body.message;

            }
            this.dispatchEvent(
                new ShowToastEvent( {
                    title: 'Some error occurred',
                    message,
                    variant: 'error',
                } ),
            );
        } else if ( data ) {
            console.log(
                'Data is',
                JSON.stringify( 
                    data
                )
            );
            this.name = getFieldValue( 
                data, 
                ACCOUNT_NAME 
            );
            this.description = getFieldValue( 
                data, 
                ACCOUNT_DESCRIPTION
            );
        }
    }
    async updateAccountRecord() {

       // this.isLoaded = true; 
        await updateAccount( 
            { strRecordId : this.recordId }
        );
        await notifyRecordUpdateAvailable( 
            [ { recordId: this.recordId } ] 
        );
        //this.isLoaded = false;

    }

}