/**
* Class Name: CARES_CreateTaskController
* Author: Cognizant Technology Solutions
* Date: 10-Jun-2016
* Requirement # OP-09
* Description: REST resource for creating tasks in Salesforce
*/

@RestResource(urlMapping='/CreateTask/*')
global with sharing class CARES_CreateTaskController {
   
     @HttpPost 
    global static String CreateNewCase()
    {
           //Storing the json in body 
           String body = System.RestContext.request.requestBody.toString();
           //Calling wrapper for deserialize
           CARES_RequestWrapper rw =   CARES_RequestWrapper.parse(body);
           list<task> tlist=new list<task>();
           
           //Map tasks wrappper list into Task object
           for( CARES_RequestWrapper.Tasks obj : rw.Tasks)
           {
                 Task t=new Task();
                  t.OwnerId = obj.owner;
                  t.Subject = obj.subject;
                  t.Priority = obj.priority;
                  t.Status = obj.status;
                  t.Description = obj.description;                 
                  tlist.add(t);
                  System.debug('*** obj.Owner****'+obj.Owner) ; 
           }
        //Insert tlist to create tasks into database.
        insert tlist; 
        return 'Task Created';           
    }
}