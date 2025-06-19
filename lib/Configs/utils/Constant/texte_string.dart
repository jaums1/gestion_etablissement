

import 'package:flutter/material.dart';

class TText{
////// FONTS
static const String fontFamilyPrimary = 'Urbanist';
static const String fontFamilySecond = 'Roboto';
static const String submit="Submit";
static const String appName="Ecole Plus";
static const String tContinue="Continue";


  static const String onBoardingTitle1="Choos your product";
  static const String onBoardingTitle2="Select Payment Method";
  static const String onBoardingTitle3="Delivrer at your door step";

 static const String onBoardingSubTitle1="Welcome to a World of limitless choices - Your perfect Product Awaits! ";
  static const String onBoardingSubTitle2="For Seamless Transactions, choose your Payment Path - Your Convenience, Our Priority! ";
  static const String onBoardingSubTitle3="From Our Doorstep to Yours - Swift, Secure, and Contratless Delivery ";
  
  static const String homeAppBarTitle="Good day for shopping";
  static const String homeAppBarubTitle="Taimoor , Sikander";

///// AUTHENTIFICATION FORM TEXT
static const String firstName="Nom";
static const String lastName="Prenoms";
static const String email="E-mail";
static const String password="Password";
static const String confirpassword="Confirme Password";
static const String newPassword="New Password";
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


////// AUTHENTIFICATION HEADING TEXTE

static const String loginTitle="Content de vous revoir";
static const String loginSubTitle="Utilisez vos identifiants pour vous connecter à votre logiciel.";
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
static const codeEtatblissement ="Code Etablissement";
static const etatblissement ="Etablissement";
static const ville = "Ville";
static const pays = "Pays";
static const adresse = "Adresse";
static const directeur = "Directeur";
static const phoneDirecteur = "Téléphone";
static const siteWeb = "Site Web";
// static const email = TextEditingController();
static const typeEtablissement = "Type Etablissement";
//////REGISTER
static const registerTitle ="Créez votre compte";
static const registerSuperTitle ="Créez un compte Superviseur";
static const registerSubTitle ="Lancez-vous dans l'aventure avec Ecole Plus en créant votre compte.";

////// CONFIGURATION
static const niveauScolaire ="Niveau Scolaire";
static const niveauSerie ="Niveau Serie";
static const serieScolaire ="Serie Scolaire";
static const matiere ="Liste des Matières";
static const matiereCoef ="Liste des Matières Coeficientes";
static const modalitePaiement ="Modalite de Paiement";
static const cycle ="Cycle Scolaire";
static const decoupageScolaire ="Decoupage Scolaire";
static const classe ="Classe";

static List<String> jours = List.generate(31, (index) => "${index+1}".padLeft(2, '0'));

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
  'Côte d’Ivoire','Djibouti','Égypte','Guinée équatoriale','Érythrée','Eswatini','Éthiopie','Gabon','Gambie',
  'Ghana','Guinée','Guinée-Bissau','Kenya','Lesotho','Libéria','Libye','Madagascar','Malawi','Mali',
  'Mauritanie','Maurice','Maroc','Mozambique','Namibie','Niger','Nigéria','Rwanda','Sao Tomé-et-Principe','Sénégal',
  'Seychelles','Sierra Leone','Somalie','Afrique du Sud','Soudan','Soudan du Sud','Tanzanie','Togo','Tunisie',
  'Ouganda','Zambie','Zimbabwe'
];
  static List<String> listTypeEnseignement =["Enseignement Général","Enseignement Technique","Enseignement Professionnelle"];
  static List<String> Sexe =["Homme","Femme"];
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
}