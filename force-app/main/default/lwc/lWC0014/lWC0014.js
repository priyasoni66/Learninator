import { LightningElement, track } from 'lwc';

export default class LWC0014 extends LightningElement {
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

    get productData() {
        let filteredProducts = this.products;

        if (this.selectedCategory !== 'All') {
            filteredProducts = filteredProducts.filter(
                (product) => product.category === this.selectedCategory
            );
        }

        if (this.searchQuery) {
            filteredProducts = filteredProducts.filter((product) =>
                product.name.toLowerCase().includes(this.searchQuery.toLowerCase())
            );
        }

        return filteredProducts.map(product => {
            return {
                id: product.id,
                name: product.name,
                category: product.category,
                price: product.price,
                availability: product.availability,
                availabilityText: product.availability ? 'In Stock' : 'Out of Stock'
            };
        });
    }

    get totalProducts() {
        return this.productData.length; 
    }
}