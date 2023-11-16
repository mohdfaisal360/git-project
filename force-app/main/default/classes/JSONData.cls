public class JSONData {
    public static void jsonMethodData(){
        List<Contact> conList = [SELECT ID, lastName FROM Contact LIMIT 1];
        if(!conList.isEmpty()){
            JSONGenerator jsonGen = JSON.createGenerator(true);
            jsonGen.writeStartObject();
            jsonGen.writeFieldName('ContactList');
            jsonGen.writeStartArray();
            for(Contact con : conList){
                
                jsonGen.writeStartObject();
                jsonGen.writeStringField('ID',con.Id);
                //jsonGen.writeStringField('FirstName',con.firstName);
                jsonGen.writeStringField('LastName',con.lastName);
               // jsonGen.writeStringField('Phone',con.Phone);
                jsonGen.writeEndObject();
                
            }
            jsonGen.writeEndArray();
            jsonGen.writeEndObject();
            String jsonData = jsonGen.getAsString();
            System.debug('Json Data - ' + jsonData);
        }
    }
}