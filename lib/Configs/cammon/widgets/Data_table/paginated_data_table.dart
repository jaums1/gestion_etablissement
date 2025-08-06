import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/Constant/colors.dart';
import '../../../utils/Constant/image_string.dart';
import '../../../utils/Constant/sizes.dart';
import '../../../utils/Popup/animation_loader.dart';

class TPaginatedDataTable extends StatelessWidget {
  const TPaginatedDataTable({super.key, this.sortAscending =true,
    this.sortColumnIndex,
    this.rowsPerPage=10,
    required this.source,
    required this.columns,
    this.onPageChanged,
    this.dataRowHeight=35,
    this.tableHeight, 
    this.minWidth=1500,
    this.showFirstLastButtons =true,
    this.showCheckboxColumn =true
    });

 final bool? sortAscending;

 final int? sortColumnIndex;

 final int? rowsPerPage;

 final DataTableSource source;

 final List<DataColumn> columns;

 final Function(int)? onPageChanged;

 final double? dataRowHeight;

 final double? tableHeight;

 final double? minWidth;

 final bool? showFirstLastButtons;

 final bool? showCheckboxColumn;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tableHeight,
      child: Theme(
        data: Theme.of(context).copyWith(cardTheme: CardTheme(color: Colors.white,elevation: 0,)),
        child: PaginatedDataTable2(
          columns: columns,
           source: source,
           columnSpacing: 12,
           minWidth: minWidth,
           dividerThickness: 0,
           horizontalMargin: 12,
            rowsPerPage:rowsPerPage!,
            availableRowsPerPage: List.generate(20, (int index) => (index+1) * 5, growable: true),
           showFirstLastButtons: showFirstLastButtons!,
           showCheckboxColumn: showCheckboxColumn!,
           sortAscending: sortAscending!,
           onPageChanged: onPageChanged,
           dataRowHeight: dataRowHeight!,
           renderEmptyRowsInTheEnd: false,
           onRowsPerPageChanged: (noodRows){},
           sortColumnIndex: sortColumnIndex,
           headingTextStyle: Theme.of(context).textTheme.titleMedium,
           headingRowColor: WidgetStateProperty.resolveWith((state)=>TColors.primaryBackground),
           headingRowDecoration: BoxDecoration(
           borderRadius: BorderRadius.only(topLeft: Radius.circular(TSizes.borderRaduisMd),
           topRight: Radius.circular(TSizes.borderRaduisMd),)),
           empty:TAnimationLoaderWidget(
            text: 'Aucune donnée disponible',
            animation: TImages.videAnimation,height: 250,width: 250,),
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