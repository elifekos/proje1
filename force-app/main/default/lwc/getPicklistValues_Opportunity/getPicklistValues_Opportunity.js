import { LightningElement ,wire} from 'lwc';
//import adaptor
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';

//Import Field
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import LEADSOURCE_FIELD from '@salesforce/schema/Lead.LeadSource';

//import Object
import OPP_OBJ from '@salesforce/schema/Opportunity';

export default class GetPicklistValues_Opportunity extends LightningElement {
    stageOptions;
    leadSourceOptions;
    oppRTId;

    @wire(getObjectInfo,{objectApiName :OPP_OBJ })
    caseHandler({data,error}){
        if(data){
            console.log(data);
           this.oppRTId =data.defaultRecordTypeId;
         }
    }
    @wire(getPicklistValues,{fieldApiName : STAGE_FIELD, recordTypeId : '$oppRTId'})
    oppStageNameHandler({data,error}){
        if(data){
            console.log(data);
          this.stageOptions = data.values;
         }
        if(error){
            console.log(error);
        }
    }
    @wire(getPicklistValues,{fieldApiName : LEADSOURCE_FIELD, recordTypeId : '$oppRTId'})
    leadSourceHandler({data,error}){
        if(data){
            console.log(data);
          this.leadSourceOptions = data.values;
          }
        if(error){
            console.log(error);
        }
    }
}