global class DailyLeadProcessor implements Schedulable {
	global void execute(SchedulableContext sc) {
		//MyBatchClass b = new MyBatchClass();
		//database.executebatch(b);
		List<Lead> leadList = [SELECT Id,LeadSource FROM Lead where LeadSource=''];
		List<Lead> leadUpdateList = new List<Lead>();
		for(Lead l : leadList){
			l.LeadSource = 'Dreamforce';
			leadUpdateList.add(l);
		}
		update leadUpdateList;
	}
}