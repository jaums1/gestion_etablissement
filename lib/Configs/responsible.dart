import 'package:flutter/material.dart';
import 'cammon/widgets/containers/rounded_container.dart';
import 'cammon/widgets/layouts/templates/site_template.dart';

class ResponsiveDesignScreen extends StatelessWidget {
  const ResponsiveDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TSiteTemplate(desktop: Desktop(),mobile: Mobile(),tablet: Tablette(),);
  }
}

class Desktop extends StatelessWidget {
  const Desktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TRoundedContainer(
            height: 450,
            width: 300,
            backgroundColor: Colors.blue.withValues(alpha: 0.2),
            child: Center(child: Text("Box 1")),
          ),
        ),
        const SizedBox(width: 20,),
         Expanded(
          flex: 2,
           child: TRoundedContainer(
            height: 450,
            backgroundColor: Colors.blue.withValues(alpha: 0.2),
            child: Center(child: Text("Box 1")),),
            ),
        const SizedBox(width: 20,), 
        TRoundedContainer(
          height: 450,
          backgroundColor: Colors.blue.withValues(alpha: 0.2),
          child: Center(child: Text("Box 1")),
        ),
        const SizedBox(width: 20,),
      ],
    );
  }
}

class Tablette extends StatelessWidget {
  const Tablette({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}




class Mobile extends StatelessWidget {
  const Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
             TRoundedContainer(
              height: 190,
              width: double.infinity,
              backgroundColor: Colors.blue.withValues(alpha: 0.2),
              child: Center(child: Text("Box 1")),
              ),
              const SizedBox(height: 20,),
      
              TRoundedContainer(
              height: 190,
              width: double.infinity,
              backgroundColor: Colors.orange.withValues(alpha: 0.2),
              child: Center(child: Text("Box 2")),
              ),
              const SizedBox(height: 20,),
              
              TRoundedContainer(
              height: 190,
              width: double.infinity,
              backgroundColor: Colors.red.withValues(alpha: 0.2),
              child: Center(child: Text("Box 3")),
              ),
              const SizedBox(height: 20,),    
      
              TRoundedContainer(
              height: 190,
              width: double.infinity,
              backgroundColor: Colors.green.withValues(alpha: 0.2),
              child: Center(child: Text("Box 4")),
              ),
              const SizedBox(height: 20,),
              
        ],
      ),
    );
  }
}