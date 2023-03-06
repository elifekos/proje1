public class Trigger_Map {
    public  Id insertSF_Project() {
        Salesforce_Project__c newSp1 = new Salesforce_Project__c();
        
        insert newSp1;
        return newSp1.Id;
    } 
    public  void updateSF_Project(Id prj_id, String projectName){
        Salesforce_Project__c spProject = [SELECT Id, Project_Name__c FROM Salesforce_Project__c WHERE Id =:prj_id];
        spProject.Project_Name__c = projectName;
        update spProject;
    }   

   
}