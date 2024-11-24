import { LightningElement, track } from 'lwc';

export default class LWC0013 extends LightningElement {
    @track products = [
        { name: 'Smartphone', category: 'Electronics', price: 25000, availability: true },
        { name: 'Laptop', category: 'Electronics', price: 65000, availability: false },
        { name: 'T-shirt', category: 'Clothing', price: 600, availability: true },
        { name: 'Jeans', category: 'Clothing', price: 1200, availability: true },
        { name: 'Apple', category: 'Groceries', price: 60, availability: true },
        { name: 'Milk', category: 'Groceries', price: 50, availability: false }
    ];

    @track selectedCategory = 'All';
    @track searchQuery = ''; 

    handleCategoryChange(event) {
        this.selectedCategory = event.target.value;
    }

    handleSearchInput(event) {
        this.searchQuery = event.target.value; 
    }

    get filteredProducts() {
        let filtered = this.selectedCategory === 'All' 
            ? this.products 
            : this.products.filter((product) => product.category === this.selectedCategory);

        if (this.searchQuery) {
            filtered = filtered.filter((product) => 
                product.name.toLowerCase().includes(this.searchQuery.toLowerCase())
            );
        }

        
        return filtered.map(product => ({
            ...product,
            availabilityText: product.availability ? 'In Stock' : 'Out of Stock'
        }));
    }
}