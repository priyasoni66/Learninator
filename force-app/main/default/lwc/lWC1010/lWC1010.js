import { LightningElement, wire } from 'lwc';
import getEvents from '@salesforce/apex/LWC1010.getEvents';

const columns = [
    { label: 'Event Name', fieldName: 'Subject' },
    { label: 'Date', fieldName: 'StartDateTime', type: 'date', typeAttributes: { year: 'numeric', month: '2-digit', day: '2-digit' }},
    { label: 'Organizer', fieldName: 'Owner.Name' }
];

export default class EventsTable extends LightningElement {
    events;
    error;
    columns = columns;

    @wire(getEvents)
    wiredEvents({ data, error }) {
        if (data) {
            this.events = data;
        } else if (error) {
            this.error = 'Error fetching events: ' + error.body.message;
        }
    }
}