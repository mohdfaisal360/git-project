import { LightningElement } from 'lwc';

export default class HelloquerySelector extends LightningElement {
    fetchDetailsHandler(){
        userList=["John","Nick","Tom","Jerry"]
        const elem = this.template.querySelector('h1')
        const userElem = this.template.querySelectorAll(".name")
        Array.from(userElem).forEach(item => {
            console.log(item.innerText)
        })
         
    }
}