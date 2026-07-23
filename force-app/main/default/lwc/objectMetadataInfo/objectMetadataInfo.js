import { LightningElement,api,wire } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';

export default class ObjectMetadataInfo extends LightningElement {

   // automatically populates this on Record Pages
    @api objectApiName;

    objectInfo;
    error;

    @wire(getObjectInfo, { objectApiName: '$objectApiName' })
    wiredObjectInfo({ data, error }) {
        if (data) {
            this.objectInfo = data;
            this.error = undefined;
        } else if (error) {
            this.objectInfo = undefined;
            this.error = error.body?.message;
        }
    }

    get customFieldCount() {
        if (!this.objectInfo) return 0;

        return Object.values(this.objectInfo.fields)
            .filter(field => field.custom)
            .length;
    }

    get requiredFieldCount() {
        if (!this.objectInfo) return 0;

        return Object.values(this.objectInfo.fields)
            .filter(field => field.required && !field.defaultedOnCreate)
            .length;
    }

    get recordTypeNames() {
        if (!this.objectInfo) return [];

        return Object.values(this.objectInfo.recordTypeInfos)
            .map(rt => rt.name);
    }

    get recordTypeCount() {
        return this.recordTypeNames.length;
    }

    get fieldNames() {
        if (!this.objectInfo) return [];

        return Object.keys(this.objectInfo.fields);
    }
}