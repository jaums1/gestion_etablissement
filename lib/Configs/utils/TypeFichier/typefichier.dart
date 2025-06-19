class TTypeFichier {

 static  bool isNetworkFile(String path) {
  return path.startsWith('http://') || path.startsWith('https://');
}



}