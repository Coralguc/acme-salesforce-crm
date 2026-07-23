import { LightningElement, wire, api } from 'lwc';
import { updateRecord, getRecord, generateRecordInputForUpdate } from 'lightning/uiRecordApi';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import ACCOUNT_NAME from '@salesforce/schema/Account.Name';
import PHONE from '@salesforce/schema/Account.Phone';
import ANNUALREV from '@salesforce/schema/Account.AnnualRevenue';



export default class UpdateRecordWire extends LightningElement {

    @api recordId;
    name;
    annualRevenue;
    phone;
    wiredData;

    @wire(getRecord,{recordId:'$recordId', fields:[ACCOUNT_NAME,PHONE,ANNUALREV]})
    accountData({data,error})
    {
    if(data)
        //data is the source data
    {
        this.wiredData= data;
        console.log(data);
        this.name = data.fields.Name.value
        this.annualRevenue = data.fields.AnnualRevenue.value
        this.phone = data.fields.Phone.value

    }
   else if(error){
            console.error('Wire Error:', error);
            this.error = error.body?.message;
        }

    
}
handleUpdate(event){
    

    //generate record Input for update
    const recordInput = generateRecordInputForUpdate(this.wiredData);
    console.log("recordInput", recordInput);
    console.log("recordInput fieldnames", recordInput.fields.name);
        recordInput.fields[ACCOUNT_NAME.fieldApiName] = this.name;
        recordInput.fields[ANNUALREV.fieldApiName] = this.annualRevenue;
        recordInput.fields[PHONE.fieldApiName] = this.phone;
   
    updateRecord(recordInput)
    .then(result=>{

    this.dispatchEvent(new ShowToastEvent(
    {
        title: "Success",
        message: "Record has been Updated",
        variant:"success"
    }));
    })
    .catch(error=>{
        this.dispatchEvent(new ShowToastEvent(
    {
        title: "Error",
        message: error.body.message,
        variant: "error"
    }));
    })

 }

handleChange(event){

    if(event.target.name === "Account Name")
    {
        this.name = event.target.value;
    }
    
    if(event.target.name === "AnnualRev")
    {
        this.annualRevenue = event.target.value;

    }
    
    if(event.target.name === "Phone")
    {
        this.phone = event.target.value;
    }
}





}