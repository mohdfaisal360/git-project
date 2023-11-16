import { LightningElement } from 'lwc';

export default class LifeCycleHookMounting extends LightningElement {
    IsChildVisible=false
    constructor(){
        super()
        console.log('Parent Component Called')
    }
    connectedCallback(){
        console.log('Parent connectedCallback Called') 
    }
    renderedCallback(){
        console.log('Parent renderedCallback Called') 
    }
    handleClick(){
        this.IsChildVisible = !this.IsChildVisible
    }
    errorCallback(error,stack){
        console.log(error.message)
        console.log(stack)
    }
}