import { LightningElement } from 'lwc';
import { ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class App extends LightningElement {
  clickedButtonLabel;
  myTitle ="Hello Brother";
//first function
handleClick(){
    this.showToast(); //calling a  secound function  through first function
    window.alert("Hello World");
}
//second function
showToast(){
  const event = new ShowToastEvent({
    title:"Show Toast",
    message:"Everything is allright",
    variant:"success"
  })
  this.dispatchEvent(event)
}


handleEvent(event) {
    this.clickedButtonLabel = event.target.label;
}


}