import { LightningElement } from 'lwc';

export default class TemplateLooping extends LightningElement {
    strList = ["Madhu","Nur","Taner","Mani","Emre"];
    
    students = [
        {
            name : "Alihan",
            rollNumber : 243
        },
        {
            name : "Aydin",
            rollNumber : 244
        },
        {
            name : "Fulya",
            rollNumber : 245
        },
            ]
}