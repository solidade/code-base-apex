/**
 * @author Miqueias Solidade
 */
public class PricingService {
   
    FreighService freighService;

    public PricingService() {

        freighService = new FreighService();

    }

    // método original
    // classe PriceAndAvailability não implementada
    public PriceAndAvailability checkPriceAndAvailability ( Account account
                                                        , Product2 product ) {
        
        //do something
        return new PriceAndAvailability(); //retorno mockado temporariamente
    }

     /**
     * Cenário: Atualmente nosso cliente verifica preço e disponibilidade utilizando dados do cliente e do produto, porém ele necessita aplicar novas politicas de frete para vendas internacionais.
     * NOVO METODO
     * Classes FreighService e FreighAmount não implementadas
     */
    public PriceAndAvailability checkPriceAndAvailability ( Account account
                                                        , Product2 product
                                                        , Address shippingAddress ) {

        PriceAndAvailability priceAndAvailability = checkPriceAndAvailability(account , product);

        FreighAmount freighAmont = freighService.applyFreigh(account , product, shippingAddress);

        priceAndAvailability.addFreigh(freighAmont);

        return priceAndAvailability;
    }

    /**
     * Cenário: Atualmente nosso cliente verifica preço e disponibilidade utilizando dados do cliente e do produto, porém ele necessita considerar estoque especial.
     * Novo método (NAO RECOMENDADO)
     * Não é expressivo || A intenção do método deve ser expressiva/clara
     * Dica: evite parametros booleanos quando possível
     */
    public PriceAndAvailability checkPriceAndAvailability ( Account account
                                                        , Product2 product
                                                        , Boolean specialConsumerPrice ) {

        PriceAndAvailability priceAndAvailability = new PriceAndAvailability();

        if(specialConsumerPrice){
            return priceAndAvailability;
        }

        return checkPriceAndAvailability(account , product);
    }

     /**
     * Cenário: Atualmente nosso cliente verifica preço e disponibilidade utilizando dados do cliente e do produto, porém ele necessita considerar estoque especial.
     * Novo método (RECOMENDADO)
     * Aqui a intenção é clara e expressiva, sendo mais indicado do que a sobrecarga nesse cenário.
     * Dica: use nomes expressivos
     */
    public PriceAndAvailability checkPriceAndAvailabilityWithSpecialStock ( Account account
                                                        , Product2 product ) {

        PriceAndAvailability priceAndAvailability = new PriceAndAvailability();

        return priceAndAvailability;
    }
}