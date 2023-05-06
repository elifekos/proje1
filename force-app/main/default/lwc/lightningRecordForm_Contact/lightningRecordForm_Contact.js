import { LightningElement } from 'lwc';
//import object
import CONTACT_OBJECT from '@salesforce/schema/Contact';


//import fields
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';

export default class LightningRecordForm_Contact extends LightningElement {
    objectApiName = CONTACT_OBJECT;
    //copy the recordId from Contact Object record
    recordId ='003Dn0000074aGBIAY';
    fields =[LASTNAME_FIELD];
}