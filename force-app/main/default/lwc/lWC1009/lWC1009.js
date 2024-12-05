import { LightningElement, track, wire } from 'lwc';
import getOpportunties from '@salesforce/apex/LWC1009.getOpportunties';

export default class OpportunityFilter extends LightningElement {
    @track startDate = '';
    @track endDate = '';
    @track columns = [
        { label: 'Opportunity Name', fieldName: 'Name', type: 'text' },
        { label: 'Close Date', fieldName: 'CloseDate', type: 'date' },
        { label: 'Amount', fieldName: 'Amount', type: 'currency' },
    ];

    get isDateRangeValid() {
        return this.startDate && this.endDate;
    }

    @wire(getOpportunties, { startDate: '$startDate', endDate: '$endDate' })
    opportunities;

    handleStartDateChange(event) {
        this.startDate = event.target.value;
    }

    handleEndDateChange(event) {
        this.endDate = event.target.value;
    }
}