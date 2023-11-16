trigger CotactCreateasNumberInsertTrigger on Account (after Insert) {
     List<Contact> contactToInsert = new List<Contact>();

    for (Account acc : Trigger.new) {
        if (Trigger.isInsert ) {
            CotactCreateasNumberInsert.createContact(acc, contactToInsert);
        }
    }
}