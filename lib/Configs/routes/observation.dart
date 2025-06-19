
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cammon/widgets/layouts/sidebar/sidebar_controller.dart';
import 'route.dart';

class TObservation extends GetObserver {
  
  @override
  void didPop(Route<dynamic>?  route, Route<dynamic> ? previousRoute) {
    final sidebarcontroller = Get.put(SidebarController());

    if (previousRoute != null) {
        for (var routeName in TRoutes.sidebarMenuItem) {
             if (previousRoute.settings.name == routeName) {
                sidebarcontroller.activedItem.value = routeName;
             }
        }
    }
  }

  // @override
  // void didPush(Route<dynamic>? route, Route<dynamic>? previousRoute) {
  //    final sidebarcontroller = Get.put(SideBarController());
  //    if (route != null) {
  //       for (var routeName in TRoutes.itemsMenu) {
  //            if (route.settings.name == routeName) {
  //               sidebarcontroller.activeItems.value = routeName;
  //            }
  //       }
  //   }
  // }
}