import { LightningElement } from 'lwc';

export default class Objectlooping extends LightningElement {

Students = [
    {
        Id: 100001,
        Name: 'John Doe',
        Age: 20,
        Grade: 'A'
    },
    {   Id: 100002,
        Name: 'Jane Smith',
        Age: 22,
        Grade: 'B'
    },
    {   Id: 100003,
        Name: 'Bob Johnson',
        Age: 21,
        Grade: 'A'                      
    },     
    {   Id: 100004,
        Name: 'Diane',
        Age: 23,
        Grade: 'C'
    }
]
}