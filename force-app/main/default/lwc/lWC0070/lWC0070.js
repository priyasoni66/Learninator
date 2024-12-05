import { LightningElement, track } from 'lwc';

export default class Lwc0070 extends LightningElement {
    @track projectData = [];
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

    // 74

    toggleTaskDetails(event) {
        const taskId = event.target.dataset.id;
        const taskToToggle = this.projectData.tasks.find(task => task.id === parseInt(taskId));
        if (taskToToggle) {
            taskToToggle.expanded = !taskToToggle.expanded;
            this.projectData.tasks.push(newTask);
        }
    }

    handleInputChange(event) {
        const taskName = event.target.dataset.id;
        this.newTask[taskName] = event.target.value;
    }

    // 72

    handleStatusChange(event) {
        const taskId = event.target.dataset.id;
        const newStatus = event.target.value;

        const taskToUpdate = this.projectData.tasks.find(task => task.id === parseInt(taskId));
        if (taskToUpdate) {
            taskToUpdate.status = newStatus;
        }
    }

    handleAssigneeInputChange(event) {
        this.newAssignee = event.target.value;
    }

    // 73

    addAssignee(event) {
        const taskId = event.target.dataset.id;
        const newAssignee = this.newAssignee.trim();

        const taskToUpdate = this.projectData.tasks.find(task => task.id === parseInt(taskId));
        if (taskToUpdate) {
            if (!taskToUpdate.assignees.includes(newAssignee)) {
                taskToUpdate.assignees.push(newAssignee);
                this.newAssignee = '';
            } else {
                alert('Assignee already exists for this task.');
            }
        }
    }

    removeAssignee(event) {
        const taskId = event.target.dataset.id;
        const taskToUpdate = this.projectData.tasks.find(task => task.id === parseInt(taskId));

        if (taskToUpdate) {
            const assigneeToRemove = prompt(
                'Enter assignee name to remove:',
                ''
            ).trim();

            if (assigneeToRemove && taskToUpdate.assignees.includes(assigneeToRemove)) {
                taskToUpdate.assignees = taskToUpdate.assignees.filter(
                    assignee => assignee !== assigneeToRemove
                );
            } else {
                alert('Assignee not found or invalid name.');
            }
        }
    }

    // 71

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