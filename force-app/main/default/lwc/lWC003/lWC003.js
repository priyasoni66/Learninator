import { LightningElement, track } from 'lwc';

export default class LWC003 extends LightningElement {
    @track contact = [];

    connectedCallback() {
        this.contact.push({
            "id": 1,
            "name": "John Doe",
            "role": "Developer"
        });

        this.contact.push({
            "id": 2,
            "name": "Jane Smith",
            "role": "Designer"
        });

        this.contact.push({
            "id": 3,
            "name": "Mike Brown",
            "role": "Manager"
        });
    }

    deleteRow(event) {
        const idToDelete = event.target.dataset.id;
        this.contact = this.contact.filter(item => item.id !== parseInt(idToDelete, 10));
    }

    addRow() {
        const newRow = { id: this.contact.length + 1, name: "New Person", role: "New Role" };
        this.contact.push(newRow);    
    }
}