import { LightningElement } from 'lwc';
//import object
import ACCOUNT_OBJ from '@salesforce/schema/Account';

//import fields
import ACCNAME_FIELD from '@salesforce/schema/Account.Name';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import ACCNUM_FIELD from '@salesforce/schema/Account.AccountNumber';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import WEBSITE_FIELD from '@salesforce/schema/Account.Website';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import ANNUALREVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class LightningRecordForm_Account extends LightningElement {
    objName = ACCOUNT_OBJ;
    recordId ='001Dn00000B9PKGIA3';
    fields = [ACCNAME_FIELD,RATING_FIELD,ACCNUM_FIELD,PHONE_FIELD,WEBSITE_FIELD,INDUSTRY_FIELD,TYPE_FIELD,ANNUALREVENUE_FIELD];

    successHandler() {
        const event = new ShowToastEvent({
            title: 'Success',
            message:'Record saved successfully.',
            variant :"Success"
        });
        this.dispatchEvent(event);
    }
    errorHandlerr() {
        const event = new ShowToastEvent({
            title: 'Error',
            message:'Fix the error.',
            variant :"Error"
        });
        this.dispatchEvent(event);
    }
}