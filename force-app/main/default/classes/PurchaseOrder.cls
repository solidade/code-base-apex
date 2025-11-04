/**
 * @author Miqueias Solidade
 */
public class PurchaseOrder {

    Account account;

    String purchaseOrderNumber;

    Date needByDate;

    Address billingAddress;

    Address shippingAddress;

    List<Item> items;

    public PurchaseOrder() {
        this.items = new List<Item>();
        this.needByDate = Date.today(); //Se houver necessidade de especificar, pode ser criado um set
    }

    public PurchaseOrder( String purchaseOrderNumber 
                        , Account account ) {

        this();
        this.purchaseOrderNumber = purchaseOrderNumber;
        this.account = account;

    }

    // Idealmente não ultrapassar 3 parâmetros em constructors ou metodos
    public PurchaseOrder( String purchaseOrderNumber 
                        , Account account
                        , Address billingAddress ) {

        this(purchaseOrderNumber , account);
        this.billingAddress = billingAddress;
    }

    // Cuidado com a quantidade de sobrecarga, pode ficar confuso navegar e compreeender o código
    public PurchaseOrder( String purchaseOrderNumber 
                        , Account account
                        , Address billingAddress
                        , Address shipingAddress ) {

        this(purchaseOrderNumber , account , billingAddress);
        this.shipingAddress = shipingAddress;
    }

    public void addItem(Item item){
        this.items.add(item);
    }

    public class Address{

        public String street;
        public String streetNumber;
        public String additionalInfo;
        public String zipCode;
        public String city;
        public String state;

    }

    // Classe implementada com o padrão Builder para facilitar a construção dos itens
    // O padrão usa o conceito de Fluent Interface, que dá a capacidade fazer chamadas intercadeadas de métodos, usando a estratégia de retornar sempre a instancia da classe com (with) uma nova informação.
    public class Item{

        public String id;
        public String productCode;
        public String description;
        public String pricebookEntryId;
        public Decimal quantity;
        public Decimal price;


        public Item withId(String id){
            this.id = id;
            return this;
        }

        public Item withIProductCode(String productCode){
            this.productCode = productCode;
            return this;
        }

        public Item withDescription(String description){
            this.description = description;
            return this;
        }

        public Item withPricebookEntryId(String pricebookEntryId){
            this.pricebookEntryId = pricebookEntryId;
            return this;
        }

        public Item withQuantity(String quantity){
            this.quantity = quantity;
            return this;
        }

        public Item withPrice(String price){
            this.price = price;
            return this;
        }

    }
}