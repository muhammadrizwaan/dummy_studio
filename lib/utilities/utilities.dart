

extension StringExtensions on String{
  bool validateEmail(){
    return
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
  }
  bool validatePhoneNumber(){
    return
      // RegExp(r"^((\+92)|(0092))-{0,1}\d{3}-{0,1}\d{7}$|^\d{11}$|^\d{4}-\d{7}$").hasMatch(this);
      // RegExp(r"^(?:\+971|00971|0)?(?:50|51|52|55|56|2|3|4|6|7|9)\d{7}$").hasMatch(this);
      RegExp(r"^(\+971[\s]{0,1}[\-]{0,1}[\s]{0,1}|[\s]{0,1}0)(5[056]{1})[\s]{0,1}[\-]{0,1}[\s]{0,1}[1-9]{1}[0-9]{6}$").hasMatch(this);
  }
}
