import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'
export default class Notifications extends LightningElement {
    toastHandler(){
      const evnt = new  ShowToastEvent({
        title: 'success!!',
        message:'Account Created',
        variant:'success'
       })
       this.dispatchEvent(evnt)
    }
    toastHandlerTwo(){
        const evt = new  ShowToastEvent({
            title: 'error!!',
            message:'Account Not Created',
            variant:'error'
           })
           this.dispatchEvent(evt)
    }
}