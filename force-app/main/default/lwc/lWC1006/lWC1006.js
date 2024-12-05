import { LightningElement, track, wire } from 'lwc';
import fetchTasks from '@salesforce/apex/LWC1006.fetchTasks';
import updateTaskStatus from '@salesforce/apex/LWC1006.updateTaskStatus';

export default class TaskList extends LightningElement {
    @track tasks = [];
    @track error;

    @wire(fetchTasks)
    loadTasks({ data, error }) {
        if (data) {
            this.tasks = data.map(task => ({
                ...task,
                isCompleted: task.Status === 'Completed',
                style: `color: ${task.Status === 'Completed' ? 'green' : 'red'};`
            }));
        } else if (error) {
            this.error = error;
            this.tasks = [];
        }
    }

    handleStatusChange(event) {
        const taskId = event.target.dataset.id;
        const isCompleted = event.target.checked;
        const newStatus = isCompleted ? 'Completed' : 'Not Started';

        updateTaskStatus({ taskId, status: newStatus })
            .then(() => {
                this.tasks = this.tasks.map(task => {
                    if (task.Id === taskId) {
                        return {
                            ...task,
                            Status: newStatus,
                            isCompleted,
                            style: `color: ${isCompleted ? 'green' : 'red'};`
                        };
                    }
                    return task;
                });
            })
            .catch(error => {
                this.error = error;
                console.error('Error updating task status:', error);
            });
    }
}