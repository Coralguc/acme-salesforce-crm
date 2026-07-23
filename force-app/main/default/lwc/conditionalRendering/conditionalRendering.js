import { LightningElement, track } from 'lwc';

export default class ConditionalRendering extends LightningElement {

newCourseName;    
@track courses = ["Salesforce Admin", "Salesforce Developer", "Salesforce Architect", "Salesforce Consultant"];    
isShoppingChosen = false; //truthy or Falsy
isReadingChosen = false;

handleShoppingChange(event){
    this.isReadingChosen = false;
this.isShoppingChosen = event.target.checked;
this.template.querySelector(".Reading").checked = false;

console.log(`Shopping chosen is ${this.isShoppingChosen} `); 
}

handleReadingChange(event){
    this.isShoppingChosen = false;
this.isReadingChosen = event.target.checked;
this.template.querySelector(".Shopping").checked = false;
console.log(`Reading chosen is ${this.isReadingChosen} `); 
}
handleCoursesChange(event){
    this.newCourseName = event.target.value;
}

handleAddNewCourse(event){
    this.courses.push(this.newCourseName);
}
get isArrayNotEmpty(){
    return this.courses.length > 0;
}
}