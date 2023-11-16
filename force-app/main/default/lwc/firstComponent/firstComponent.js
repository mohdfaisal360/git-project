import { LightningElement,track } from 'lwc';

export default class FirstComponent extends LightningElement {
    ////////// @track method ////////
    fullName="Salesforce Keeda"
    title="aura"

    changeHandler(event){
        this.title = event.target.value
    }
    @track address={
        City:"Meerut",
        PostalCode:250002,
        Country:"India"
    }
    trackCity(event){
        this.address.City = event.target.value
        
    }
    trackCountry(event){
        this.address.Country = event.target.value
    }

    //// Getter Method /////////
    users =["ataf","sanidhiya","vansh"]
    num1=13
    num2=35

    get firstUser (){
        return this.users[0]
    }
    get multiply(){
        return this.num1 * this.num2
    }
    ////// Directive \\\\\\\\\
    isVisible=false
    name
    handleClick(){
        this.isVisible = true 
    }
    changeHandler(event){
        this.name=event.target.value
    }
    get helloMethod(){
       return this.name==="hello"
    }
    ////////   Template looping    \\\\\\\\\
    ////// for:each \\\\\
    carList =["Ford","Audi","Bmw","Porche","chervolet"]

   ////////// iterator loop \\\\\\\\\
   ceoList =[
   {
    id:1,
    company:"google",
    ceoName:"Sundar Pichai"
   },
   {
    id:2,
    company:"facebook",
    ceoName:"Mark Zukrberg"
   },
   {
    id:23,
    company:"Apple",
    ceoName:"Tim Cook"
   },
   {
    id:4,
    company:"SpaceX",
    ceoName:"Elon Musk"
   }
]
    
}