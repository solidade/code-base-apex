/**
 * @author msolidade
 */
@isTest
 public with sharing class SObjectTest {
    
    @isTest
    public static void shoulAddError(){

        Account account = new Account ( Name = 'Test' );
        account.addError('Informe o número do cpf/cnpj');

        Assert.isTrue(account.hasErrors());

        Opportunity opportunity = new Opportunity ( Name = 'Test' );
        opportunity.addError('Informe a conta');

        Assert.isTrue(opportunity.hasErrors())
    }
}