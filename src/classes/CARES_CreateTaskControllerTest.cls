/**
* Class Name: CARES_CreateTaskControllerTest
* Author: Cognizant Technology Solutions
* Date: 10-Jun-2016
* Requirement # OP-09
* Description: Test class for CARES_CreateTaskController
*/

@isTest
private class CARES_CreateTaskControllerTest {
    
    static testMethod void CrateTaskTest1() 
    {      
       //Sample Json Sring with Task data
     String JsonMsg= '{"Tasks":[{"subject":"Test subject","owner":"00555000001WOv0","status":"Not Started","priority":"Normal","description":"test description" }]}';                
   
     RestRequest req = new RestRequest(); 
     RestResponse res = new RestResponse();
     req.requestURI = '/services/apexrest/CreateTask';  //Endpoint
     req.httpMethod = 'POST'; 
     req.requestBody = Blob.valueof(JsonMsg);// Sotre json to request body
     RestContext.request = req;
     RestContext.response= res;     
     String RetValue=CARES_CreateTaskController.CreateNewCase();
      System.assert(RetValue == 'Task Created');
     }
}