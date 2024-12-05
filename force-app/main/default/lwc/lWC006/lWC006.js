import { LightningElement, track } from 'lwc';

export default class LWC006 extends LightningElement {
    @track showNumbers = true; 
    @track filteredData = [];
    @track totalSum = 0;

    data = [
        { type: 'number', value: 10 },
        { type: 'string', value: 'Hello' },
        { type: 'number', value: 20 },
        { type: 'string', value: 'World' }
    ];

    connectedCallback() {
        this.filterData();
    }

    handleToggleChange(event) {
        this.showNumbers = event.target.checked;
        this.filterData();
    }

    filterData() {
        if (this.showNumbers) {
            const numbers = this.data.filter(item => item.type === 'number');
            this.filteredData = numbers;
            this.totalSum = numbers.reduce((sum, item) => sum + item.value, 0);
        } else {
            this.filteredData = this.data.filter(item => item.type === 'string');
        }
    }
}