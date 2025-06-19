// import 'package:ecole_plus/Configs/utils/Constant/colors.dart';
import 'package:flutter/material.dart';

import '../Configs/utils/Constant/colors.dart';



class TDashboardScreen extends StatelessWidget {
  const TDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: TColors.lightgrey,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(child: 
        DataTable(
          decoration: BoxDecoration(border: Border.all(), color: Colors.white),
          columns:[
            DataColumn(label: Text("Colunm 1")),
            DataColumn(label: Text("Colunm 2")),
            DataColumn(label: Text("Colunm 3")),
            DataColumn(label: Text("Colunm 4")),
          ],
        
         rows:[
          DataRow(cells: [
            DataCell(Text("Cell 1")),
            DataCell(Text("Cell 2")),
            DataCell(Text("Cell 3")),
            DataCell(Text("Cell 4")),
          ]),
         DataRow(cells: [
            DataCell(Text("Cell 1")),
            DataCell(Text("Cell 2")),
            DataCell(Text("Cell 3")),
            DataCell(Text("Cell 4")),
          ]),
        DataRow(cells: [
            DataCell(Text("Cell 1")),
            DataCell(Text("Cell 2")),
            DataCell(Text("Cell 3")),
            DataCell(Text("Cell 4")),
          ]),
          DataRow(cells: [
            DataCell(Text("Cell 1")),
            DataCell(Text("Cell 2")),
            DataCell(Text("Cell 3")),
            DataCell(Text("Cell 4")),
          ]),


         ] )
        
        ,),
      ),
    );
  }
}