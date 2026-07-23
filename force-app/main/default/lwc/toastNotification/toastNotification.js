import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class ToastNotification extends LightningElement {

handleSuccessClick(event)
{
    ShowToast(event)
    {
        switch(event.target.label)
        {
            case "Success" :

                break;
            case "Error" :
                break    
            case "Warning" :
                break;
            case "Info" :
                break    
        }
    }

}
}
//     const myToast = new ShowToastEvent({
//         title: "Success",
//         message: "{0} Account Created {1}",
//         variant: "success",
//         mode:"pester",
//         messageData:[
//             'Salesforce',
//             {
//                 url:'https://www.salesforce.com/in/?ir=1',
//                 label:'click here'
//             }

//         ]

//     })
//     this.dispatchEvent(myToast);
// }
// handleErrorClick(event){
//  const myToast = new ShowToastEvent({
//         title: "Error",
//         message: "Account not Created",
//         variant: "error",
//         mode:"sticky"

//     })
//     this.dispatchEvent(myToast);

// }
// handleInfoClick(event){
//  const myToast = new ShowToastEvent({
//         title: "Information",
//         message: "Account not available",
//         variant: "info"

//     })
//     this.dispatchEvent(myToast);

// }
// handleWarningClick(event){
//  const myToast = new ShowToastEvent({
//         title: "Warning",
//         message: "Record is not available",
//         variant: "warning"

//     })
//     this.dispatchEvent(myToast);

// }
// }