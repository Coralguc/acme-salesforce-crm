import { LightningElement } from 'lwc';
import enrollment from './enrollmentTemplate.html';


import rendering from './renderMethod.html';
import alumni from './alumniTemplate.html';
export default class RenderMethod extends LightningElement {
    chosenTemplate;
    render()
        {
            return this.chosenTemplate === 'New Enrollment'
                  ?enrollment
                  : this.chosenTemplate === 'Alumni'

                  ?alumni
                  :rendering

    }
    handleClick(event)
    {
        this.chosenTemplate = event.target.label;
            // if (this.chosenTemplate === 'New Enrollment')

            //     {
            //         this.chosenTemplate = enrollmentTemplate;
            //     }
            //     else if(this.chosenTemplate === 'Alumni')
            //     {
            //          this.chosenTemplate = AlumniTemplate;
            //     }
                    

    }



}