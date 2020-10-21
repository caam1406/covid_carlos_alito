class StringsUtils {
  static String removeDiactrics(String input) {
    final matchRE = RegExp(r"[ÁÀÃÂáàãâÉÈÊéèêÍÌÎíìîÓÒÔÕóòôõÚÙÛúùûçÇ]");
    final replacementMap = Map.fromIterables(
        "ÁÀÃÂáàãâÉÈÊéèêÍÌÎíìîÓÒÔÕóòôõÚÙÛúùûçÇ".split(""),
        "AAAAaaaaEEEeeeEEEiiiOOOOooooUUUuuucC".split(""));

    return input.replaceAllMapped(matchRE, (m) => replacementMap[m[0]]);
  }
}
