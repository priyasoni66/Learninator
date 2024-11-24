import { LightningElement, track } from 'lwc';
export default class detailsCard extends LightningElement {
    @track titleStr = 'Contact Information';
    @track firstName = 'Amit';
    @track lastName = 'Soni';
    @track email = 'amitsoni@gmail.com'; 

    @track showAddress = 'Show Address';
    @track showPhone = 'Show Phone';
    @track hideEmail = true;

    handleClick(event) {
        const buttonTitle = event.target.title;

        switch (buttonTitle) {
            case 'Show Address':
                this.showAlert('Ajmer, Rajasthan');
                break;

            case 'Show Phone':
                this.showAlert('9256789003');
                break;

            default:
                console.error('Unhandled action:', buttonTitle);
        }
    }

    toggleHideEmail(){
        /*if(!this.hideEmail){
            this.hideEmail = true;
        }else{
            this.hideEmail = false;
        }*/
        this.hideEmail = !this.hideEmail;
    }

    showAlert(message) {
        
        alert(message);
    }
}