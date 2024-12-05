import { LightningElement, track } from 'lwc';

export default class TackAndArray2 extends LightningElement {
    @track contactData = {
        salutation: 'Ms.',
        firstName: 'Priya',
        lastName: 'Soni',
        accountName: 'Demo Account',
        title: 'CEO',
        department: 'Manufacturing',
        birthdate: '2000-12-12',
        contactName: 'jkl',
        reportTo: 'David',
        leadSource: 'Web',
        status: 'Completed',
        usage: 'abc',
        phone: '97986868089',
        mobile: '90097987877',
        email: 'priya@gmail.com',
        assistant: 'xyz',
        assistantPhone: '9898987238'
    };

    @track contactData1 = {
        salutation: 'Mr.',
        firstName: 'Anay',
        lastName: 'Sharma',
        accountName: 'Demo Account',
        title: 'CEO',
        department: 'Manufacturing',
        birthdate: '2000-12-12',
        contactName: 'jkl',
        reportTo: 'David',
        leadSource: 'Web',
        status: 'Completed',
        usage: 'abc',
        phone: '97986868089',
        mobile: '90097987877',
        email: 'anay@gmail.com',
        assistant: 'xyz',
        assistantPhone: '9898987238'
    };

    salutations = [
        { label: 'Ms.', value: 'Ms.' },
        { label: 'Mr.', value: 'Mr.' },
        { label: 'Mrs.', value: 'Mrs.' },
    ];

    leadSources = [
        { label: 'Web', value: 'Web' },
        { label: 'Email', value: 'Email' },
        { label: 'Phone', value: 'Phone' },
    ];

    handleChangeContactInfo() {
        this.contactData = { ...this.contactData1 }; 
    }

    handleInputChange(event) {
        const fieldName = event.target.name;
        const isContactData1 = event.target.dataset.contact === 'contactData1';

        if (isContactData1) {
            this.contactData1[fieldName] = event.target.value;
        } else {
            this.contactData[fieldName] = event.target.value;
        }
    }

    sortContacts() {
    const sortedContacts = [this.contactData, this.contactData1].sort((a, b) => {
        if (a.firstName === 'Anay') {
            return -1;
        }
        if (b.firstName === 'Anay') {
            return 1;
        }

        if (a.firstName < b.firstName){
            return -1;
        }
        if (a.firstName > b.firstName) {
            return 1;
        }
        return 0;
    });

    this.contactData = sortedContacts[0];
    this.contactData1 = sortedContacts[1];
    }
}