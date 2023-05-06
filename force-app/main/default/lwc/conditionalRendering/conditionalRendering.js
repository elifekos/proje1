import { LightningElement } from 'lwc';

export default class ConditionalRendering extends LightningElement {
    showContent = false;
    handleClick(event){
        this.showContent = true;
    }
}