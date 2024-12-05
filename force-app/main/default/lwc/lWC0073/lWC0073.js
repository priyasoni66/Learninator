import { LightningElement, track } from 'lwc';
export default class LWC0073 extends LightningElement {

    @track projectData = [];


    connectedCallback() {
        this.projectData = {
            "project": "Website Redesign",
            "tasks": [
                {
                    "id": 1,
                    "name": "Design Homepage",
                    "assignees": ["Alice", "Bob"],
                    "status": "In Progress"
                },
                {
                    "id": 2,
                    "name": "Develop Backend",
                    "assignees": ["Charlie"],
                    "status": "Not Started"
                },
            ],
        };
    }

    statusOptions = [
        { label: 'Not started', value: 'Not Started' },
        { label: 'In Progress', value: 'In Progress' },
        { label: 'completed', value: 'Completed' }
    ];


    handleInputAssigneeChange(event){
        this.newAssignee = event.target.value;
    }

    addAssignee(event){
        const taskId = event.target.dataset.id;
        const newAssignee = this.newAssignee.trim();

        const taskToUpdate = this.projectData.tasks.find(task => task.id === parseInt(taskId));
        if(taskToUpdate){
            if(!taskToUpdate.assignees.includes(newAssignee)){
                taskToUpdate.assignees.push(newAssignee);
                this.newAssignee = '';
            }
        }
    }

    removeAssignee(event){
        const taskId = event.target.dataset.id;
        const taskToUpdate = this.projectData.tasks.find(task => task.id === parseInt(taskId));

        if(taskToUpdate){
            const assigneeToRemove = prompt(
                'Enter assignee name to remove:', '').trim();
            if(assigneeToRemove && taskToUpdate.assignees.include(assigneeToRemove)){
                taskToUpdate.assignees !== taskToUpdate.assignees.filter(
                    assignee => assignee !== assigneeToRemove);
            }
        }
    }
}