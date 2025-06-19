class TPricingCalculator{
  TPricingCalculator._();

  /////// CLACUL DE TAXE DE TVA ET LE PRIX
  
  static double calculateTotalPrice(double produitPrice,String location){
   
   double taxRate= getTaxRateForLocation(location);
   double taxAmount=produitPrice* taxRate;

   double shippingCost=getShippingCost(location);

   double totalPrice=produitPrice+taxAmount+shippingCost;
    return totalPrice;
   
  }
  


  ////// Calcul Shipping Cost
  static String calculateShippinCost(double produitPrice,String location){
    double shippingCost=getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }
  
  ////// Calculate Tax
  
  static String calculateTax(double produitPrice,String location){
     double taxRate= getTaxRateForLocation(location);
   double taxAmount=produitPrice* taxRate;
   return taxAmount.toStringAsFixed(2);
  }


static double getTaxRateForLocation(String location){
  return 0.10;
}

static double getShippingCost(String location){
  return 5.00;
}




}