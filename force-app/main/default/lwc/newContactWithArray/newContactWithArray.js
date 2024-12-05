import { LightningElement, track } from 'lwc';

export default class TrackAndArrayLoop extends LightningElement {
    @track contacts = [
        {
            id: 1,
            firstName: 'Priya',
            lastName: 'Soni',
            title: 'CEO',
            department: 'Manufacturing',
            status: 'Completed',
            usage: 'abc',
            phone: '97986868089',
            mobile: '90097987877',
            email: 'priya@gmail.com',
            assistant: 'xyz',
            assistantPhone: '9898987238',
        },
        {
            id: 2,
            firstName: 'Samar',
            lastName: 'Sharma',
            title: 'CEO',
            department: 'Manufacturing',
            status: 'Completed',
            usage: 'abc',
            phone: '97986868089',
            mobile: '90097987877',
            email: 'samar@gmail.com',
            assistant: 'xyz',
            assistantPhone: '9898987238',
            
        },

        {
            id: 3,
            firstName: 'Anay',
            lastName: 'Sharma',
            title: 'CEO',
            department: 'Manufacturing',
            status: 'Completed',
            usage: 'abc',
            phone: '97986868089',
            mobile: '90097987877',
            email: 'anay@gmail.com',
            assistant: 'xyz',
            assistantPhone: '9898987238',
            
        },
    ];

    handleInputChange(event) {
        const fieldName = event.target.name;
        const contactId = event.target.dataset.id;

        this.contacts = this.contacts.map((contact) => {
        if (contact.id === parseInt(contactId, 10)) {
            contact[fieldName] = event.target.value;  
        }
        return contact;  
    });
    }

    sortContacts() {
        this.contacts.sort((a, b) => {
            if (a.firstName < b.firstName) {
                return -1;
            }
            if (a.firstName > b.firstName) {
                return 1;
            }
            return 0;
        });
    }
}