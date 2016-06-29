/**
* Class Name: CARES_CreateContactTest
* Author: Cognizant Technology Solutions
* Date: 01-Jun-2016
* Requirement # OP-09, PA-24, PA-116
* Description: Test class to check asserts for Customer and HCP for single & bulk action, positive & negative scenarios in addition to update and delete action.
*/



@isTest
public class CARES_CreateContactTest {
     
    /**
    * Description: Test for single action and positive behaviour to verify single record produce the correct result.
    */
   
    public static testMethod void createContact() {
    // Instantiate a new contact object, and set values for custom fields
    Contact con1 = new Contact(Salutation='Dr.',FirstName='Test', LastName='lastname', MiddleName='Test',
                      Suffix='Test',CARES_PreferredName__c='NickName',CARES_DateofBirth__c='1', CARES_MonthofBirth__c='June',CARES_YearofBirth__c='1981',CARES_PrimaryPhoneType__c='Home',
                      CARES_SecondaryPhoneType__c='Mobile',OtherPhone='1234567890',CARES_TertiaryPhoneType__c='123',
                      MailingStreet='123',MailingCity='New Street', MailingState='California', MailingCountry='India',
                      MailingPostalCode='12345', Email='Test@Test.com', Phone='1234567890',CARES_PhoneExtension__c='321',
                      CARES_PhoneBestTimeToCall__c='7AM-11AM', CARES_PhoneTimeZone__c='Pacific',CARES_PhonePreferred__c=False,
                      Fax='9876543210', CARES_FaxExtension__c='321', CARES_FaxBestTimeToCall__c='7AM-11AM',
                      CARES_FaxTimeZone__c='321',CARES_FaxPreferred__c=True,CARES_MedDocNumber__c='3213213213',
                      CARES_MedDocExtension__c='987',CARES_MedDocBestTimeToCall__c='7AM-11AM',CARES_MedDocTimeZone__c='Mountain',
                      CARES_MedDocPreferred__c=False,CARES_MedDocFaxNumber__c='4324324321',CARES_MedDocFaxExtension__c='987',
                      CARES_MedDocFaxBestTimeToCall__c='7AM-11AM',CARES_MedDocFaxTimeZone__c='Samoa',
                      CARES_MedDocFaxPreferred__c=False);
     insert con1;
        
     // Check values are saved in database
     Contact con2 = [SELECT Id, Salutation, FirstName, LastName,MiddleName, Suffix,
                      CARES_PreferredName__c,CARES_DateofBirth__c, CARES_MonthofBirth__c,CARES_YearofBirth__c, CARES_PrimaryPhoneType__c, CARES_SecondaryPhoneType__c,
                      OtherPhone, CARES_TertiaryPhoneType__c, MailingStreet, MailingCity,
                      MailingState, MailingCountry, MailingPostalCode, Email, Phone, CARES_PhoneExtension__c,
                      CARES_PhoneBestTimeToCall__c, CARES_PhoneTimeZone__c, CARES_PhonePreferred__c,
                      Fax, CARES_FaxExtension__c, CARES_FaxBestTimeToCall__c, CARES_FaxTimeZone__c,
                      CARES_FaxPreferred__c, CARES_MedDocNumber__c, CARES_MedDocExtension__c,
                      CARES_MedDocBestTimeToCall__c, CARES_MedDocTimeZone__c, CARES_MedDocPreferred__c,
                      CARES_MedDocFaxNumber__c, CARES_MedDocFaxExtension__c, CARES_MedDocFaxBestTimeToCall__c,
                      CARES_MedDocFaxTimeZone__c, CARES_MedDocFaxPreferred__c FROM Contact];

        System.assertEquals('NickName', con2.CARES_PreferredName__c);
        System.assertEquals('1', con2.CARES_DateofBirth__c);
        System.assertEquals('June', con2.CARES_MonthofBirth__c);
        System.assertEquals('1981', con2.CARES_YearofBirth__c);
        System.assertEquals('Pacific', con2.CARES_PhoneTimeZone__c);
        System.assertEquals('12345', con2.MailingPostalCode);
        System.assertEquals('987', con2.CARES_MedDocExtension__c);
        System.assertEquals('7AM-11AM', con2.CARES_MedDocFaxBestTimeToCall__c);
        System.assert(False == con2.CARES_MedDocFaxPreferred__c);
    }

    
    /**
    * Description: Test for bulk action to verify bulk cases invoked for 1 to 200 records, produce correct resultrecord produce the correct result.
    */

    public static testMethod void createBulkContact() {
        Double totalContacts = 0;
        final Double maxContacts = 200;
           
        System.debug('Inserting 200 Contact records... (bulk validation)');
        List<Contact> conLst = new List<Contact>();
        for(integer i=0; i<200; i++) {
            conLst.add( new Contact(Salutation='Dr.',FirstName='Test'+i, LastName='lastname', MiddleName='Test',
                      Suffix='Test',CARES_PreferredName__c='NickName',CARES_DateofBirth__c='1', CARES_MonthofBirth__c='JUNE',CARES_YearofBirth__c='1981',CARES_PrimaryPhoneType__c='Home',
                      CARES_SecondaryPhoneType__c='Mobile',OtherPhone='1234567890',CARES_TertiaryPhoneType__c='123',
                      MailingStreet='123',MailingCity='New Street', MailingState='California', MailingCountry='India',
                      MailingPostalCode='12345', Email='Test@Test.com', Phone='1234567890',CARES_PhoneExtension__c='321',
                      CARES_PhoneBestTimeToCall__c='7AM-11AM', CARES_PhoneTimeZone__c='Pacific',CARES_PhonePreferred__c=False,
                      Fax='9876543210', CARES_FaxExtension__c='321', CARES_FaxBestTimeToCall__c='7AM-11AM',
                      CARES_FaxTimeZone__c='321',CARES_FaxPreferred__c=True,CARES_MedDocNumber__c='3213213213',
                      CARES_MedDocExtension__c='987',CARES_MedDocBestTimeToCall__c='7AM-11AM',CARES_MedDocTimeZone__c='Mountain',
                      CARES_MedDocPreferred__c=False,CARES_MedDocFaxNumber__c='4324324321',CARES_MedDocFaxExtension__c='987',
                      CARES_MedDocFaxBestTimeToCall__c='7AM-11AM',CARES_MedDocFaxTimeZone__c='Samoa',
                      CARES_MedDocFaxPreferred__c=False));
        }
        insert conLst;
        
        //fetch and count all inserted contacts
        for(Contact c:[SELECT CARES_PreferredName__c  FROM Contact
            WHERE CARES_PreferredName__c != null AND Email = 'Test@Test.com']) {
                totalContacts++;
            }
        System.assertEquals(maxContacts, totalContacts );
    
    } 

    /**
    * Description: Test for negative behaviour to verify invalid phone no.
    */

    public static testMethod void invalidPhoneNumber() {
        Contact con2 = new Contact();
        con2.LastName = 'lastname';
        con2.Phone = '0qwert112'; //This should throw error
        try {
            insert con2;
        } catch (DmlException e) {
            //Assert Status Code
            System.assertEquals('FIELD_CUSTOM_VALIDATION_EXCEPTION' ,
            e.getDmlStatusCode(0));
        } //catch
    }
     
        
    /**
    * Description: Test for negative behaviour to verify missing last name
    */
    
    public static testMethod void lastNameMissing() {
        Contact con3 = new Contact();
        con3.LastName = '';//This should throw error
        try {
            insert con3;
        } catch (DmlException e) {
            //Assert Status Code
            System.assertEquals('FIELD_CUSTOM_VALIDATION_EXCEPTION' ,
            e.getDmlStatusCode(0));
        }
    }
    
    /**
    * Description: Test for negative behaviour to verify incorrect dates in month.
    */
     public static testMethod void incorrectBirthDates() {
        Contact con4 = new Contact();
        con4.LastName = 'lastname5';
        con4.CARES_DateofBirth__c = '31'; //This should throw error
        con4.CARES_MonthofBirth__c = 'June';
        try {
            insert con4;
        } catch (DmlException e) {
            //Assert Status Code
            System.assertEquals('FIELD_CUSTOM_VALIDATION_EXCEPTION' ,
            e.getDmlStatusCode(0));
        } //catch
    }
    
    /**
    * Description: Test for negative behaviour to verify date of birth is not more than 125 years.
    */
     public static testMethod void incorrectBirthYears() {
        Contact con5 = new Contact();
        con5.LastName = 'lastname4';
        con5.CARES_DateofBirth__c = '1'; //This should throw error
        con5.CARES_MonthofBirth__c = 'June';
        con5.CARES_YearofBirth__c = '1800'; 
        try {
            insert con5;
        } catch (DmlException e) {
            //Assert Status Code
            System.assertEquals('INVALID_OR_NULL_FOR_RESTRICTED_PICKLIST' ,
            e.getDmlStatusCode(0));
        } //catch
    }
    
    
    /**
    * Description: Test for update action.
    */

    public static testMethod void updateContact() {
        Contact con1 = new Contact(LastName='lastname',Email='Test@Test.com',CARES_YearofBirth__c='1981');
        insert con1;
        Contact con2 = [SELECT Id, Email FROM Contact];
        con2.Email = 'TestUpdate@Test.com';
        update con2;
        System.assertEquals('TestUpdate@Test.com',con2.Email);
    }
    
    /**
    * Description: Test for delete action.
    */

    public static testMethod void deleteContact() {
        Contact con1 = new Contact(LastName='lastname',CARES_YearofBirth__c='1981');
        insert con1;
        delete con1;
        
        Contact deletedContact = [SELECT Id, IsDeleted FROM Contact WHERE Id = :con1.Id ALL ROWS];
        System.assert(deletedContact.IsDeleted == True);
    }
}