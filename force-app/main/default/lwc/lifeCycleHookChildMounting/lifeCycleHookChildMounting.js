import { LightningElement } from 'lwc';

export default class LifeCycleHookChildMounting extends LightningElement {
    constructor(){
        super()
        console.log('Child Component Called')
    }
    
    connectedCallback(){
        console.log('Child connectedCallback Called') 
        throw new Error('Loading Of child Component is failed')
        
    }
    renderedCallback(){
        console.log('Child renderedCallback Called') 
    }
    disconnectedCallback(){
        alert('Child disconnected Clled !!')
        
    }
}