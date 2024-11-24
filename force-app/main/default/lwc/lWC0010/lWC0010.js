import { LightningElement, track } from 'lwc';
export default class LWC0010 extends LightningElement {
    @track products = [
        { name: 'Smartphone', category: 'Electronics', price: 25000, availability: true },
        { name: 'Laptop', category: 'Electronics', price: 65000, availability: false },
        { name: 'T-shirt', category: 'Clothing', price: 600, availability: true },
        { name: 'Jeans', category: 'Clothing', price: 1200, availability: true },
        { name: 'Apple', category: 'Groceries', price: 60, availability: true },
        { name: 'Milk', category: 'Groceries', price: 50, availability: false }
    ];

    @track selectedCategory = 'All';

    handleCategoryChange(event) {
        this.selectedCategory = event.target.value;
    }

    get productData() {
        if (this.selectedCategory === 'All') {
            return this.products;
        }
        return this.products.filter(
            (product) => product.category === this.selectedCategory
        );
    }
}