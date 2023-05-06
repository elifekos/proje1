import { LightningElement } from 'lwc';

//import object
import LEAD_OBJ from '@salesforce/schema/Lead';


//import fields
import LASTNAME_FIELD from '@salesforce/schema/Lead.LastName';
import STATUS_FIELD from '@salesforce/schema/Lead.Status';
import COMPANY_FIELD from '@salesforce/schema/Lead.Company';



export default class LightningRecordFormandEditForm_Lead extends LightningElement {
    objName =LEAD_OBJ;
    fields = {
        LastName :LASTNAME_FIELD,
        Status :STATUS_FIELD,
        Company:COMPANY_FIELD
      
       
    };
    recordId="00QDn000007h8dWMAQ";
}