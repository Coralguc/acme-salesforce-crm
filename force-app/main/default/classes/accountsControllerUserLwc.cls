public with sharing class accountsControllerUserLwc {
    

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountsByRating(String rating) {

        if (String.isBlank(rating)) {
            return new List<Account>();
        }

        return [
            SELECT Id, Name, Rating, Phone, Industry
            FROM Account
            WHERE Rating = :rating
            ORDER BY Name
        ];
    }

}