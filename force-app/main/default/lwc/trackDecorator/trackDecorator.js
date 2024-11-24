import { LightningElement, track} from 'lwc';
export default class TrackDecorator extends LightningElement {


    @track firstNames = new Array();
    @track lastNames = ['Singh', 'Sharma', 'Bhati'];
    @track names = [];

    connectedCallback() {
        this.firstName = 'Priya';
        this.firstNames.push('Pranav');
        this.firstNames.push('Riya');
        this.firstNames.push('Isha');

        this.checkArrayBehaviour();
    }

    checkArrayBehaviour(){
        for(var i = 0; i < this.firstNames.length; i++){
            console.log(this.firstNames[i]);
            console.log(this.lastNames[i]);

            this.names.push(this.firstNames[i] + ' ' + this.lastNames[i]);
        }
        /*const numbers = [6, 44, 12, 4];
        numbers.forEach (myFunction);

        function myFunction(item){
            sum = sum + item;
        }*/

        this.names.forEach((name) => {
            console.log(name);
        });
    }
}




/*import { LightningElement, track } from 'lwc';

export default class TrackDecorator extends LightningElement {
    @track firstNames = [];
    @track lastNames = ['Singh', 'Sharma', 'Bhati'];
    @track names = []; 

    connectedCallback() {
        this.firstNames.push('Pranav', 'Riya', 'Isha'); // Add all names at once.
        this.checkArrayBehaviour();
    }

    checkArrayBehaviour() {
        for (let i = 0; i < this.firstNames.length; i++) {
            if (i < this.lastNames.length) { // Ensure indexes are within bounds.
                this.names.push(`${this.firstNames[i]} ${this.lastNames[i]}`);
            } else {
                console.log(`No matching last name for ${this.firstNames[i]}`);
            }
        }

        this.names.forEach((name) => {
            console.log(name);
        });
    }
}*/