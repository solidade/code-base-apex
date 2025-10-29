/**
 * @author Miqueias Solidade (Convenção/Padrao Java Doc)
 */
public with sharing class Customer {

   /**
    * Atributo da classe
    * static indica que esse atributo deixa de pertencer a instancia, passa a pertencer a classe. Logo, todas as instâncias da classe compartilham desse mesmo valor de atributo (a mesma informação)
    * static deve ser usado com cuidado, dê preferencia sempre a usar instancias ao invés de static
    */
    public static final String PREMIUM_TYPE = 'Premium';

     // Atributos de instância

    public String name;

    public String document;

    public Decimal creditAmount;

    public Boolean isBlocked;

    public Address billingAddress;

    //Construtor: inicializador da classe
    public Customer() {

    }

    // Método que realiza uma ação
    public void addCredit( Decimal amount ){
        if( amount == null) { return; }

        this.creditAmount = amount;
    }

    // Inner Class que pertence à classe Customer
    public class Address {

    }
}