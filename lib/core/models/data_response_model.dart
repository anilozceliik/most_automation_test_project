class DataResponseModel {
  int? id;
  String? tarihBaslama;
  String? tarihBitis;
  double? teorikMiktar;
  double? pratikMiktar;
  String? formulAd;
  String? formulNo;

  DataResponseModel(
      {this.id,
      this.tarihBaslama,
      this.tarihBitis,
      this.teorikMiktar,
      this.pratikMiktar,
      this.formulAd,
      this.formulNo});

  DataResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    tarihBaslama = json['TarihBaslama'];
    tarihBitis = json['TarihBitis'];
    teorikMiktar = json['TeorikMiktar'];
    pratikMiktar = json['PratikMiktar'];
    formulAd = json['FormulAd'];
    formulNo = json['FormulNo'];
  }
}
