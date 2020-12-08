class Rate {
  String base;
  String date; // 2020-11-18 // YYYY-MM-DD
  Map<String,dynamic> rates;


  Rate({
    this.base,
    this.date,
    this.rates
  });

  Rate.fromJson(Map<String, dynamic> json){
    date = json['date'];
    base = json['base'];
    rates = json['rates'];
  }
  
}

