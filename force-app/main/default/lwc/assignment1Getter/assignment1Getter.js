import { LightningElement } from 'lwc';

export default class Assignment1Getter extends LightningElement {
    myFavNum = 8;
    isStudent = true;
    studentInfo = {student:'Elife', age: 10 };
    carListArray =["Toyota","Honda" , "Kia", "Ford"];
    firstName = "Elife";
    lastName = "Kos";

    
 
    //getters
    get fullName(){
        return this.firstName + ' ' +this.lastName;
    }
    get myFavCarBrand(){
        return this.carListArray[1];
    }


}