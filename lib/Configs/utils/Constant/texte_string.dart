import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TText{
////// FONTS
static const String fontFamilyPrimary = 'Urbanist';
static const String fontFamilySecond = 'Roboto';
static const String submit="Submit";
static const String appName="Ecole Plus";
static const String tContinue="Continue";

///// BOUTON ET MESSAGE DE BOUTON
static  String annuler = "Annuler".tr;
static  String enregistrer = "Enregistrer".tr;
static  String modifier = "Modifier".tr;
static  String supprimer= "Supprimer".tr;
static  String suppression= "Suppression".tr;
static  String messageEnregistrer = "Vos données ont été enregistrées".tr;
static  String messageModifier = "Vos données ont été modifiée".tr;
static  String messageSupprimer = "Voulez-vous vraiment supprimer cette ligne ?".tr;

///// MESSAGE DE CHARGEMENT
static  String messageEnregistrerChargement = "Enregistrement encours...".tr;
static  String messageModifierChargement = "Modification encours...".tr;
static  String messageSuppressionChargement = "Suppression encours...".tr;
static  String messageAnnulationChargement = "Annulation encours...".tr;

///// MESSAGE D'ERREUR
static  String messageErreur = "Veuillez verifier votre connexion internet".tr;
static  String erreur = "Erreur".tr;
///// AUTHENTIFICATION FORM TEXT
static const String firstName="Nom";
static const String lastName="Prenoms";
static const String email="E-mail";
static const String password="Password";
static const String confirpassword="Confirme Password";

//////NIVEAU SERIE
static  String rechcercheNiveauSerie="Rechercher Niveau / Série".tr;

 ////MATIERE
static  String libMatiere="Matière".tr;
static  String codeMatiere="Code Matière".tr;
static  String rechcercheMatiere="Rechercher une Matière".tr;
static  String matiereMessage="Veuillez entrer votre matière".tr;
static  String matiereExitseMessage="La matière existe déjà".tr;

///// ANNEE SCOLAIRE
static  String libAnneeScolaire="Annee Scolaire".tr;
static  String saveAnneeScolaire="Enregistrer Annee Scolaire".tr;
static  String rechcercheAnneeScolaire="Rechercher une année scolaire".tr;
static  String anneeScolaireMessage="Veuillez entrer votre année scolaire".tr;
static  String anneeScolaireExitseMessage="L'année scolaire existe déjà".tr;

////// COEFFICIENT
static  String libCoefficient="Coefficient".tr;
static  String coefficientMessage="Veuillez entrer un coefficient superieur à zéro".tr;

///// DATE 
static  String dateDebut="Date Debut".tr;
static  String dateFin="Date Fin".tr;



//// LOGIN   
static  String seSouvenir="Se souvenir de moi".tr;
static  String votrecode="Avez vous votre code?".tr;
static  String connexion="Connexion".tr;
static  String loginTitle="Content de vous revoir".tr;
static  String loginSubTitle="Utilisez vos identifiants pour vous connecter à votre logiciel.".tr;



static const String userName="Utilisateur";
static const String phoneNo="Phone Number";
static const String rememberMe="Remember Me";
static const String forgetPassword="Forget Password?";
static const String signin="Sign in";
static const String createAccount="Create Account";
static const String orSignInWith="Or sign in with";
static const String orSignUpWith="Or sign up with";
static const String iAgreeTo="I agree to";
static const String privacyPolicy="Privacy Policy";
static const String termsOfUse="Termes of use";
static const String verificationCode="Verification Code";
static const String resendEmail="Resend Email";
static const String resendEmailIn="Resend Email In";

///// FORMULAIRE
static String registerTitle ="Créez votre compte".tr;
static String registerSuperTitle ="Créez un compte Superviseur";
static String registerSubTitle ="Lancez-vous dans l'aventure avec Ecole Plus en créant votre compte.".tr;
static String phone1 ="Téléphone 1".tr;
static String phone2 ="Téléphone 2".tr;
static String phone ="Téléphone".tr;
static String codeEtatblissement ="Code Etablissement".tr;
static String etatblissement ="Etablissement".tr;
static String ville = "Ville".tr;
static String pays = "Pays".tr;
static String adresse = "Adresse".tr;
static String situationGeo = "Situation Géographique".tr;
static String coordonnee = "Coordonnée".tr;
static String information = "Information".tr;
static String validation = "Validation".tr;
static String niveauScolaire = "Niveau scolaire".tr;
static String seleclniveauScolaire = "Selectionner votre niveau scolaire".tr;
static String recherche = "Recherche".tr;
static String add = "Ajouter".tr;

static const siteWeb = "Site Web";

static const typeEtablissement = "Type Etablissement";

//////// TITRE DES FENETRES
 static const configuration ="Configuration";
 static const enregistrement ="Enregistrement";
 static const modification ="Modification";

////// AUTHENTIFICATION HEADING TEXTE


static const String signUpTitle="let's create your account";
static const String forgetPasswordTitle="Forget Password";
static const String forgetPasswordSubTitle="Don't worry sometimes people can forget too, enter your email and we will send your a password reset link";
static const String changeYourPasswordTitle="Password reste email sent";
static const String changeYourPasswordSubTitle="Your account security is Our Priority! We've send You a secure link to Safely change Your Password and Keep your account protected ";
static const String confirmEmailTitle="Verify your email address!";
static const String confirmEmailSubTitle="Congratulation! Your account Awaits : Verifiy your email to start Shopping Your Experience a Word of Unrivaled Deals and Personalized offers.";
static const String emailNotReceiveMessageTitle="Didn't get the email? Check your junk/span resend it.  ";
static const String yourAccountCreatedTitle="Your account successfully creaded!.";
static const String yourAccountCreatedSubTitle="Welcome to your ultimate Shopping Destination : Your Account is Created, Unleash the Joy of Seamless Online Shopping. ";
static const String and="and";
static const String done="done";
static const String supportEmail="albansetin1@gmail.com";
static const String searchInStore="Search in store";

//////CODE ETABLISSEMENT
static const codeEtatblissementTitle ="Code Etablissement";
static const codeEtatblissementSubTitle ="Utilisez le code que vous avez reçu enfin de créer votre compte.";

//////REGISTER

////// CONFIGURATION
static String niveauSerie ="Niveau Serie".tr;
static String serieScolaire ="Serie Scolaire".tr;
static String matiere ="Liste des Matières".tr;
static String matiereCoef ="Liste des Matières Coeficientes".tr;
static String modalitePaiement ="Modalite de Paiement".tr;
static String cycle ="Cycle Scolaire".tr;
static String decoupageScolaire ="Decoupage Scolaire".tr;
static String classe ="Classe".tr;

static List<String> jours = List.generate(31, (index) => "${index+1}".padLeft(2, '0'));
static List<String> Annees = List.generate(10, (index) => "${DateTime.now().year-index-1} - ${DateTime.now().year-index}");

static const List<String> mois = [
  "Janvier",
  "Février",
  "Mars",
  "Avril",
  "Mai",
  "Juin",
  "Juillet",
  "Août",
  "Septembre",
  "Octobre",
  "Novembre",
  "Décembre"
];

static const List<String> tabs=["Sport",'Furniture',"Electronics","Clothes","Cosmetics"];
static final List<Widget> tabsWidget= [const Tab(child: Text("Sport")),const Tab(child: Text('Furniture')),const Tab(child: Text('Electronics')),const Tab(child: Text('Clothes')),const Tab(child: Text('Cosmetics'))];
static List<String> listPays = ['Algérie','Angola','Bénin','Botswana','Burkina Faso','Burundi','Cabo Verde',
  'Cameroun','République centrafricaine','Tchad','Comores','République du Congo','République démocratique du Congo',
  "Côte d'Ivoire",'Djibouti','Égypte','Guinée équatoriale','Érythrée','Eswatini','Éthiopie','Gabon','Gambie',
  'Ghana','Guinée','Guinée-Bissau','Kenya','Lesotho','Libéria','Libye','Madagascar','Malawi','Mali',
  'Mauritanie','Maurice','Maroc','Mozambique','Namibie','Niger','Nigéria','Rwanda','Sao Tomé-et-Principe','Sénégal',
  'Seychelles','Sierra Leone','Somalie','Afrique du Sud','Soudan','Soudan du Sud','Tanzanie','Togo','Tunisie',
  'Ouganda','Zambie','Zimbabwe'
];
  static List<String> listTypeEnseignement =["Enseignement Général","Enseignement Technique","Enseignement Professionnelle"];
  static List<String> Sexe =["Homme","Femme"];
  static List<String> MethodePaiement=["espèces","chèque","Mobile Moneny" ];
  static List<String> nationalites = [
  'Ivoirienne',
  'Béninoise',
  'Burkinabè',
  'Camerounaise',
  'Centrafricaine',
  'Congolaise (RDC)',
  'Congolaise (RC)',
  'Gabonaise',
  'Ghanéenne',
  'Guinéenne',
  'Malienne',
  'Nigérienne',
  'Nigériane',
  'Sénégalaise',
  'Tchadienne',
  'Togolaise',
  'Sud-africaine',
  'Égyptienne',
  'Marocaine',
  'Algérienne',
  'Tunisienne',

  'Française',
  'Belge',
  'Canadienne',
  'Américaine',
  'Brésilienne',
  'Allemande',
  'Espagnole',
  'Italienne',
  'Chinoise',
  'Indienne',
  'Japonaise',
];


/////// TITRE FORMULAIRE
static const String eleve ="Elève";
}