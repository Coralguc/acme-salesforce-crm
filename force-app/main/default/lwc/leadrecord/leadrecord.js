import { LightningElement, track } from 'lwc';

export default class Leadrecord extends LightningElement {


@track lead = {leadName: '', leadSource: '', annualRevenue: '', email: ''};
@track leads = [];
error = false;
showLeads = false;

sourceOptions = [
    { label: 'Web', value: 'Web' },
    { label: 'Phone Inquiry', value: 'Phone Inquiry' },
    { label: 'Partner Referral', value: 'Partner Referral' },
    { label: 'Purchased List', value: 'Purchased List' },
    { label: 'Other', value: 'Other' }
];

columns = [
{ label: 'Lead Name', fieldName: 'leadName', type: 'text' },
{ label: 'Lead Source', fieldName: 'leadSource', type: 'text' },
{ label: 'Annual Revenue', fieldName: 'annualRevenue', type: 'currency' },
{ label: 'Email', fieldName: 'email', type: 'email' }
];

    handleLeadName(event) {
        this.lead = {...this.lead, leadName: event.target.value};
    }

handleLeadSource(event) {
    this.lead = {...this.lead, leadSource: event.detail.value};
}

handleAnnualRevenue(event) {
    this.lead = {...this.lead, annualRevenue: event.target.value};
}

handleEmail(event) {
    this.lead = {...this.lead, email: event.target.value};
}   

handleAdd(event) {
    if(!this.lead.leadName || 
        !this.lead.leadSource || 
        !this.lead.annualRevenue || 
        !this.lead.email) {
        this.error = true;
        return;
    } 
        
    const newLead = {
        id: Date.now(),
        leadName: this.lead.leadName,
        leadSource: this.lead.leadSource,
        annualRevenue: this.lead.annualRevenue,
        email: this.lead.email
    };
        this.leads= [...this.leads, newLead];

        this.lead = { leadName: '', leadSource: '', annualRevenue: '', email: '' };
        this.error = false;
    
}

handleClear(event) {
    this.lead = { leadName: '', leadSource: '', annualRevenue: '', email: '' };
}

handleDisplay(event) {
    this.showLeads = true;
}
get hasLeads() {
    return this.leads.length > 0;
}   



}