public with sharing class TestDataCleaner {

    public static void deleteAllTestData() {

        List<String> objectApiNames = new List<String>{
            // ===== Leaf / deepest =====
            'Attachment',
            'ContentDocumentLink',
            'EmailMessage',
            'CaseComment',
            'CampaignMember',
            'OpportunityContactRole',
            'OpportunityLineItem',
            'OrderItem',
            'PricebookEntry',
            'Product2',

            // ===== Activities =====
            'Task',
            'Event',

            // ===== Custom leaf =====
            'Outgoing_Email__c',
            'Change_Event__c',
            'Process_Instance__c',
            'Messaging_Session__c',
            'Open_Activity__c',
            'Messaging_End_User__c',

            // ===== Core children =====
            'Case',
            'Opportunity',
            'Order',
            'Contract',
            'Asset',
            'Contact',
            'Lead',

            // ===== Parent helpers =====
            'OperatingHours',
            'Individual',
            'Campaign',
            'RecordType',

            // ===== ROOT (LAST!) =====
            'Account',
            'Account_Parent_Test__c',
            'Account_Parent2_Test__c',
            'Contact_Parent_Test__c',
            'Contact_Parent2_Test__c',
            'Account_Record_Type__c'
        };

        for (String objectName : objectApiNames) {
            try {
                String soql = 'SELECT Id FROM ' + objectName + ' ALL ROWS';
                List<SObject> records = Database.query(soql);

                if (!records.isEmpty()) {
                    Database.delete(records, false);
                    System.debug('Ã¢ÂÂ Deleted ' + records.size() + ' records from ' + objectName);
                } else {
                    System.debug('Ã¢ÂÂ¹Ã¯Â¸Â No records found for ' + objectName);
                }

            } catch (Exception e) {
                System.debug('Ã¢ÂÂ ERROR deletinggggggg just to be sure' + objectName + ': ' + e.getMessage());
            }
        }
    }
}
