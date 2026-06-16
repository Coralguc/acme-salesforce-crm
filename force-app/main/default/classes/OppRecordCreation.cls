public with sharing class OppRecordCreation {
    public void OppRecordCreation() {
      
            Opportunity opp = new Opportunity();
            opp.Name = 'Opportunity from VSCODE';
            opp.StageName = 'Prospecting';
            opp.Amount = 150000;
            opp.CloseDate = Date.today().addDays(30);
            try{
                Database.insert(opp, AccessLevel.USER_MODE); 
            }
            catch(Exception e){
                System.debug('Error occurred: ' + e.getMessage());
            }

}
}