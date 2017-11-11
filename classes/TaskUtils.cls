public with sharing class TaskUtils {

	public static void remindOwners(List<Opportunity> lstOpp)
	{
		// code here for creating task to remind opportunity owner
		List<Task> taskList = new List<Task>();
		for(Opportunity opt: lstOpp){
			Task t = new Task(subject='do something', WhatId=opt.Id);
			taskList.add(t);
		}
		insert taskList;

	}
}