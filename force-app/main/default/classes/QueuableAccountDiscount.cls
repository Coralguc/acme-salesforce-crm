public with sharing class QueuableAccountDiscount implements Queueable {
    String StrRating;
    public QueuableAccountDiscount(String Rating) {
        this.StrRating = Rating;

    }
    public void execute(QueueableContext context) {
        System.debug('Queueable EXECUTING for Rating: ' + StrRating);
        List<Account> accList = [SELECT Id, Name, Rating, Owner.email FROM Account WHERE Rating = :StrRating LIMIT 10000];
        for (Account acc : accList) {
            acc.Discount_Amount__c = 
                (Integer.valueOf(Label.Direct_Hot)) ;// Applying a 10% discount
        }
        update accList;
        // Chain to email helper to send notifications after the discount is applied
        system.enqueueJob(new QueuableEmailHelper(accList));
    }
}


