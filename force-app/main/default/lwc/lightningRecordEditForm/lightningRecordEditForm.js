import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
// import CONTACT_OBJECT from '@salesforce/schema/Contact';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import DESC_FIELD from '@salesforce/schema/Contact.Description';
import ACCOUNTID_FIELD from '@salesforce/schema/Contact.AccountId';
import BIRTHDATE_FIELD from '@salesforce/schema/Contact.Birthdate';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import MAILINGSTREET_FIELD from '@salesforce/schema/Contact.MailingStreet';
import MAILINGCITY_FIELD from '@salesforce/schema/Contact.MailingCity';
import MAILINGSTATE_FIELD from '@salesforce/schema/Contact.MailingState';
import MAILINGPOSTALCODE_FIELD from '@salesforce/schema/Contact.MailingPostalCode';
import MAILINGCOUNTRY_FIELD from '@salesforce/schema/Contact.MailingCountry';
//import ADDRESS_FIELD from '@salesforce/schema/Contact.MailingAddress';



export default class LightningRecordEditForm extends LightningElement {

    // objectApiName = CONTACT_OBJECT;
    @api objectApiName;
    @api recordId;
    showAddress = false;
 field={
    LastName: LASTNAME_FIELD,
    AccountId: ACCOUNTID_FIELD,
    Email: EMAIL_FIELD,
    Title: TITLE_FIELD,
    Description: DESC_FIELD,
    Birthdate:BIRTHDATE_FIELD,

    MailingStreet: MAILINGSTREET_FIELD,
    MailingCity: MAILINGCITY_FIELD,
    MailingState: MAILINGSTATE_FIELD,
    MailingPostalCode: MAILINGPOSTALCODE_FIELD,
    MailingCountry: MAILINGCOUNTRY_FIELD
    //MailingAddress:ADDRESS_FIELD

 }
 handleSubmit(event){
    event.preventDefault();
    console.log("event values are",event)
    console.log("Field values",event.detail.fields);
    const submittedFields = event.detail.fields;

    // if(this.refs.Title.value==="Vice President" && this.refs.AccountName.value==null)
    if(submittedFields.Title==="Vice President" && !submittedFields.AccountId)
    {
        const toastMsg = new ShowToastEvent({
            title:"Validation required",
            message:`Title "${submittedFields.Title}" requires an Account to be selected`,
            variant:"warning"
        })
        this.dispatchEvent(toastMsg);
        return;
    }
        if(submittedFields.Title === "Vice President")
        {
            submittedFields.Description= "VIP Contact"
                }
            else    
            {
             submittedFields.Description= "General Contact" 
            }
       
        this.refs.myForm.submit(submittedFields);
        }
    
    handleSuccess() {
        const toastMsg = new ShowToastEvent({
                title: "Submitted",
                message:"Record submitted Successfully",
                variant: "success"
            })
            this.dispatchEvent(toastMsg);
    }
    handleError(event){
        const toastMsg = new ShowToastEvent({
            title: "Error",
            message:event.detail.message,
            variant: "error"
        })
        this.dispatchEvent(toastMsg);
    }
    handleCancel(){
       const inputFields= this.template.querySelectorAll('lightning-input-field');
       if(inputFields)
       {
            inputFields.forEach(field=>
                field.reset())
       }

    }
    handleClear(){
        const inputFields= this.template.querySelectorAll('lightning-input-field');
       if(inputFields)
       {
            inputFields.forEach(field=>
                field.value=null)
       }


    }
    handleAddress(event)
    {
        console.log('Toggle event:', event);
        console.log('Checked:', event.detail.checked);

        this.showAddress = event.detail.checked;
       
        // this.template.querySelector(".MailingAddress").value
    }
 }
