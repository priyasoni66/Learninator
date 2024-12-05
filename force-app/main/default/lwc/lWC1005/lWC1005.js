import { LightningElement, wire, track } from 'lwc';
import getAccounts from '@salesforce/apex/LWC1005.getAccounts';
import deleteSelectedAccounts from '@salesforce/apex/LWC1005.deleteSelectedAccounts';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class BulkDeleteAccounts extends LightningElement {
    @track accounts = [];
    @track selectedAccountIds = [];

    @wire(getAccounts)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data.map(account => ({
                ...account,
                selected: false 
            }));
        } else if (error) {
            this.showToast('Error', 'Failed to fetch accounts', 'error');
        }
    }

    handleCheckboxChange(event) {
        const accountId = event.target.dataset.id;
        if (event.target.checked) {
            this.selectedAccountIds.push(accountId);
        } else {
            this.selectedAccountIds = this.selectedAccountIds.filter(id => id !== accountId);
        }
    }

    handleDelete() {
        if (this.selectedAccountIds.length === 0) {
            this.showToast('Warning', 'Please select at least one account to delete', 'warning');
            return;
        }

        deleteSelectedAccounts({ accountIds: this.selectedAccountIds })
            .then(() => {
                this.showToast('Success', 'Selected accounts deleted successfully', 'success');
                this.selectedAccountIds = [];
                return refreshApex(this.wiredAccounts);
            })
            .catch(error => {
                this.showToast('Error', error.body.message, 'error');
            });
    }

    showToast(title, message, variant) {
        this.dispatchEvent(new ShowToastEvent({ title, message, variant }));
    }
}