public with sharing class DataTableController {
    @AuraEnabled(Cacheable=true)
    Public static Response getData(String calloutName){
        Response res = new Response();
        switch on calloutName{
            when 'Callout1'{
                List<TableHeader> tableHeaders = new List<TableHeader>();
                DataTableMetadata__mdt tableMetadata = [SELECT Id,Table_Columns__c,KeyField__c From DataTableMetadata__mdt Where DeveloperName =:calloutName];
                List<String> columns = tableMetadata.Table_Columns__c.deleteWhitespace().split(',');
                for(String column : columns){
                    System.debug('Single Column Header :'+column);
                    List<String> columnHeaders = column.split(':');
                    TableHeader singleColumnHeader = new TableHeader();
                    singleColumnHeader.label = columnHeaders[0].deleteWhitespace();
                    singleColumnHeader.fieldName = columnHeaders[1].deleteWhitespace();
                    singleColumnHeader.type = columnHeaders[2].deleteWhitespace();
                    tableHeaders.add(singleColumnHeader);
                }
                res.columnsData = tableHeaders;
                // Assign with Callout Response in Future
                //res.tableData = System.Label.tableJSON; 
                res.keyField = tableMetadata.KeyField__c;
            }
            when else{
                throw new AuraHandledException('Failure!!');
            }
        }
        return res;
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