// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../Data_Json/Controller/niveaujson_controller.dart';


// class THomeView extends StatelessWidget {
//    const THomeView({super.key});


//   @override
//   Widget build(BuildContext context) {
//       final EducationController controller = Get.put(EducationController());
//     return Scaffold(
//       appBar: AppBar(title: Text("Système éducatif")),
//       body: Obx(() {
//         final cycles = controller.systeme.value.cycles;

//         if (cycles.isEmpty) {
//           return Center(child: CircularProgressIndicator());
//         }

//         return ListView(
//           children: cycles.entries.map((entry) {
//             final key = entry.key;
//             final cycle = entry.value;
//             return ExpansionTile(
//               title: Text(cycle.cycle.toString()),
//               subtitle: Text(key),
//               children: cycle.niveaux
//                   !.map((niveau) => ListTile(title: Text(niveau)))
//                   .toList(),
//             );
//           }).toList(),
//         );
//       }),
//     );
//   }
// }
