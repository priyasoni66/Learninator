import { LightningElement, track, wire } from 'lwc';
import getOpportunities from '@salesforce/apex/LWC1004.getOpportunities';
import updateOpportunities from '@salesforce/apex/LWC1004.updateOpportunities';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class OpportunityTable extends LightningElement {
    @track data = [];
    @track draftValues = [];

    @wire(getOpportunities)
    wiredOpportunities({ data, error }) {
        if (data) {
            this.data = data;
        } else if (error) {
            this.showToast('Error', 'Error fetching opportunities', 'error');
        }
    }
    columns = [
        { label: 'Name', fieldName: 'Name' },
        { label: 'Stage', fieldName: 'StageName', editable: true },
        { label: 'Amount', fieldName: 'Amount', type: 'currency', editable: true }
    ];

    /* handleSave(event) {
        const updatedFields = event.detail.draftValues;
        updateOpportunities({ opportunities: updatedFields })
            .then(() => {
                this.showToast('Success', 'Records updated successfully', 'success');
                this.draftValues = [];
                return refreshApex(this.wiredOpportunities); 
            })
            .catch((error) => {
                this.showToast('Error', 'Error updating records', 'error');
            });
    } */

    
    async handleSave(event) {
        try {
            await updateOpportunities({ opportunities: event.detail.draftValues });
            this.showToast('Success', 'Records updated successfully', 'success');
            this.draftValues = [];
            await refreshApex(this.wiredOpportunities);
        } catch (error) {
            this.showToast('Error', 'Error updating records', 'error');
        }
    }


    showToast(title, message, variant) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message,
                variant: variant
            })
        );
    }
}