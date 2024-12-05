import { LightningElement, track } from 'lwc';

export default class Lwc0071 extends LightningElement {
    @track projectData = {
        project: '',
        tasks: [],
    };
    
    @track newTask = {
        name: '',
        assignees: '',
        status: 'Not Started',
    };

    connectedCallback() {
        this.projectData = {
            "project": "Website Redesign",
            "tasks": [
                {
                    "id": 1,
                    "name": "Design Homepage",
                    "assignees": ["Alice", "Bob"],
                    "status": "Not stated",
                },
                {
                    "id": 2,
                    "name": "Developer Backend",
                    "assignees": ["Charlie"],
                    "status": "Not Started",
                },
            ],
        };
    }

    statusOptions = [
        { label: 'Not Started', value: 'Not Started' },
        { label: 'In Progress', value: 'In Progress' },
        { label: 'Completed', value: 'Completed' }
    ];

    
    handleInputChange(event) {
        const taskName = event.target.dataset.id;
        this.newTask[taskName] = event.target.value;
    }

    addTask() {
        const { name, assignees, status } = this.newTask;

        const newTask = {
            id: this.projectData.tasks.length + 1,
            name,
            assignees: assignees.split(',').map((assignee) => assignee),
            status,
        };

        this.projectData.tasks.push(newTask);

        this.newTask = {
            "name": '',
            "assignees": '',
            "status": 'Not Started',
        };
    }
}