public with sharing class Application 
{
    public static final fflib_Application.SelectorFactory Selector = new fflib_Application.SelectorFactory
    (
        new Map<SObjectType, type> 
        {
            Account.SObjectType => AccountSelector.Class
        }
    );
}