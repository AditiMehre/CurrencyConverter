class CurrencyRates {
  double? aud;
  double? bgn;
  double? brl;
  double? cad;
  double? chf;
  double? cny;
  double? czk;
  double? dkk;
  double? eur;
  double? gbp;
  double? hkd;
  double? hrk;
  double? huf;
  double? idr;
  double? ils;
  double? inr;
  double? isk;
  double? jpy;
  double? krw;
  double? mxn;
  double? myr;
  double? nok;
  double? nzd;
  double? php;
  double? pln;
  double? ron;
  double? rub;
  double? sek;
  double? sgd;
  double? thb;
  double? tryCurrency;  // 'try' is a keyword in Dart, so we need to name this differently
  double? usd;
  double? zar;

  CurrencyRates.fromJson(Map<String, dynamic> json) {
    var data = json['data'];  // Extract the 'data' key first


    aud = (data['AUD'] as num?)?.toDouble();
    bgn = (data['BGN'] as num?)?.toDouble();
    brl = (data['BRL'] as num?)?.toDouble();
    cad = (data['CAD'] as num?)?.toDouble();
    chf = (data['CHF'] as num?)?.toDouble();
    cny = (data['CNY'] as num?)?.toDouble();
    czk = (data['CZK'] as num?)?.toDouble();
    dkk = (data['DKK'] as num?)?.toDouble();
    eur = (data['EUR'] as num?)?.toDouble();
    gbp = (data['GBP'] as num?)?.toDouble();
    hkd = (data['HKD'] as num?)?.toDouble();
    hrk = (data['HRK'] as num?)?.toDouble();
    huf = (data['HUF'] as num?)?.toDouble();
    idr = (data['IDR'] as num?)?.toDouble();
    ils = (data['ILS'] as num?)?.toDouble();
    inr = (data['INR'] as num?)?.toDouble();
    isk = (data['ISK'] as num?)?.toDouble();
    jpy = (data['JPY'] as num?)?.toDouble();
    krw = (data['KRW'] as num?)?.toDouble();
    mxn = (data['MXN'] as num?)?.toDouble();
    myr = (data['MYR'] as num?)?.toDouble();
    nok = (data['NOK'] as num?)?.toDouble();
    nzd = (data['NZD'] as num?)?.toDouble();
    php = (data['PHP'] as num?)?.toDouble();
    pln = (data['PLN'] as num?)?.toDouble();
    ron = (data['RON'] as num?)?.toDouble();
    rub = (data['RUB'] as num?)?.toDouble();
    sek = (data['SEK'] as num?)?.toDouble();
    sgd = (data['SGD'] as num?)?.toDouble();
    thb = (data['THB'] as num?)?.toDouble();
    tryCurrency = (data['TRY'] as num?)?.toDouble();
    usd = (data['USD'] as num?)?.toDouble();
    zar = (data['ZAR'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AUD'] = this.aud;
    data['BGN'] = this.bgn;
    data['BRL'] = this.brl;
    data['CAD'] = this.cad;
    data['CHF'] = this.chf;
    data['CNY'] = this.cny;
    data['CZK'] = this.czk;
    data['DKK'] = this.dkk;
    data['EUR'] = this.eur;
    data['GBP'] = this.gbp;
    data['HKD'] = this.hkd;
    data['HRK'] = this.hrk;
    data['HUF'] = this.huf;
    data['IDR'] = this.idr;
    data['ILS'] = this.ils;
    data['INR'] = this.inr;
    data['ISK'] = this.isk;
    data['JPY'] = this.jpy;
    data['KRW'] = this.krw;
    data['MXN'] = this.mxn;
    data['MYR'] = this.myr;
    data['NOK'] = this.nok;
    data['NZD'] = this.nzd;
    data['PHP'] = this.php;
    data['PLN'] = this.pln;
    data['RON'] = this.ron;
    data['RUB'] = this.rub;
    data['SEK'] = this.sek;
    data['SGD'] = this.sgd;
    data['THB'] = this.thb;
    data['TRY'] = this.tryCurrency;
    data['USD'] = this.usd;
    data['ZAR'] = this.zar;
    return data;
  }
}
