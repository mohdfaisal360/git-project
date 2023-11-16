import { LightningElement,api } from 'lwc';
import getAccountRating from '@salesforce/apex/RefrenceController.getAccountRating'
import {registerRefreshContainer, unregisterRefreshContainer} from 'lightning/refresh';

export default class RefreshContainer extends LightningElement {
   @api recordId;
   ratingValue;
   refreshContainerID

   connectedCallback(){
      //this.refreshContainerID = registerRefreshContainer(this,this.RefreshContainer) //(contextElement,providerMethod)
      //this.fetchingRating()
      console.log('Connected>>>'+this.fetchingRating())
   }
   // disconnectedCallback() {
   //    unregisterRefreshContainer(this.refreshContainerID);
   //  }
   // RefreshContainer(){
   //    return new Promise(resolve=>{
   //       console.log('relove>>'+resolve)
   //       this.fetchingRating()
   //       resolve(true)
   //    })
   // }
   

   fetchingRating(){
      getAccountRating({"accountId":this.recordId}).then(Response=>{
         console.log('value>>>'+JSON.stringify(Response))
         this.ratingValue = Response[0].Rating
      }).catch(error=>{
         console.eroor('I can Do it')
      })
   }
}