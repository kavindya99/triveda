class Medicine {
  int _id;
  String _name;
  String _category;
  String _unit;
  double _price;
  int _quantity;
  int _sold;
  double _income;

  Medicine(this._name, this._category, this._unit, this._price, this._quantity,
      this._sold, this._income);
  Medicine.WithId(this._id, this._name, this._category, this._unit, this._price,
      this._quantity, this._sold, this._income);

  int get id => _id;
  String get name => _name;
  String get category => _category;
  String get unit => _unit;
  double get price => _price;
  int get quantity => _quantity;
  int get sold => _sold;
  double get income => _income;

  set name(String newName) {
    _name = newName;
  }

  set category(String newCategory) {
    _category = newCategory;
  }

  set unit(String newUnit) {
    _unit = newUnit;
  }

  set price(double newPrice) {
    _price = newPrice;
  }

  set quantity(int newQuantity) {
    _quantity = newQuantity;
  }

  set sold(int newSold) {
    _sold = newSold;
  }

  set income(double newIncome) {
    _income = newIncome;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = _name;
    map["category"] = _category;
    map["unit"] = _unit;
    map["price"] = _price;
    map["quantity"] = _quantity;
    map["sold"] = _sold;
    map["income"] = _income;

    if (_id != null) {
      map["id"] = _id;
    }
    return map;
  }

  Medicine.fromObject(dynamic o) {
    this._id = o["id"];
    this._name = o["name"];
    this._category = o["category"];
    this._unit = o["unit"];
    this._price = o["price"];
    this._quantity = o["quantity"];
    this._sold = o["sold"];
    this._income = o["income"];
  }
}
