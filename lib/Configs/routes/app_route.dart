import 'package:ecole/Configuration/Screen/configuration.dart';
import 'package:ecole/Employe/Screen/Widget/Create/employe_eleve_principal.dart';
import 'package:get/get.dart';

import '../../Classe/Screen/Widget/Create/classe_create_principal.dart';
import '../../Classe/Screen/Widget/view/classe_screen_principale.dart';
import '../../Cycle/Screen/cycle_principal.dart';
import '../../Eleves/Screen/Widget/Create/create_eleve_principal.dart';
import '../../Eleves/Screen/eleve_principale.dart';
import '../../Employe/Screen/employe_principale.dart';
import '../../Etablissement/Screen/etablissement.dart';
import '../../Inscription/Screen/Widget/Create/create_inscription_principal.dart';
import '../../Inscription/Screen/Widget/Details/details_inscription_principal.dart';
import '../../Inscription/Screen/Widget/view/inscription_screen_principale.dart';
import '../../Login/Screen/Widget/widget Code Etatblissement/code_etablissement.dart';
import '../../Login/Screen/Widget/widget register/register.dart';
import '../../Login/Screen/login.dart';
import '../../Matiere/Screen/matiere.dart';
import '../../Menu/menu_principale.dart';
import '../../Niveau_Scolaire/Screen/niveauscolaire.dart';
import '../../Scolarite/Screen/Widget/Create/create_scolarite_principal.dart';
import '../../Scolarite/Screen/Widget/update/update_scolarite_principal.dart';
import '../../Scolarite/Screen/Widget/view/scolarite_screen_principale.dart';
import '../../Serie/Screen/serie_scolaire.dart';
import '../../Versement/Screen/Widget/Create/versement_create_principal.dart';
import 'route.dart';

class TAppRoute {
  static final List<GetPage> page = [
    GetPage(name: TRoutes.login, page: ()=>const  TLoginScreen()),
    GetPage(name: TRoutes.codeEtablissement, page: ()=>  const TCodeEtablissementScreen()),
    GetPage(name: TRoutes.register, page: ()=>const TRegisterScreen()),
    GetPage(name: TRoutes.menu, page: ()=> TMenuPrincipalScreen(),fullscreenDialog: true),
    GetPage(name: TRoutes.niveauScolaire, page: ()=>const TNiveauScolaireScreen()),
    GetPage(name: TRoutes.matiere, page: ()=> TMatiereScolaireScreen()),
    GetPage(name: TRoutes.cycle, page: ()=>const TCyclePrincipalScreen()),
    GetPage(name: TRoutes.serieScolaire, page: ()=>const TSerieScolaireScreen()),
    GetPage(name: TRoutes.etablissement, page: ()=>const TEtablissementScolaireScreen()),
    GetPage(name: TRoutes.configuration, page: ()=>const TConfigurationScreen()),
    GetPage(name: TRoutes.eleve, page: ()=>const TElevePrincipaleScreen()),
    GetPage(name: TRoutes.registereleve, page: ()=>const TCreateElevePrincipaleScreen()),
    //// EMPLOYE
    GetPage(name: TRoutes.employe, page: ()=>const TEmployePrincipaleScreen()),
    GetPage(name: TRoutes.registeremploye, page: ()=>const TCreateEmployePrincipaleScreen()),
    
    //// CLASSE
    GetPage(name: TRoutes.classe, page: ()=>const TClassePrincipaleScreen()),
    GetPage(name: TRoutes.registerclasse, page: ()=>const TCreateClassePrincipaleScreen()),
    
    //// SCOLARITE
    GetPage(name: TRoutes.scolarite, page: ()=>const TScolaritePrincipaleScreen()),
    GetPage(name: TRoutes.registerscolarite, page: ()=>const TCreateScolaritePrincipaleScreen()),
    GetPage(name: TRoutes.updatecolarite, page: ()=>const TUpdateScolaritePrincipaleScreen()),

    //// INSCRIPTION
    GetPage(name: TRoutes.inscription, page: ()=>const TInscriptionScreenPrincipale()),
    GetPage(name: TRoutes.registerinscription, page: ()=>const TCreateInscriptionPrincipal()),
    GetPage(name: TRoutes.detailsinscription, page: ()=>const TDetailsInscriptionPrincipal()),

    //// VERSEMENT
    GetPage(name: TRoutes.registerversement, page: ()=>const TCreateVersementPrincipaleScreen()), 
  
  ]; 
}

