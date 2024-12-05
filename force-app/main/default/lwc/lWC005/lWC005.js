import { LightningElement, track } from 'lwc';
export default class JsonTransformer extends LightningElement {

    @track taskList = []; 
    @track selectedFilter = '';

    connectedCallback() {
        this.taskList.push(
            { id: 1, name: 'Task A', status: 'Incomplete' },
            { id: 2, name: 'Task B', status: 'Complete' }
        );
    }

    filterOptions = [
        { label: 'All', value: '' },
        { label: 'Complete', value: 'Complete' },
        { label: 'Incomplete', value: 'Incomplete' }
    ];

    get filteredTasks() {
        if (!this.selectedFilter) {
            return this.taskList; 
        }
        return this.taskList.filter(task => task.status === this.selectedFilter); 
    }

    handleFilterChange(event) {
        this.selectedFilter = event.detail.value;
    }

    handleToggleStatus(event) {
        const taskId = parseInt(event.target.dataset.id, 10);
        this.taskList = this.taskList.map(task => {
            if (task.id === taskId) {
                return {
                    ...task,
                    status: task.status === 'Complete' ? 'Incomplete' : 'Complete'
                };
            }
            return task;
        });
    }
}