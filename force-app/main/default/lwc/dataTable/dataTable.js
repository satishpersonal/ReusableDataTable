import { LightningElement, track, wire, api } from 'lwc';
import tableData from '@salesforce/apex/DataTableController.getData';
export default class DataTable extends LightningElement {
    @api calloutName;
    @track columns;
    @track keyField;
    @track error;
    //To be Replaced Dynamically in Future from Apex
    data = [{
        "organisationId": "-1",
        "entityName": "Wepfer Marine Inc",
        "entityIMONumber": null,
        "entityShortName": null,
        "legalEntityName": "Wepfer Marine Inc",
        "salus3DCounterpartyId": null,
        "address": " PO Box 13363,  Memphis,  Tennessee,  38113-0363, United States",
        "registeredCountry": null,
        "operatingCountry": "US",
        "nationalityOfControl": "United States"
    },
    {
        "organisationId": "-2",
        "entityName": "Wepfer Marine Inc",
        "entityIMONumber": null,
        "entityShortName": null,
        "legalEntityName": "Wepfer Marine Inc",
        "salus3DCounterpartyId": null,
        "address": " PO Box 13363,  Memphis,  Tennessee,  38113-0363, United States",
        "registeredCountry": null,
        "operatingCountry": "US",
        "nationalityOfControl": "United States"
    }
    ];
    @wire(tableData,{calloutName: '$calloutName'})
    wiredtabledata({error,data}){
        if(data){
            let response = data;
            console.log(response);
            this.columns = response.columnsData;
            //this.data = response.tableData;
            this.keyField = response.keyField;
            error = undefined;
        } else if (error){
            error = error;
            this.data = undefined;
            this.columns = undefined
        }
    }
}