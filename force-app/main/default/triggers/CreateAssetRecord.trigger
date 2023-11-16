trigger CreateAssetRecord on Asset (after insert) {
    if(trigger.isAfter && trigger.isInsert){
        Test_Quetion2.createAsset(trigger.new);
    }
}