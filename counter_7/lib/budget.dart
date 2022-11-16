class Budget {
  String judul;
  int nominal;
  String jenisBudget;

  Budget(
      {required this.judul, required this.nominal, required this.jenisBudget});

  @override
  String toString() {
    // TODO: implement toString
    return 'Judul: ${judul}, Nominal: ${nominal}, Jenis Budget: ${jenisBudget}';
  }
}
