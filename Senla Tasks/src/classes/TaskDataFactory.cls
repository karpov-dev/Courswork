/**
 * Created by passa on 21.05.2020.
 */

@IsTest
public with sharing class TaskDataFactory {

    public static Task getTaskWithWhoId(Id id){
        return new Task(WhoId = id);
    }

}