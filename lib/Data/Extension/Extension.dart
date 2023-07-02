import '../Model/Product.dart';

extension ProductSExtension on List<Product>
{
 bool exits(Product product){
   for(var i in this)
     {
       if(i.id==product.id){
         return true;
       }
     }
   return false;
 }
}