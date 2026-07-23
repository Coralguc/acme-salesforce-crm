import { LightningElement,api } from 'lwc';

export default class ChildProgressBar extends LightningElement {

intervalId;
progress = 0;

@api start(){
       console.log("starting");
       if(this.intervalId)
       {return;

       }
    this.intervalId = setInterval(()=>{
        if (this.progress>=100)
        {
            clearInterval(this.intervalId);
            this.IntervalId= null;
            return;
        }
        this.progress+=10;
    },1000);
    console.log("start completed");

    }
@api stop(){
    console.log("stop");
       clearInterval(this.intervalId);
 
    }
@api reset(){
       console.log("reset");
         this.intervalId=null;
         this.progress=0;

    }

}