import { LightningElement } from 'lwc';

//import object
import CONTACT_OBJ from '@salesforce/schema/Contact';


//import fields
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import DEPT_FIELD from '@salesforce/schema/Contact.Department';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class LightningRecordEditForm_Contact extends LightningElement {
    objName = CONTACT_OBJ;
    fields = {
        FirstName :FIRSTNAME_FIELD,
        LastName :LASTNAME_FIELD,
        Title : TITLE_FIELD,
        Depertmant :DEPT_FIELD,
        Email: EMAIL_FIELD,
        Phone: PHONE_FIELD
    };
    recordId = "003Dn0000074aGBIAY";

    successHandler(){
        const event = new ShowToastEvent({
            title: 'Success',
            message:'Record saved successfully.',
            variant :"Success"
        });
        this.dispatchEvent(event);
    }
    errorHandlerr(){
        const event = new ShowToastEvent({
            title: 'Error',
            message:'Fix the error.',
            variant :"Error"
        });
        this.dispatchEvent(event);
    }
}