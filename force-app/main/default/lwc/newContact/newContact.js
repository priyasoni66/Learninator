import { LightningElement } from 'lwc';
import kindLogo from '@salesforce/resourceUrl/KindLogo'; 

export default class NewContact extends LightningElement {
    selectedValue = ''; 
    logoUrl = kindLogo;


salutations = [
        { label: 'Ms.', value: 'Ms.' },
        { label: 'Mr.', value: 'Mr.' },
        { label: 'Mrs.', value: 'Mrs.' }
    ];

    handleChange(event) {
        this.selectedValue = event.target.value;
        console.log('Selected Level:', this.selectedValue);
    }

    leadSources = [
        { label: 'Web', value: 'Web' },
        { label: 'Email', value: 'Email' },
        { label: 'Phone', value: 'Phone' }
    ];

    handleChange(event) {
        this.selectedValue = event.target.value;
        console.log('Selected Level:', this.selectedValue);
    }


    levelOptions = [
        { label: 'Beginner', value: 'Beginner' },
        { label: 'Intermediate', value: 'Intermediate' },
        { label: 'Advanced', value: 'Advanced' }
    ];

    handleChange(event) {
        this.selectedValue = event.target.value;
        console.log('Selected Level:', this.selectedValue);
    }


     
}