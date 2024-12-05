import { LightningElement, track } from 'lwc';
export default class LWC0072 extends LightningElement {

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

    handleInputchange(event) {
        const taskId = event.target.dataset.id;
        this.newTask[taskId] = event.target.value;
    }

    handleStatusChange(event) {
        const taskId = event.target.dataset.id;
        const newStatus = event.target.value;

        const taskToUpdate = this.projectData.tasks.find(task => task.id === parseInt(taskId));
        if (taskToUpdate) {
            taskToUpdate.status = newStatus;
        }
    }
}