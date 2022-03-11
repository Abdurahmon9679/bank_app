class CardModel{
  String id;
  String userName;
  String seriesNumber;
  String cvv2;
  String expireDate;

  CardModel(this.id, this.userName, this.seriesNumber, this.cvv2, this.expireDate);


  CardModel.fromJson(Map<String,dynamic>json):
      id = json['id'],
      userName = json['userName'],
      seriesNumber = json['seriesNumber'],
      cvv2 = json['cvv2'],
      expireDate = json['expireDate'];


  Map <String,dynamic>toJson()=>{
    'id':id,
    'userName':userName,
    'seriesNumber':seriesNumber,
    'cvv2':cvv2,
    'expireDate':expireDate
  };
}