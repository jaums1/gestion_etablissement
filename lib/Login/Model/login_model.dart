// import 'package:ecole_plus/Configs/utils/Constant/enums.dart';

class UserModel {

  final int? idUtilisateur;
  int? idEmploye;
  int? idEtablissement;
  String? user;
  String? motDePasse;
  String? statut;
  String? role;


  UserModel({this.idUtilisateur,this.idEmploye,
  this.idEtablissement,this.user,this.motDePasse,
  this.statut,this.role ="user"
  });



///// RECUPERATION
  factory UserModel.fromMap(Map<String,dynamic> data){
    return UserModel(
      idUtilisateur: data.containsKey("ID_Utilisateur")?data["ID_Utilisateur"]??'':'',
      idEmploye: data.containsKey("ID_Employe")?data["ID_Employe"]??'':'',
      idEtablissement: data.containsKey("ID_Etablissement")?data["ID_Etablissement"]??'':'',
      user: data.containsKey("User")?data["User"]??'':'',
      motDePasse: data.containsKey("Password")?data["Password"]??'':'',
      statut: data.containsKey("Satut")?data["Satut"]??'':'',
      role: data.containsKey("Role")?data["Role"]??'':'',
      // dateCreation: data.containsKey("DateCreation")?data["DateCreation"]??'':'',
    );
  }

////// ENVOIE DES DATAS 

 Map<String,dynamic> toMap(){
  return{
    "ID_Employe" : idEmploye,
    "ID_Etablissement" : idEtablissement,
    "User" : user,
    "Password" : motDePasse,
    "Satut": statut,
    "Role": role,
  };
}
  
}