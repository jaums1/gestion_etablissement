import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/Constant/colors.dart';
import '../../../utils/Constant/sizes.dart';

class TDataTable extends StatelessWidget {
  const TDataTable({super.key,
   this.sortAscending=true,
    this.sortColumnIndex,
    required this.rows,
    required this.columns,
    this.onPageChanged,
    this.dataRowHeight=35,
    this.tableHeight=10, 
    this.minWidth=600,
    this.showCheckboxColumn =false,
     this.onSelectAll,
     this.headingRowHeight=40.0
    });

 final bool? sortAscending;

 final int? sortColumnIndex;


 final List<DataRow> rows;

 final List<DataColumn> columns;

 final Function(int)? onPageChanged;

 final double? dataRowHeight;

 final double? tableHeight;

 final double? minWidth;

 final double? headingRowHeight;


 final bool? showCheckboxColumn;

 final ValueChanged ? onSelectAll;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tableHeight,
      child: Theme(
        data: Theme.of(context).copyWith(cardTheme: CardTheme(color: Colors.white,elevation: 0,)),
        child: DataTable2(
          horizontalScrollController: ScrollController(),
          headingRowHeight:headingRowHeight,
          columns: columns,
           rows: rows,
           columnSpacing: 12,
           minWidth: minWidth,
           dividerThickness: 0,
           horizontalMargin: 12,
           showCheckboxColumn:showCheckboxColumn!,
           sortAscending: sortAscending!,
           dataRowHeight: dataRowHeight!,
           onSelectAll:onSelectAll,   
           sortColumnIndex: sortColumnIndex,
           headingTextStyle: Theme.of(context).textTheme.titleMedium,
           headingRowColor: WidgetStateProperty.resolveWith((state)=>TColors.primaryBackground),
           headingRowDecoration: BoxDecoration(
           borderRadius: BorderRadius.only(topLeft: Radius.circular(TSizes.borderRaduisMd),
           topRight: Radius.circular(TSizes.borderRaduisMd),)),
           empty:Text("Vide")    ,//TAnimationLoaderWidget(animation: TImages.docerAnimation,height: 150,width: 150,),
           sortArrowBuilder: (ascending, sorted) {
              if (sorted) {
            return Icon(ascending ? Iconsax.arrow_up_3 : Iconsax.arrow_down,size: TSizes.iconSm,);
            }else{
            return Icon(Iconsax.arrow_3,size: TSizes.iconSm,);
            }},

           ),
      ),
    );
  }
}