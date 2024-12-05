import { LightningElement, wire, track } from 'lwc';
import getAccounts from '@salesforce/apex/LWC1001Accounts.getAccounts';
export default class LWC1001 extends LightningElement {
    accountsToDisplay = []
    @track searchKey = ''; 
    @track filteredAccounts = this.accountsToDisplay;
    
    @wire(getAccounts, {searchKey: '$searchKey'})
    getAccountHandler(response){
        const{data, error} = response;
        if(error){
            console.log(error);
            return;
        }
        if(data){
            this.accountsToDisplay = data;
            return;
        }
    }
    handleSearch(event) {
        this.searchKey = event.target.value;
    } 
}