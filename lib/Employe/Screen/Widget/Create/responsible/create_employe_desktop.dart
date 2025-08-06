import 'package:flutter/material.dart';
import '../widget/form_employe.dart';
import '../widget/header_employe.dart';


class TCreateEmployeDesktopScreen extends StatelessWidget {
  const TCreateEmployeDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return HearderEmploye(
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.55,
        child: FormEmploye()
      ),
    );
    
    
    
  }
}

