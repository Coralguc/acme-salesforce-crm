public with sharing class QueuableEmailHelper implements Queueable {
    List<Account> accList;  
    public QueuableEmailHelper(List<Account> accList) {
        this.accList = accList;
    }
    public void execute(QueueableContext context) {
        List<Messaging.SingleEmailMessage> emailMessages = new List<Messaging.SingleEmailMessage>();
        for (Account acc : accList) {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new String[] {acc.Owner.Email});
            email.setSubject('Account Update Notification');
            email.setPlainTextBody('The account ' + acc.Name + ' has been updated. Please review the changes.');
            emailMessages.add(email);
        }
        if (!emailMessages.isEmpty()) {
            Messaging.sendEmail(emailMessages);
        }
    }
}