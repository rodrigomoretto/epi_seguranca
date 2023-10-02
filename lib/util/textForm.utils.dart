class TextFormUtils {
  /// Validador Padrão:
  /// Retorna a string passada caso a validação padrão seja válida
  /// Validação Padrão:
  /// Se houver algo preenchido, é válido
  String? defaultValidator(String? value, String texto) {
    if (value != null && value.isEmpty) {
      return texto;
    } else {
      return null;
    }
  }
}