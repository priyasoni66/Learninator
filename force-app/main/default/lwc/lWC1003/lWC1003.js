import { LightningElement, wire, track } from 'lwc';
import getAccounts from '@salesforce/apex/LWC1003.getAccounts';
import getContacts from '@salesforce/apex/LWC1003.getContacts';
import getOpportunities from '@salesforce/apex/LWC1003.getOpportunities';

export default class LWC1001 extends LightningElement {
    @track accountsToDisplay = [];
    @track relatedContacts = [];
    @track relatedOpportunities = [];
    searchKey = '';

    @wire(getAccounts)
    getAccountHandler({ data, error }) {
        if (error) {
            console.error('Error fetching accounts:', error);
        } else if (data) {
            this.accountsToDisplay = data;
        }
    }

    handleContactsClick() {
        if (this.accountsToDisplay.length === 0) {
            console.error('No accounts available to fetch contacts.');
            return;
        }

        const accountIds = this.accountsToDisplay.map(account => account.Id);
        getContacts({ accountIds })
            .then(result => {
                this.relatedContacts = result;
            })
            .catch(error => {
                console.error('Error fetching contacts:', error);
            });
    }

    handleOpportunitiesClick() {
        if (this.accountsToDisplay.length === 0) {
            console.error('No accounts available to fetch opportunities.');
            return;
        }

        const accountIds = this.accountsToDisplay.map(account => account.Id);
        getOpportunities({ accountIds })
            .then(result => {
                this.relatedOpportunities = result;
            })
            .catch(error => {
                console.error('Error fetching opportunities:', error);
            });
    }
}