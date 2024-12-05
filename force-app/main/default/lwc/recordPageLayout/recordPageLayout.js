import { LightningElement, track, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getContacts from '@salesforce/apex/recordPageLayout.getContacts';
import getContactCount from '@salesforce/apex/recordPageLayout.getContactCount';
import deleteContacts from '@salesforce/apex/recordPageLayout.deleteContacts';

export default class RecordPageLayout extends LightningElement {
    @track contacts = { data: [], error: null };
    @track columns = [
        { label: 'Name', fieldName: 'Name', type: 'text' },
        { label: 'Email', fieldName: 'Email', type: 'email' },
        { label: 'Phone', fieldName: 'Phone', type: 'phone' },
        { label: 'Account Name', fieldName: 'Account.Name', type: 'text' }
    ];

    @track totalContacts = 0;
    @track offset = 0;
    limit = 10;
    selectedRows = [];

    @wire(getContactCount)
    wiredContactCount({ error, data }) {
        if (data) {
            this.totalContacts = data;
        } else if (error) {
            this.contacts.error = error.body.message;
        }
    }

    fetchContacts() {
        getContacts({ limitSize: this.limit, offsetSize: this.offset })
            .then(data => {
                this.contacts = { data, error: null };
            })
            .catch(error => {
                this.contacts = { data: null, error: error.body.message };
            });
    }

    connectedCallback() {
        this.fetchContacts();
    }

    handleAddNew() {
        window.open('/lightning/o/Contact/new', '_blank');
    }

    handleDeleteSelected() {
        if (this.selectedRows.length === 0) {
            this.showToast('Error', 'No contacts selected for deletion.', 'error');
            return;
        }

        deleteContacts({ contactIds: this.selectedRows })
            .then(() => {
                this.showToast('Success', 'Selected contacts were deleted.', 'success');
                this.selectedRows = []; 
                this.fetchContacts();
            })
            .catch(error => {
                this.showToast('Error', error.body.message, 'error');
            });
    }

    handlePrevious() {
        if (this.offset > 0) {
            this.offset = this.offset - this.limit;
            this.fetchContacts();
        }
    }

    handleNext() {
        if (this.offset + this.limit < this.totalContacts) {
            this.offset = this.offset + this.limit;
            this.fetchContacts();
        }
    }

    handleRowSelection(event) {
        this.selectedRows = event.detail.selectedRows.map(row => row.Id);
    }

    showToast(title, message, variant) {
        const evt = new ShowToastEvent({ title, message, variant });
        this.dispatchEvent(evt);
    }

    get isPreviousDisabled() {
        return this.offset === 0;
    }

    get isNextDisabled() {
        return this.offset + this.limit >= this.totalContacts;
    }
}