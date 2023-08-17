class PaymentModel {
  PaymentModel({
    String? pgTxnid,
    String? merTxnid,
    String? riskTitle,
    String? riskLevel,
    String? cusName,
    String? cusEmail,
    String? cusPhone,
    String? cusAdd1,
    String? cusAdd2,
    String? cusCity,
    dynamic cusState,
    String? cusPostcode,
    String? cusCountry,
    dynamic cusFax,
    dynamic shipName,
    dynamic shipAdd1,
    dynamic shipAdd2,
    dynamic shipCity,
    dynamic shipState,
    dynamic shipPostcode,
    dynamic shipCountry,
    dynamic desc,
    String? merchantId,
    String? storeId,
    String? amount,
    String? amountBdt,
    String? payStatus,
    String? statusCode,
    String? statusTitle,
    String? cardnumber,
    String? approvalCode,
    String? paymentProcessor,
    String? bankTrxid,
    String? paymentType,
    String? errorCode,
    String? errorTitle,
    String? binCountry,
    String? binIssuer,
    String? binCardtype,
    String? binCardcategory,
    String? date,
    String? dateProcessed,
    String? amountCurrency,
    String? recAmount,
    String? processingRatio,
    String? processingCharge,
    String? ip,
    String? currency,
    String? currencyMerchant,
    String? convertionRate,
    String? optA,
    String? optB,
    String? optC,
    String? optD,
    String? verifyStatus,
    String? callType,
    String? emailSend,
    String? docRecived,
    String? checkoutStatus,
  }) {
    _pgTxnid = pgTxnid;
    _merTxnid = merTxnid;
    _riskTitle = riskTitle;
    _riskLevel = riskLevel;
    _cusName = cusName;
    _cusEmail = cusEmail;
    _cusPhone = cusPhone;
    _cusAdd1 = cusAdd1;
    _cusAdd2 = cusAdd2;
    _cusCity = cusCity;
    _cusState = cusState;
    _cusPostcode = cusPostcode;
    _cusCountry = cusCountry;
    _cusFax = cusFax;
    _shipName = shipName;
    _shipAdd1 = shipAdd1;
    _shipAdd2 = shipAdd2;
    _shipCity = shipCity;
    _shipState = shipState;
    _shipPostcode = shipPostcode;
    _shipCountry = shipCountry;
    _desc = desc;
    _merchantId = merchantId;
    _storeId = storeId;
    _amount = amount;
    _amountBdt = amountBdt;
    _payStatus = payStatus;
    _statusCode = statusCode;
    _statusTitle = statusTitle;
    _cardnumber = cardnumber;
    _approvalCode = approvalCode;
    _paymentProcessor = paymentProcessor;
    _bankTrxid = bankTrxid;
    _paymentType = paymentType;
    _errorCode = errorCode;
    _errorTitle = errorTitle;
    _binCountry = binCountry;
    _binIssuer = binIssuer;
    _binCardtype = binCardtype;
    _binCardcategory = binCardcategory;
    _date = date;
    _dateProcessed = dateProcessed;
    _amountCurrency = amountCurrency;
    _recAmount = recAmount;
    _processingRatio = processingRatio;
    _processingCharge = processingCharge;
    _ip = ip;
    _currency = currency;
    _currencyMerchant = currencyMerchant;
    _convertionRate = convertionRate;
    _optA = optA;
    _optB = optB;
    _optC = optC;
    _optD = optD;
    _verifyStatus = verifyStatus;
    _callType = callType;
    _emailSend = emailSend;
    _docRecived = docRecived;
    _checkoutStatus = checkoutStatus;
  }

  PaymentModel.fromJson(dynamic json) {
    _pgTxnid = json['pg_txnid'];
    _merTxnid = json['mer_txnid'];
    _riskTitle = json['risk_title'];
    _riskLevel = json['risk_level'];
    _cusName = json['cus_name'];
    _cusEmail = json['cus_email'];
    _cusPhone = json['cus_phone'];
    _cusAdd1 = json['cus_add1'];
    _cusAdd2 = json['cus_add2'];
    _cusCity = json['cus_city'];
    _cusState = json['cus_state'];
    _cusPostcode = json['cus_postcode'];
    _cusCountry = json['cus_country'];
    _cusFax = json['cus_fax'];
    _shipName = json['ship_name'];
    _shipAdd1 = json['ship_add1'];
    _shipAdd2 = json['ship_add2'];
    _shipCity = json['ship_city'];
    _shipState = json['ship_state'];
    _shipPostcode = json['ship_postcode'];
    _shipCountry = json['ship_country'];
    _desc = json['desc'];
    _merchantId = json['merchant_id'];
    _storeId = json['store_id'];
    _amount = json['amount'];
    _amountBdt = json['amount_bdt'];
    _payStatus = json['pay_status'];
    _statusCode = json['status_code'];
    _statusTitle = json['status_title'];
    _cardnumber = json['cardnumber'];
    _approvalCode = json['approval_code'];
    _paymentProcessor = json['payment_processor'];
    _bankTrxid = json['bank_trxid'];
    _paymentType = json['payment_type'];
    _errorCode = json['error_code'];
    _errorTitle = json['error_title'];
    _binCountry = json['bin_country'];
    _binIssuer = json['bin_issuer'];
    _binCardtype = json['bin_cardtype'];
    _binCardcategory = json['bin_cardcategory'];
    _date = json['date'];
    _dateProcessed = json['date_processed'];
    _amountCurrency = json['amount_currency'];
    _recAmount = json['rec_amount'];
    _processingRatio = json['processing_ratio'];
    _processingCharge = json['processing_charge'];
    _ip = json['ip'];
    _currency = json['currency'];
    _currencyMerchant = json['currency_merchant'];
    _convertionRate = json['convertion_rate'];
    _optA = json['opt_a'];
    _optB = json['opt_b'];
    _optC = json['opt_c'];
    _optD = json['opt_d'];
    _verifyStatus = json['verify_status'];
    _callType = json['call_type'];
    _emailSend = json['email_send'];
    _docRecived = json['doc_recived'];
    _checkoutStatus = json['checkout_status'];
  }

  String? _pgTxnid;
  String? _merTxnid;
  String? _riskTitle;
  String? _riskLevel;
  String? _cusName;
  String? _cusEmail;
  String? _cusPhone;
  String? _cusAdd1;
  String? _cusAdd2;
  String? _cusCity;
  dynamic _cusState;
  String? _cusPostcode;
  String? _cusCountry;
  dynamic _cusFax;
  dynamic _shipName;
  dynamic _shipAdd1;
  dynamic _shipAdd2;
  dynamic _shipCity;
  dynamic _shipState;
  dynamic _shipPostcode;
  dynamic _shipCountry;
  dynamic _desc;
  String? _merchantId;
  String? _storeId;
  String? _amount;
  String? _amountBdt;
  String? _payStatus;
  String? _statusCode;
  String? _statusTitle;
  String? _cardnumber;
  String? _approvalCode;
  String? _paymentProcessor;
  String? _bankTrxid;
  String? _paymentType;
  String? _errorCode;
  String? _errorTitle;
  String? _binCountry;
  String? _binIssuer;
  String? _binCardtype;
  String? _binCardcategory;
  String? _date;
  String? _dateProcessed;
  String? _amountCurrency;
  String? _recAmount;
  String? _processingRatio;
  String? _processingCharge;
  String? _ip;
  String? _currency;
  String? _currencyMerchant;
  String? _convertionRate;
  String? _optA;
  String? _optB;
  String? _optC;
  String? _optD;
  String? _verifyStatus;
  String? _callType;
  String? _emailSend;
  String? _docRecived;
  String? _checkoutStatus;

  PaymentModel copyWith({
    String? pgTxnid,
    String? merTxnid,
    String? riskTitle,
    String? riskLevel,
    String? cusName,
    String? cusEmail,
    String? cusPhone,
    String? cusAdd1,
    String? cusAdd2,
    String? cusCity,
    dynamic cusState,
    String? cusPostcode,
    String? cusCountry,
    dynamic cusFax,
    dynamic shipName,
    dynamic shipAdd1,
    dynamic shipAdd2,
    dynamic shipCity,
    dynamic shipState,
    dynamic shipPostcode,
    dynamic shipCountry,
    dynamic desc,
    String? merchantId,
    String? storeId,
    String? amount,
    String? amountBdt,
    String? payStatus,
    String? statusCode,
    String? statusTitle,
    String? cardnumber,
    String? approvalCode,
    String? paymentProcessor,
    String? bankTrxid,
    String? paymentType,
    String? errorCode,
    String? errorTitle,
    String? binCountry,
    String? binIssuer,
    String? binCardtype,
    String? binCardcategory,
    String? date,
    String? dateProcessed,
    String? amountCurrency,
    String? recAmount,
    String? processingRatio,
    String? processingCharge,
    String? ip,
    String? currency,
    String? currencyMerchant,
    String? convertionRate,
    String? optA,
    String? optB,
    String? optC,
    String? optD,
    String? verifyStatus,
    String? callType,
    String? emailSend,
    String? docRecived,
    String? checkoutStatus,
  }) =>
      PaymentModel(
        pgTxnid: pgTxnid ?? _pgTxnid,
        merTxnid: merTxnid ?? _merTxnid,
        riskTitle: riskTitle ?? _riskTitle,
        riskLevel: riskLevel ?? _riskLevel,
        cusName: cusName ?? _cusName,
        cusEmail: cusEmail ?? _cusEmail,
        cusPhone: cusPhone ?? _cusPhone,
        cusAdd1: cusAdd1 ?? _cusAdd1,
        cusAdd2: cusAdd2 ?? _cusAdd2,
        cusCity: cusCity ?? _cusCity,
        cusState: cusState ?? _cusState,
        cusPostcode: cusPostcode ?? _cusPostcode,
        cusCountry: cusCountry ?? _cusCountry,
        cusFax: cusFax ?? _cusFax,
        shipName: shipName ?? _shipName,
        shipAdd1: shipAdd1 ?? _shipAdd1,
        shipAdd2: shipAdd2 ?? _shipAdd2,
        shipCity: shipCity ?? _shipCity,
        shipState: shipState ?? _shipState,
        shipPostcode: shipPostcode ?? _shipPostcode,
        shipCountry: shipCountry ?? _shipCountry,
        desc: desc ?? _desc,
        merchantId: merchantId ?? _merchantId,
        storeId: storeId ?? _storeId,
        amount: amount ?? _amount,
        amountBdt: amountBdt ?? _amountBdt,
        payStatus: payStatus ?? _payStatus,
        statusCode: statusCode ?? _statusCode,
        statusTitle: statusTitle ?? _statusTitle,
        cardnumber: cardnumber ?? _cardnumber,
        approvalCode: approvalCode ?? _approvalCode,
        paymentProcessor: paymentProcessor ?? _paymentProcessor,
        bankTrxid: bankTrxid ?? _bankTrxid,
        paymentType: paymentType ?? _paymentType,
        errorCode: errorCode ?? _errorCode,
        errorTitle: errorTitle ?? _errorTitle,
        binCountry: binCountry ?? _binCountry,
        binIssuer: binIssuer ?? _binIssuer,
        binCardtype: binCardtype ?? _binCardtype,
        binCardcategory: binCardcategory ?? _binCardcategory,
        date: date ?? _date,
        dateProcessed: dateProcessed ?? _dateProcessed,
        amountCurrency: amountCurrency ?? _amountCurrency,
        recAmount: recAmount ?? _recAmount,
        processingRatio: processingRatio ?? _processingRatio,
        processingCharge: processingCharge ?? _processingCharge,
        ip: ip ?? _ip,
        currency: currency ?? _currency,
        currencyMerchant: currencyMerchant ?? _currencyMerchant,
        convertionRate: convertionRate ?? _convertionRate,
        optA: optA ?? _optA,
        optB: optB ?? _optB,
        optC: optC ?? _optC,
        optD: optD ?? _optD,
        verifyStatus: verifyStatus ?? _verifyStatus,
        callType: callType ?? _callType,
        emailSend: emailSend ?? _emailSend,
        docRecived: docRecived ?? _docRecived,
        checkoutStatus: checkoutStatus ?? _checkoutStatus,
      );

  String? get pgTxnid => _pgTxnid;

  String? get merTxnid => _merTxnid;

  String? get riskTitle => _riskTitle;

  String? get riskLevel => _riskLevel;

  String? get cusName => _cusName;

  String? get cusEmail => _cusEmail;

  String? get cusPhone => _cusPhone;

  String? get cusAdd1 => _cusAdd1;

  String? get cusAdd2 => _cusAdd2;

  String? get cusCity => _cusCity;

  dynamic get cusState => _cusState;

  String? get cusPostcode => _cusPostcode;

  String? get cusCountry => _cusCountry;

  dynamic get cusFax => _cusFax;

  dynamic get shipName => _shipName;

  dynamic get shipAdd1 => _shipAdd1;

  dynamic get shipAdd2 => _shipAdd2;

  dynamic get shipCity => _shipCity;

  dynamic get shipState => _shipState;

  dynamic get shipPostcode => _shipPostcode;

  dynamic get shipCountry => _shipCountry;

  dynamic get desc => _desc;

  String? get merchantId => _merchantId;

  String? get storeId => _storeId;

  String? get amount => _amount;

  String? get amountBdt => _amountBdt;

  String? get payStatus => _payStatus;

  String? get statusCode => _statusCode;

  String? get statusTitle => _statusTitle;

  String? get cardnumber => _cardnumber;

  String? get approvalCode => _approvalCode;

  String? get paymentProcessor => _paymentProcessor;

  String? get bankTrxid => _bankTrxid;

  String? get paymentType => _paymentType;

  String? get errorCode => _errorCode;

  String? get errorTitle => _errorTitle;

  String? get binCountry => _binCountry;

  String? get binIssuer => _binIssuer;

  String? get binCardtype => _binCardtype;

  String? get binCardcategory => _binCardcategory;

  String? get date => _date;

  String? get dateProcessed => _dateProcessed;

  String? get amountCurrency => _amountCurrency;

  String? get recAmount => _recAmount;

  String? get processingRatio => _processingRatio;

  String? get processingCharge => _processingCharge;

  String? get ip => _ip;

  String? get currency => _currency;

  String? get currencyMerchant => _currencyMerchant;

  String? get convertionRate => _convertionRate;

  String? get optA => _optA;

  String? get optB => _optB;

  String? get optC => _optC;

  String? get optD => _optD;

  String? get verifyStatus => _verifyStatus;

  String? get callType => _callType;

  String? get emailSend => _emailSend;

  String? get docRecived => _docRecived;

  String? get checkoutStatus => _checkoutStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pg_txnid'] = _pgTxnid;
    map['mer_txnid'] = _merTxnid;
    map['risk_title'] = _riskTitle;
    map['risk_level'] = _riskLevel;
    map['cus_name'] = _cusName;
    map['cus_email'] = _cusEmail;
    map['cus_phone'] = _cusPhone;
    map['cus_add1'] = _cusAdd1;
    map['cus_add2'] = _cusAdd2;
    map['cus_city'] = _cusCity;
    map['cus_state'] = _cusState;
    map['cus_postcode'] = _cusPostcode;
    map['cus_country'] = _cusCountry;
    map['cus_fax'] = _cusFax;
    map['ship_name'] = _shipName;
    map['ship_add1'] = _shipAdd1;
    map['ship_add2'] = _shipAdd2;
    map['ship_city'] = _shipCity;
    map['ship_state'] = _shipState;
    map['ship_postcode'] = _shipPostcode;
    map['ship_country'] = _shipCountry;
    map['desc'] = _desc;
    map['merchant_id'] = _merchantId;
    map['store_id'] = _storeId;
    map['amount'] = _amount;
    map['amount_bdt'] = _amountBdt;
    map['pay_status'] = _payStatus;
    map['status_code'] = _statusCode;
    map['status_title'] = _statusTitle;
    map['cardnumber'] = _cardnumber;
    map['approval_code'] = _approvalCode;
    map['payment_processor'] = _paymentProcessor;
    map['bank_trxid'] = _bankTrxid;
    map['payment_type'] = _paymentType;
    map['error_code'] = _errorCode;
    map['error_title'] = _errorTitle;
    map['bin_country'] = _binCountry;
    map['bin_issuer'] = _binIssuer;
    map['bin_cardtype'] = _binCardtype;
    map['bin_cardcategory'] = _binCardcategory;
    map['date'] = _date;
    map['date_processed'] = _dateProcessed;
    map['amount_currency'] = _amountCurrency;
    map['rec_amount'] = _recAmount;
    map['processing_ratio'] = _processingRatio;
    map['processing_charge'] = _processingCharge;
    map['ip'] = _ip;
    map['currency'] = _currency;
    map['currency_merchant'] = _currencyMerchant;
    map['convertion_rate'] = _convertionRate;
    map['opt_a'] = _optA;
    map['opt_b'] = _optB;
    map['opt_c'] = _optC;
    map['opt_d'] = _optD;
    map['verify_status'] = _verifyStatus;
    map['call_type'] = _callType;
    map['email_send'] = _emailSend;
    map['doc_recived'] = _docRecived;
    map['checkout_status'] = _checkoutStatus;
    return map;
  }
}
