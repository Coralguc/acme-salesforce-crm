import { LightningElement, wire } from 'lwc';
//reference for our message channel
import SAMPLEMC from '@salesforce/messageChannel/simpleMessageChannel__c';
//referencing adapters core methods available in the messaging service
import{APPLICATION_SCOPE,subscribe, unsubscribe, MessageContext, publish } from 'lightning/messageService';

export default class MsgSubscriber extends LightningElement {
    messageReceived;

    @wire(MessageContext)
    context;
    subscription;

    connectedCallback() {
        this.subscribeMC();
    }

    subscribeMC() {
        //context, channel ref, listener, subscriber options
        this.subscription = subscribe(
            this.context,
            SAMPLEMC,
            (message) => { this.handleMessage(message); },
            { scope: APPLICATION_SCOPE }
        );
    }

    handleMessage(message) {
        this.messageReceived = message.lmsData.value? message.lmsData.value:'No Message';

}
}