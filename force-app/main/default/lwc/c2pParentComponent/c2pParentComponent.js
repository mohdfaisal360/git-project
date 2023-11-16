import { LightningElement } from 'lwc';

export default class C2pParentComponent extends LightningElement {
    ShowModal = false
    msg
    clickHandler(){
        this.ShowModal = true
    }
    closeHandler(event){
        
        this.msg = event.detail
        this.ShowModal = false
    }
    footerHandler(){
        console.log("footer Handler Called")
    }
}