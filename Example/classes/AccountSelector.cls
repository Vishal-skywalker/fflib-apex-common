public inherited sharing class AccountSelector extends fflib_SObjectSelector 
{
    public static AccountSelector newInstance() 
    {
        return (AccountSelector) Application.Selector.newInstance(Account.SObjectType);
    }

    public Schema.SObjectType getSObjectType() 
    {
        return Account.SObjectType;
    }

    public virtual List<Schema.SObjectField> getSObjectFieldList() 
    {
        return new List<Schema.SObjectField> {
            Account.Id,
            Account.Name
        };
    }

    public List<Account> selectByIds(Set<Id> accountIdSet) 
    {
        return Database.query(
            newQueryFactory()
            .setCondition('Id IN :accountIdSet')
            .toSOQL()
        );
    }

    public List<AggregateResult> agregateTest() {
        String query = newQueryFactory().groupBy(Account.Rating).sum(Account.AnnualRevenue, 'total').setHaving('SUM(AnnualRevenue) > 20000').toSOQL();
        System.debug('query >>' + query);
        return Database.query(query);
    }
}