import { LightningElement } from 'lwc';
import createEvent from '@salesforce/apex/LWC1008.createEvent';

export default class EventForm extends LightningElement {
    subject = '';
    startDate = '';
    endDate = '';
    successMessage = '';
    errorMessage = '';
    eventDate = '';

    handleInputChange(event){
        const field = event.target.dataset.id;
        if(field === 'subject') {
            this.subject = event.target.value;
        } else if (field === 'startDate') {
            this.starDate = event.target.value;
        } else if (field === 'endDate') {
            this.endDate = event.target.value;
        }
    }

    handleSave() {
        createEvent({ startDate: this.startDate, endDate: this.endDate, subject: this.subject })
            .then(result => {
                this.successMessage = true;
                this.eventDate = this.startDate;
                this.errorMessage = '';
            })
            .catch(error => {
                this.errorMessage = error.body.message;
                this.successMessage = false;
            });
    }
}