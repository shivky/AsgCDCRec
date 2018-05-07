/**
* @File Name:   NF_AbstractTriggerHandler.cls
* @Description: Create or Update a Contact whenever an account is either created or updated. 
* @Author:      
* @Group:       Apex
* @Modification Log :
*-------------------------------------------------------------------------------------
* Ver       Date        Author      Modification
* 1.0       2017-05-09      Created the file/class
*/
public with sharing class NF_AccountTriggerHandler extends NF_AbstractTriggerHandler {
	public override void beforeUpdate(){

	}

	public override void afterUpdate(){
	//NF_AccountTriggerHelper.updateContactOnAccountUpdate(trigger.new);
	}

	public override void beforeInsert(){

	}

	public override void afterInsert(){
	NF_AccountTriggerHelper.createContactOnAccountInsert(trigger.new);
	}

	public override void afterDelete(){

	}

	public override void andFinally(){

	}
}