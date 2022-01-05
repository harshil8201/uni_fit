class Sales {
  final int absCal;
  final int shoulderCal;
  final int chestCal;
  final int armsCal;
  final int legsCal;
  final int backCal;

  Sales(this.absCal, this.shoulderCal, this.chestCal, this.armsCal,
      this.legsCal, this.backCal);

  Sales.fromMap(Map<String, dynamic> map)
      : assert(map['absCal'] != null),
        assert(map['chestCal'] != null),
        assert(map['shoulderCal'] != null),
        assert(map['armsCal'] != null),
        assert(map['legsCal'] != null),
        assert(map['backCal'] != null),
        absCal = map['absCal'],
        chestCal = map['chestCal'],
        shoulderCal = map['shoulderCal'],
        armsCal = map['armsCal'],
        legsCal = map['legsCal'],
        backCal = map['backCal'];

  @override
  String toString() =>
      "Record<$absCal:$shoulderCal:$chestCal:$legsCal:$armsCal:$backCal>";
}
