import { LightningElement, track} from 'lwc';
    
export default class AccObject extends LightningElement {

    @track lead = 
    {leadName: '', leadSource: '', annualRevenue: '', Email: ''}
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
    handleLeadName(event) {
        this.lead.leadName = event.target.value;
    }

    handleLeadSource(event) {
        this.lead.leadSource = event.target.value;
    }

    handleAnnualRevenue(event) {
        this.lead.annualRevenue = event.target.value;
    }

    handleEmail(event) {
        this.lead.Email = event.target.value;
    }   

    handleAdd(event) {
        this.leads.push(this.lead);
        this.lead = { leadName: '', leadSource: '', annualRevenue: '', Email: '' };
    }

    handleClear(event) {
        this.lead = { leadName: '', leadSource: '', annualRevenue: '', Email: '' };
    }

    handleDisplay(event) {
        
    }
    get hasLeads() {
        return this.leads.length > 0;
    }   
}
