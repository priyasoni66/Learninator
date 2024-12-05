import { LightningElement, track } from 'lwc';

export default class LWC004 extends LightningElement {
    team = 'Salesforce Dev';

    @track teamMembers = [
        { name: 'Alice', skills: ['Apex', 'LWC'] },
        { name: 'Bob', skills: ['Mulesoft', 'Integration'] },
    ];

    @track newSkills = {};

    handleInputChange(event) {
        const memberName = event.target.dataset.name;
        const skill = event.target.value;
        this.newSkills[memberName] = skill;
    }

    addSkill(event) {
        const memberName = event.target.dataset.name;
        const skillToAdd = this.newSkills[memberName];

        if (skillToAdd) {
            for (let member of this.teamMembers) {
                if (member.name === memberName) {
                    member.skills.push(skillToAdd);
                    break;
                }
            }
            this.newSkills[memberName] = '';
            this.teamMembers = this.teamMembers;
        }
    }
}