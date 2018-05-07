trigger NF_AccountTrigger on Account (after insert, 
 	before insert, 
	before update, 
	before delete, 
	after update, 
	after delete, 
	after undelete) {
	NF_TriggerFactory.CreateHandlerAndExecute(Account.sObjectType);
	}