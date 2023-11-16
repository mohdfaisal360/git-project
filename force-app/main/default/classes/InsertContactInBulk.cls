public class InsertContactInBulk {
    public static void assignpermission(List<Contact> conList){
        set<Id> OwnerIds = new set<Id>();
        for(Contact con : conList){
            OwnerIds.add(con.OwnerId);
        }
        getIds(OwnerIds);
    }
    @future
    public static void getIds(set<Id> Ownerids){
        List<PermissionSetAssignment> permissionSetList = new List<PermissionSetAssignment>();
        for(Id idToAssign : Ownerids){ 
            PermissionSetAssignment psa = new PermissionSetAssignment ();
            psa.PermissionSetId = '0PS5i000004iT9EGAU';
                psa.AssigneeId  = idToAssign;
            permissionSetList.add(psa);
        } 
        if(!permissionSetList.isEmpty()){
            insert permissionSetList;
        }
    }
}