import { LightningElement, wire} from 'lwc';
//reference for our message channel
import SAMPLEMC from '@salesforce/messageChannel/simpleMessageChannel__c';
//referencing adapters core methods available in the messaging service
import{APPLICATION_SCOPE,subscribe, unsubscribe, MessageContext, publish } from 'lightning/messageService';

export default class MsgPublisher extends LightningElement {
    message;
    @wire(MessageContext)
    context;

    handleChange(event){
        this.message = event.target.value;
    }

    handlePublish(event){
        // Here you would typically publish the message using LMS or other mechanism
    console.log('published');
        const msg = {
            lmsData: {value: this.message}
        }
        publish(this.context, SAMPLEMC, msg);
    
        }
    }


