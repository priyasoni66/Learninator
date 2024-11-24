import { LightningElement, track } from 'lwc';

export default class LWC0023 extends LightningElement {
    @track employees = [
        { name: 'Vaibhav', department: 'IT', role: 'Developer', email: 'vaibhav@gmail.com' },
        { name: 'Akshay', department: 'IT', role: 'Developer', email: 'akshay@gmail.com' },
        { name: 'Naval', department: 'HR', role: 'Manager', email: 'naval@gmail.com' },
        { name: 'Naksh', department: 'HR', role: 'Manager', email: 'naksh@gmail.com' },
        { name: 'Aman', department: 'Marketing', role: 'Designer', email: 'aman@gmail.com' },
        { name: 'Anubhav', department: 'Marketing', role: 'Designer', email: 'anubhav@gmail.com' },
    ];

    @track selectedDepartment = 'All'; 
    @track selectedRole = 'All';
    @track searchQuery = '';

    handleDepartmentChange(event) {
        this.selectedDepartment = event.target.value;
    }

    handleRoleChange(event) {
        this.selectedRole = event.target.value;
    }

    handleSearchInput(event) {
        this.searchQuery = event.target.value;
    }

    get employeesData() {
        let empdata = this.employees;

        if (this.selectedDepartment !== 'All') {
            empdata = empdata.filter(
                (employee) => employee.department === this.selectedDepartment
            );
        }

        if (this.selectedRole !== 'All') {
            empdata = empdata.filter(
                (employee) => employee.role === this.selectedRole
            );
        }

        if (this.searchQuery) {
            const query = this.searchQuery.toLowerCase();
            empdata = empdata.filter(
                (employee) => employee.name.toLowerCase().includes(query)
            );
        }

        return empdata.sort((a, b) =>
            a.department.localeCompare(b.department)
        );
    }
}