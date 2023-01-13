# ReusableDataTable

The Datatable is Managed by Custom Metadata (Columns Headers, KeyField will be Ideally  Linked to Endpoint) -- Carefully Manage the Custom Metadata for the code to work properly

1. Lightning Data Table Ideal Expection of Coulmns will be in Below Type.<br/>
    { label: 'organisationId', fieldName: 'organisationId',type : 'text' }, <br/>
    { label: 'entityName', fieldName: 'entityName', type : 'text' },<br/>
    { label: 'entityIMONumber', fieldName: 'entityIMONumber', type : 'text' }
    
2. In our Custom metadata Records the Field (Table_Columns__c) will Manage the same in the below Format. <br/>
    organisationId:organisationId:text,<br/>
    entityName:entityName:text,<br/>
    entityIMONumber:entityIMONumber:text <br/>
    
    Note : Please don't change Special Characters Symbols. If you need a change the Apex Code must be adjusted accordingly.
    
3. Field (KeyField__c) will be Used to Identify the KeyField for HTML
4. Endpoint is Generic Field can be used to store Endpoint Information for API Calls etc..
5. Once the Datatable LWC Component is Deployed & The Input Field (calloutName) Can be Used to Link with the Custom Metadata DeveloperName by doing this it will take the structure from the respective fields and prepare the table.


Feel Free to Create a Pull Request in Future if you find any enhancements.....May the force be with you...
