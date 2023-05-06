import { LightningElement, wire } from 'lwc';
//Import the adapters
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';

//Import object
import CONTACT_OBJECT from '@salesforce/schema/Contact';

export default class GetPicklistValuesByRecordTypeAssgnment_Contact extends LightningElement {
    europeRtId;
    @wire(getObjectInfo,{objectApiName : CONTACT_OBJECT})
    objectHandler({data,error}){
        if(data){
            console.log(data);
            //To find the respective record Type Id
            const recordTypeIds = data.recordTypeInfos;
            this.europeRtId = Object.keys(recordTypeIds).find(rtId=>recordTypeIds[rtId].name=='Europe');
        }
        
    } 
    levelOptions;
    leadSourceOptions;

    @wire(getPicklistValuesByRecordType,{objectApiName : CONTACT_OBJECT,recordTypeId :'$europeRtId'})
    levelHandler({data,error}){
        if(data){
            console.log(data);
            /**
             data = {
                picklistFieldValues : {
                    Level_c : {}
                    ..... 
                }
             }
             */
            this.levelOptions = data.picklistFieldValues.Level__c.values;
            this.leadSourceOptions = data.picklistFieldValues.	LeadSource.values;

        }
    }

    selectedLevel;
    handleChange_1(event){
        this.selectedLevel = event.detail.value;
    }

    
    selectedLeadSource;
    handleChange_2(event){
        this.selectedLeadSource = event.detail.value;
    }

    
}