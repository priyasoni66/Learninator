import { LightningElement } from 'lwc';
import uploadFile from '@salesforce/apex/LWC1007.uploadFile';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class FileUpload extends LightningElement {
    contactId = '';
    isSuccess = false;
    errorMessage = '';

    handleContactIdChange(event) {
        this.contactId = event.target.value;
    }

    handleUploadFinished(event) {
        const uploadedFiles = event.detail.files;
        const fileName = uploadedFiles[0].name;
        const fileBody = uploadedFiles[0].documentId;

        uploadFile({ contactId: this.contactId, fileName, fileBody })
            .then(result => {
                if (result === 'Success') {
                    this.isSuccess = true;
                    this.showToast('Success', 'File uploaded successfully.', 'success');
                }
            })
            .catch(error => {
                this.errorMessage = error.body.message;
                this.showToast('Error', this.errorMessage, 'error');
            });
    }

    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title,
            message,
            variant,
        });
        this.dispatchEvent(event);
    }
}