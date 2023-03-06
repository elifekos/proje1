trigger AssetTrigger on Asset (before insert, before update) {
    //call handler class for asset
    
 if(trigger.isBefore ){
    AssetHandler.assetHandlerUpdate(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
 }

}