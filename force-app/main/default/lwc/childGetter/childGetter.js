import Phone from '@salesforce/schema/Lead.Phone';
import { LightningElement,api } from 'lwc';

export default class ChildGetter extends LightningElement {

    _childData=[];
    _childObj=[];
    @api 
    get childArray()
    {
        return this._childData;

    }
    set childArray(value)
    {
        console.log("child array value is",  this._childData);
        this._childData = [...value,400];
     
        
    }

    @api 
    get objIphones()
    {
        return this._childObj;
    }
    set objIphones(value)
    {
        console.log("Iphones values are",this._childObj);
        this._childObj = value.map(phone => {
            return{...phone,
                    sales:phone.sales.toUpperCase(),
                    name:phone.name.toUpperCase()}
                    
                    });
                    
        
    }
}