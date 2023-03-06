public class AssetHandler {
   public static void assetHandlerUpdate(List<Asset> AssetTriggerNew, 
                                        List<Asset> AssetTriggerOld,
                                        Map<Id, Asset> AssetTriggerNewMap,
                                        Map<Id,Asset> AssetTriggerOldMap ){
     
        for(asset eachAsset : AssetTriggerNew){
            if(eachAsset.Status =='Shipped'){
                eachAsset.Description = 'Asset is shipped';
                
            }else if(eachAsset.Status == 'Installed'){
                eachAsset.Description = 'Asset is installed';
                
            }else if(eachAsset.Status!=AssetTriggerOldMap.get(eachAsset.id).Status){
                eachAsset.Description.addError('field should not change the description.');
            }
                
            }
        }

                                          

 }
