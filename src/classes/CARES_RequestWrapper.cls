/**
* Class Name: CARES_CreateTaskControllerTest
* Author: Cognizant Technology Solutions
* Date: 10-Jun-2016
* Requirement # OP-09
* Description: Wrapper class to deserialize json for CARES_CreateTaskController class
*/

global  without sharing class CARES_RequestWrapper {
   
   //Create wrapepr for json fields/properties
    global  without sharing class Tasks {
        public String owner;
        public String subject;
        public String status;
        public String priority;
        public String description;
    }

    public List<Tasks> Tasks;
  
   //method used for deserialize the input json
    public static CARES_RequestWrapper parse(String json) {
      return (CARES_RequestWrapper) System.JSON.deserialize(json, CARES_RequestWrapper.class);

    }
}