
// This class methods ensures that, the dynamic data which we are getting from the api decoded successfully.

extension StringExtensions on String?{
  String? toStringConversion(){
    if(this == "null" || this == null) return null;
    return this;
  }

  int toIntConversion(){
    var string = this ?? "";
    if(string != "" && string != "null" && string.isNumeric()){
      return int.parse(string);
    }
    return 0;
  }

  int toIntConversionDefaultOne(){
    var string = this ?? "";
    if(string != "" && string != "null" && string.isNumeric()){
      return int.parse(string);
    }
    return 1;
  }

  double toDoubleConversionWithRoundOff(){
    var string = this ?? "";
    if(string != "" && string != "null" && RegExp(r'\d+([\.]\d+)?$').hasMatch(string)){

      var stringWithRound = double.parse(string).toStringAsFixed(2);

      return double.parse(stringWithRound);
    }
    return 0.0;
  }

  double toDoubleConversionWithoutRoundOff(){
    var string = this ?? "";
    if(string != "" && string != "null" && RegExp(r'\d+([\.]\d+)?$').hasMatch(string)){
      return double.parse(string);
    }
    return 0.0;
  }

  bool isEmptyOrNull(){
    // var string = this ?? "";
    var string = stripHtmlIfNeeded(this ?? "").trim();
    if(string == "" && string != "null"){
      return true;
    }
    return false;
  }

  bool isNumeric() {
    if (this == null) {
      return false;
    }
    return double.tryParse(this ?? "") != null;
  }

}

String stripHtmlIfNeeded(String text) {
// The regular expression is simplified for an HTML tag (opening or
// closing) or an HTML escape. We might want to skip over such expressions
// when estimating the text directionality.
  return text.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
}
