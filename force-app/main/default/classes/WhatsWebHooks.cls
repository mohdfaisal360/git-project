@RestResource(urlMapping='/whatsapp/webhooks/v1/*')
global class WhatsWebHooks {
    private static final String SIGNATURE_VALID_MESSAGE = 'Signature Varified';
    private static final String SIGNATURE_NOT_VALID_MESSAGE = 'Signature could not be Varified';
    
    @HttpGet
    global static void doGet(){
        RestResponse response = RestContext.response;
        RestRequest request = RestContext.request;
        
    }
}