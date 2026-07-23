import { LightningElement,wire } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';



export default class GetObjectInfoWire extends LightningElement {
    accountData= {};
    @wire(getObjectInfo,{objectApiName: ACCOUNT_OBJECT})
    accountObjectInfo({data,error})
    {
        if(data)
        {
            this.accountData = data;
        }
        console.log(data);
       // console.log(this.accountData.childRelationships[0].childObjectApiName);


    }
    
    
}