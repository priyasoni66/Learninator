import { LightningElement } from 'lwc';
import getHighRevenueAccountRecords from '@salesforce/apex/AccountController1.getHighRevenueAccountRecords';

export default class highRevenueAccount extends LightningElement {
    accountsToDisplay=[];
    countOfRecords = 5;

    connectedCallback(){
        getHighRevenueAccountRecords({count: this.countOfRecords}).then(response => {
            console.log('Response using imperative approach', response);
            this.accountsToDisplay = response;
        }).catch(error => {
            console.error('Error', error)
        })
    }

    setCount(event){
        console.log('Value', event.target.value);
        let inputValue = event.target.value;
        if(inputValue == '') return;
        this.countOfRecords = inputValue;
        this.connectedCallback();
        /*getHighRevenueAccountRecords({count: this.countOfRecords}).then(response => {
            console.log('Response using imperative approach', response);
            this.accountsToDisplay = response;
        }).catch(error => {
            console.error('Error', error)
        })*/
    }
}