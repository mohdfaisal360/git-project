import { LightningElement, track } from 'lwc';

export default class MyComponent extends LightningElement {
    @track dataArray = []; // Your initial array with length <= 10

    addRow() {
         
        for (let i = 0; i < this.dataArray.length < 10; i++) {
            this.dataArray.push({ id: Date.now(), value: '' });
        }
        this.dataArray = [...this.dataArray];
    }

    removeRow(event) {
        const index = event.currentTarget.dataset.index;
        this.dataArray.splice(index, 1);
        this.dataArray = [...this.dataArray];
    }

    handleInputChange(event) {
        const index = event.currentTarget.dataset.index;
        const value = event.target.value;

        this.dataArray[index].value = value;
        this.dataArray = [...this.dataArray];
    }
}