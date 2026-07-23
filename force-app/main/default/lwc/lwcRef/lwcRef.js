import { LightningElement } from 'lwc';

export default class LwcRef extends LightningElement {

name = '';
age = '';

handleNameChange(event)
 {
    this.name = event.target.value;
    this.refs.ageRefInput.required = true;
   
 }

 handleAgeChange(event)
 {
    this.age = event.target.value;
 }

checkEligibility(event)
 {
    if(!this.age)
    {
        alert("Please enter Age");
        return;

    }
    if (this.age>18)
    {

        this.refs.refEligible.innerText = "Eligible for Driving";
        console.log(this.refs.refJoinDriving.disabled);
     
        this.refs.refJoinDriving.disabled = false;
        console.log(this.refs.refJoinDriving.disabled);
     
    }
    else{
        this.refs.refEligible.innerText = "Not eligible for Driving";
        console.log(this.refs.refJoinDriving.disabled);
     
        this.refs.refJoinDriving.disabled = true;
        console.log(this.refs.refJoinDriving.disabled);
     


    }
 }

 joinDrivingSchool(event){
    if(!this.name)
    {
        alert("Please enter Name");
        return;
    }
    alert(`Welcome ${this.name} to Driving School`);
 }


}