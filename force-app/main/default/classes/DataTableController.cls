public with sharing class DataTableController {
    @AuraEnabled(Cacheable=true)
    Public static Response getData(String calloutName){
        Response res = new Response();
        List<TableHeader> tableHeaders = new List<TableHeader>();
        List<DataTableMetadata__mdt> tableMetadata = [SELECT Id,Table_Columns__c,KeyField__c From
                                                      DataTableMetadata__mdt Where DeveloperName =:calloutName];  
        if(!tableMetadata.isEmpty()){
            List<String> columns = tableMetadata[0].Table_Columns__c.deleteWhitespace().split(',');
            for(String column : columns){
                System.debug('Single Column Header :'+column);
                List<String> columnHeaders = column.split(':');
                TableHeader singleColumnHeader = new TableHeader();
                singleColumnHeader.label = columnHeaders[0];
                singleColumnHeader.fieldName = columnHeaders[1];
                singleColumnHeader.type = columnHeaders[2] == NULL ? 'text' : columnHeaders[2];
                tableHeaders.add(singleColumnHeader);
            }
            res.columnsData = tableHeaders;
            // Assign with Callout Response in Future
            //res.tableData = System.Label.tableJSON; 
            res.keyField = tableMetadata[0].KeyField__c;
            return res;
        }else{
            throw new AuraHandledException('No Custom Metadata Records Found. Please check with System Administrator!!');
        }   
    }
    Public class Response{
        @AuraEnabled
        Public List<TableHeader> columnsData;
        @AuraEnabled
        Public String tableData;
        @AuraEnabled
        Public String keyField;
    }
    Public Class TableHeader{
        @AuraEnabled
        Public String label;
        @AuraEnabled
        Public String fieldName;
        @AuraEnabled
        Public String type;
    }
}