import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import createContact from '@salesforce/apex/LWC1002contacts.createContact';

export default class ContactForm extends LightningElement {
    @track name = '';
    @track email = '';
    @track phone = '';

    handleInputChange(event) {
        const field = event.target.name;
        if (field === 'name') {
            this.name = event.target.value;
        } else if (field === 'email') {
            this.email = event.target.value;
        } else if (field === 'phone') {
            this.phone = event.target.value;
        }
    }

    handleSubmit() {
        createContact({ name: this.name, email: this.email, phone: this.phone })
            .then((response) => {
                if (response.isSuccess) {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Success',
                            message: response.message,
                            variant: 'success',
                        })
                    );
                    this.name = '';
                    this.email = '';
                    this.phone = '';
                } else {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Error',
                            message: response.message,
                            variant: 'error',
                        })
                    );
                }
            })
            .catch((error) => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error',
                        message: 'Unexpected error: ' + error.body.message,
                        variant: 'error',
                    })
                );
            });
    }
}