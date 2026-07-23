import { LightningElement, wire } from 'lwc';
import { getObjectInfo , getPicklistValues } from 'lightning/uiObjectInfoApi';  

import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
export default class PicklistValuesbyRecordTypewire extends LightningElement {

accountObjData={};
accPicklistVal=[];
recordTypeOptions=[];
error;
selectedIndustry;
accRecordTypeId;

@wire(getObjectInfo,{objectApiName:ACCOUNT_OBJECT})
accountObjectInfo({data,error})
    {
    
        if(data)
        {
            this.accountObjData = data;
             // Default Record Type
            this.accRecordTypeId = data.defaultRecordTypeId;
            
            this.recordTypeOptions = Object.values(data.recordTypeInfos)
                                    .filter(rt=>rt.available)
                                    .map(rt=>({
                                        label:rt.name,
                                        value:rt.recordTypeId
                                    }));
        }
            else if (error) {
        this.accountObjData = undefined;
        this.error = error.body?.message;
    }
    }

@wire(getPicklistValues,{
                         recordTypeId:"$accRecordTypeId",
                         fieldApiName:INDUSTRY_FIELD
                        })
    accPickListValue({data,error})
    {
        if(data)
        {
            console.log(data);
            this.accPicklistVal = data.values;

        }
        else if(error){
            console.error('Wire Error:', error);
            this.error = error.body?.message;
        }

    }

    handleIndustryChange(event){
        this.selectedIndustry = event.detail.value;
        console.log('Selected:', this.selectedIndustry);
    }
    handleRecordTypeChange(event)
    {
        this.accRecordTypeId = event.detail.value;
    }


}   