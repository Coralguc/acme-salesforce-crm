import { LightningElement, wire ,api} from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';


export default class ContactDetailsWire extends LightningElement {

    Email;
    LastName;
    Title;
    @api recordId;
    @wire (getRecord, {
        recordId:'$recordId', 
        fields: [LASTNAME_FIELD, EMAIL_FIELD,TITLE_FIELD]
        })
        
        contactDetailsFun({data,error})
        {
            console.log("Values are",data);
            // console.log("Record Id is", '$recordId');
            if(data)
            {
                console.log(data.fields.Email.value);
                this.Email = data.fields.Email.value;
                this.LastName = data.fields.LastName.value;
                this.Title = data.fields.Title.value;

            }
            else if(error)
            {
                console.log(error);
            }
        }
     @wire (getRecord, {recordId:'$recordId', fields:
                                                [LASTNAME_FIELD, EMAIL_FIELD,TITLE_FIELD]})

        contactDetailsProperty;
        get contact_Email_Data()
        {
            return getFieldValue(this.contactDetailsProperty.data,EMAIL_FIELD)

}
        }
        