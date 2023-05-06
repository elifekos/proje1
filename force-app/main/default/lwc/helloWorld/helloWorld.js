import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {

    //Variables / properties
    myName = 'Elife';
    myAge = 10;
    myAddress;  //undefined
    isLWCInteresting = true;
    //Arrays-similar to apex list[0,1,2,3]
    students =["ferzan", "gulnar","mahri","hatice"];
    //Object -{Key : Value} Similar to JSON
    address = {
        city : "San Antonio",
        state : "Texas",
        zipcode : 78240
    };

    //Methods
    //Apex - public static string myMethod(Integer a, String myName)
    myMethod(){
        //let or var, const
        let displayMessage = 'Method Message';
    console.log("Method Variable"+displayMessage);
    //this.
     console.log("Class Variable"+this.myName);

    }

}