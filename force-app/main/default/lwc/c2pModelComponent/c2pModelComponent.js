import { LightningElement } from 'lwc';

export default class C2pModelComponent extends LightningElement {
    closeHandler(){
        const myEvent = new CustomEvent('close', {
            bubbles:true,
            detail:"child close successfully"
        })
        this.dispatchEvent(myEvent)
    }
}