import { LightningElement, track } from 'lwc';
export default class LWC0020 extends LightningElement {

    @track employees = [
        {name: 'Vaibhav', department: 'IT', role: 'Developer', email: 'vaibhav@gmail.com'},
        {name: 'Akshay', department: 'IT', role: 'Developer', email: 'akshay@gmail.com'},
        {name: 'Naval', department: 'HR', role: 'Manager', email: 'naval@gmail.com'},
        {name: 'Naksh', department: 'HR', role: 'Manager', email: 'naksh@gmail.com'},
        {name: 'Aman', department: 'Marketing', role: 'Designer', email: 'aman@gmail.com'},
        {name: 'Anubhav', department: 'Marketing', role: 'Designer', email: 'anubhav@gmail.com'}
    ];

    @track selectedDepartment = 'All';
    @track selectedRole = 'All';

    handleDepartmentChange(event){
    this.selectedCategory = event.target.value;
    }


    handleRoleChange(event) {
        this.selectedRole = event.target.value;
    }

    get filteredEmployees() {
        return this.employees.filter((employee) => {
            const matchesDepartment = 
                this.selectedDepartment === 'All' || 
                employee.department === this.selectedDepartment;

            const matchesRole = 
                this.selectedRole === 'All' || 
                employee.role === this.selectedRole;

            return matchesDepartment && matchesRole;
        });
    }
}