public class NewCaseListController {
    public List<Case> getNewCases(){
        List<Case> caseList = Database.query(
            'SELECT Id, CaseNumber FROM Case '
        );

        return caseList;
    }
}