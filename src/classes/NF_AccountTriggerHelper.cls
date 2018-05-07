/**
* @File Name:   NF_AbstractTriggerHelper.cls
* @Description: Helper Class of NF_AccountTriggerHandler Class
* @Author:      
* @Group:       Apex
* @Modification Log :
*-------------------------------------------------------------------------------------
* Ver       Date        Author      Modification
* 1.0       2017-05-09      Created the file/class
*/
public with sharing class NF_AccountTriggerHelper {
	public static void createContactOnAccountInsert(list<Account> listofaccount){
    	List<Contact> listofcontact = new List<Contact>();
        for(Account objaccount : listofaccount){ //iterating to create a contact for each account
            Contact objcontact = new Contact(LastName = objaccount.name,
                        AccountId=objaccount.id,
                        MailingStreet=objaccount.BillingStreet,
                        MailingCity=objaccount.BillingCity,
                        MailingState=objaccount.BillingState,
                        MailingPostalCode=objaccount.BillingPostalCode,
                        MailingCountry=objaccount.BillingCountry,
                        Fax=objaccount.Fax);
            listofcontact.add(objcontact);
        }
        if(!listofcontact.isEmpty())//If the listofcontact is not empty then insert the contact
        insert listofcontact; //One DML Operation
 
    }
    
    /*
    public static void updateContactOnAccountUpdate(list<Account> listofaccount){	
    System.debug('listofaccount'+listofaccount);	
    Set<Id> setofaccountids = new Set<Id>();	
    	for(Account objaccount : listofaccount){
    	setofaccountids.add(objaccount.Id);
    	}
    System.debug('setofaccountids'+setofaccountids);
     List<Account> listofaccounts = [select Name,
   								          BillingStreet,
   								          BillingCity,
   								          BillingState,
   								          BillingPostalCode,
   								          BillingCountry,
   								          Fax
   								   from Account
   								   where Id IN :setofaccountids];
   								   	
    List<Contact> listofcontact = [select LastName,
    									  Id,
    									  AccountId,
   								          MailingStreet,
   								          MailingCity,
   								          MailingState,
   								          MailingPostalCode,
   								          MailingCountry,
   								          Fax
   								   from Contact
   								   where AccountId IN :setofaccountids];
   								  
  System.debug('listofcontact'+listofcontact); 								   
 Map<Id, List<Contact>> mapAccountContacts = new Map<Id, List<Contact>>();
for (Contact objContact : listofcontact) {
    if (mapAccountContacts.containsKey(objContact.AccountId)) {
	    mapAccountContacts.get(objContact.AccountId).add(objContact);
	}else{
        mapAccountContacts.put(objContact.AccountId, new List<Contact>{objContact});
    }
}
System.debug('mapAccountContacts'+mapAccountContacts);
List<Contact> listContactToUpdate = new List<Contact>();

for (Account objAccount : listofaccounts) {
   if (mapAccountContacts.containskey(objAccount.Id)) {
       List<Contact> listContact = mapAccountContacts.get(objAccount.Id);
	   for (Contact objCon : listContact) {
	   	objCon.LastName = objaccount.name;
	   	objCon.MailingStreet=objaccount.BillingStreet;
		objCon.MailingCity=objaccount.BillingCity;
		objCon.MailingState=objaccount.BillingState;
		objCon.MailingPostalCode=objaccount.BillingPostalCode;
		objCon.MailingCountry=objaccount.BillingCountry;
	    objCon.Fax = objAccount.Fax;
		   listContactToUpdate.add(objCon);
		   
	   }
   }
}

if (!listContactToUpdate.isEmpty()) {
   update listContactToUpdate;
}
   								   
   								  					          
    }*/
}