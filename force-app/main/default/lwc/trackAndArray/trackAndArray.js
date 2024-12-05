/* import { LightningElement, track } from 'lwc';

export default class TrackAndArray extends LightningElement {
    @track contactObjList = [];

    handleClick() {
        this.contactObjList.splice(1, 1); 
    }

    connectedCallback() {
        let contactObj1 = {
            firstName: 'Aman',
            lastName: 'Verma',
            title: 'CEO',
            mobileNumber: '6978986973'
        };

        this.contactObjList.push(contactObj1);

        let contactObj2 = {
            firstName: 'Naman',
            lastName: 'Sharma',
            title: 'Assistant',
            mobileNumber: '9837384684'
        };

        this.contactObjList.push(contactObj2);

        let contactObj3 = {
            firstName: 'Kajal',
            lastName: 'Bhatt',
            title: 'Manager',
            mobileNumber: '9898384684'
        };

        this.contactObjList.push(contactObj3);
    }
}
*/

import { LightningElement, track } from 'lwc';

export default class TrackAndArray extends LightningElement {
    @track contactObjList = [];

    @track isSecondRecordHidden = false;

    handleClick() {
        this.isSecondRecordHidden = !this.isSecondRecordHidden;
    }

    connectedCallback() {
        let contactObj1 = {
            firstName: 'Aman',
            lastName: 'Verma',
            title: 'CEO',
            mobileNumber: '6978986973'
        };
        this.contactObjList.push(contactObj1);

        let contactObj2 = {
            firstName: 'Naman',
            lastName: 'Sharma',
            title: 'Assistant',
            mobileNumber: '9837384684'
        };
        this.contactObjList.push(contactObj2);

        let contactObj3 = {
            firstName: 'Kajal',
            lastName: 'Bhatt',
            title: 'Manager',
            mobileNumber: '9898384684'
        };
        this.contactObjList.push(contactObj3);
    }

    get visibleContactList() {
    if (this.isSecondRecordHidden) {
        return this.contactObjList.filter((_, index) => index !== 1);
    } else {
        return this.contactObjList;
    }
}

}