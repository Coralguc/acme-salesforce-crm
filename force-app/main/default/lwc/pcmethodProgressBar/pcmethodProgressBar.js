import { LightningElement } from 'lwc';

export default class PcmethodProgressBar extends LightningElement {

handleStart(event)
{
    console.log("value1", this.refs);
    console.log("value2", this.refs.child);
    console.log("handle start started");
    this.refs.child.start();
    console.log("handle start end");
    
}
handleStop(event)
{
  this.refs.child.stop();
}

handleReset(event)
{
    this.refs.child.reset();
}




}


