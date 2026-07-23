import { LightningElement} from 'lwc';

export default class ComponentComposition extends LightningElement {
activeTab = 'toDoListTab';
toDoArray= ["LWC Project", "Aura Component", "Meet with Acme", "Training&Documentation"];
toDoObject=[
    {
        taskId:1,
        task: "Send emails",
        SLA :"3 hours",
        Priority : "High"
    },
    {
        taskId:2,
        task: "OAuth Configuration",
        SLA :"8 hours",
        Priority : "Medium"
    },
    {
        
        taskId:3,  
        task: "Low Production tickets",
        SLA :"16 hours",
        Priority : "Low"
    }
]
}
