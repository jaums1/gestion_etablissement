import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'paginated_data_table.dart';

class TTableau extends StatelessWidget {
  const TTableau({super.key});

  @override
  Widget build(BuildContext context) {
     final controller = Get.put(TDatatables());
    return  Padding(padding: EdgeInsets.all(1),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children:[ 
                TextFormField(
                  onChanged: (query) => controller.searchQuery(query),
                  controller: controller.search,
                  decoration: InputDecoration(
                    hintText: "Recherche",
                    prefixIcon: Icon(Iconsax.search_normal)
                  ),
                ),
                SizedBox(height: 8,),
                Obx(
                (){ 
                  Visibility(visible: false,  child: Text(controller.dataListfiltre.length.toString()));
                  return SizedBox(
                  height: 280,
                  child: TPaginatedDataTable(
                    minWidth: 90,
                    dataRowHeight: 35, //56
                       onPageChanged: (value){},
                      ///// SORTING
                      sortColumnIndex: controller.sortColumnIndex.value,
                      sortAscending: controller.sortAscending.value,
                     
                  
                    columns: [
                    DataColumn2(label: Text("Column 1")),
                    DataColumn(label: Text("Column 2"),onSort: (columnIndex, ascending) =>controller.sortById(columnIndex, ascending),),
                    DataColumn(label: Text("Column 3")),
                    DataColumn(label: Text("Column 4"),onSort: (columnIndex, ascending) =>controller.sortById(columnIndex, ascending),),
                    DataColumn(label: Text("Column 5")),
                    ],
                    source:MapData() , 
                  ),
                );
                }),
  ]),
          ),
        ),
      ),

    );
  }
}


class MapData extends DataTableSource {
  final controller = Get.put(TDatatables());
  @override
  DataRow? getRow(int index) {
  final data =controller.dataList[index];
    return DataRow2(
      onTap: (){},
      selected: true,
      onSelectChanged: (value){},
      cells: [
        DataCell(Text(data["Column 1"]??"")),
        DataCell(Text(data["Column 2"]??"")),
        DataCell(Text(data["Column 3"]??"")),
        DataCell(Text(data["Column 4"]??"")),
        DataCell(Text(data["Column 5"]??"")),
      ]
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount =>controller.dataList.length;

  @override
  
  int get selectedRowCount => 0;
  
}


class TDatatables extends GetxController{
  var dataList = <Map<String,dynamic>>[].obs;
  var dataListfiltre = <Map<String,dynamic>>[].obs;
  
  final sortColumnIndex =1.obs;
  final sortAscending  = true.obs;
  final search        = TextEditingController();
  @override
  void onInit() {
    super.onInit();
      listData();
  }

  void sortById(int columnIndex,bool ascending){
   sortAscending.value =ascending;
   dataListfiltre.sort((a, b) {
    if (ascending) {
      return dataListfiltre[0]["Column 1"].toString().toLowerCase().compareTo(dataListfiltre[0]["Column 1"].toString().toLowerCase());
    }else{
      return dataListfiltre[0]["Column 1"].toString().toLowerCase().compareTo(dataListfiltre[0]["Column 1"].toString().toLowerCase());
    }
   });
  //  this.sortColumnIndex.value=columnIndex;
  }

  void searchQuery(String query){
   dataListfiltre.assignAll(
    dataList.where((items)=>items["Column 1"]!.contains(query.toString().toLowerCase()) )
   );
  }

  void listData(){
    dataList.addAll(
      List.generate(20,(index) =>{
        'Column 1' : "Data ${index+1} -1",
        'Column 2' : "Data ${index+1} -2",
        'Column 3' : "Data ${index+1} -3",
        'Column 4' : "Data ${index+1} -4",
        'Column 5' : "Data ${index+1} -5",
      }
      
        )
    );
    
}
}