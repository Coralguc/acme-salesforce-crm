import { LightningElement, api} from 'lwc';

export default class ToDoList extends LightningElement {
task = '';
tasks = [];
@api welcomeMessage;
@api toDoList;
@api toDoObjects;

handleChange(event) {
this.task = event.target.value; 

}

addTask() {

if(this.task) {
    const newTask={
    id:this.task.length + 1,
    taskName:this.task,
    completed:false
};
    
    this.tasks = [...this.tasks, newTask];
    this.task = '';
}
}
 

handleCheckboxChange(event) {
const taskId = Number(event.target.dataset.id);
this.tasks = this.tasks.map(task => {
           
if (task.id === taskId) {
    return { ...task, completed: !task.completed };
}
return task;
});
}

deleteTask(event) {
const taskId = Number(event.target.dataset.id);
this.tasks = this.tasks.filter(task => task.id !== taskId); 
}

deleteCompletedTasks() {
this.tasks = this.tasks.filter(task => !task.completed);
}
}