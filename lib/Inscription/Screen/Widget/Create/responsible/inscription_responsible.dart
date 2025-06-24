import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import '../../../../../Configs/cammon/widgets/containers/rounded_container_create.dart';
import '../../../../../Configs/utils/Constant/colors.dart';
import '../../../../../Configs/utils/Constant/sizes.dart';
// import '../../../../Controller/inscription_controller.dart';

class TInscriptionResponsible extends StatelessWidget {
  const TInscriptionResponsible({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<TInscriptionController>();

    return TRoundedContainerCreate(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Informations du responsable',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: TColors.dark,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          // TODO: Ajouter les champs de formulaire ici
        ],
      ),
    );
  }
} 