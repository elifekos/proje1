import { LightningElement } from 'lwc';

export default class TwoWayBinding extends LightningElement {
    studentName;
    age;
    changeHandler(event){
        this.studentName = event.target.value;// event: onchange, target inputu gosteriyor, value name i gosterir
    }
    ageHandler(event){
        this.age = event.target.value;// event: onchange, target inputu gosteriyor, value age i gosterir
    }
    //Object
    batch = {
        batchName : "Batch 13",
        batchSize : 70
    }
    batchNameHandler(event){
        this.batch.batchName = event.target.value;
    }
} 