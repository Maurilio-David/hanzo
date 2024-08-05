// 1. Não pode estar em branco e não pode conter números
String? validateNotBlankAndNoNumbers(String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo não pode estar vazio.';
  }
  if (RegExp(r'[0-9]').hasMatch(value)) {
    return 'Este campo não pode conter números.';
  }
  return null;
}

// 2. Email válido
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo não pode estar vazio.';
  }
  if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
      .hasMatch(value)) {
    return 'Por favor, insira um email válido.';
  }
  return null;
}

// 3. Senha com 6 dígitos
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo não pode estar vazio.';
  }
  if (value.length < 6) {
    return 'A senha precisa ter pelo menos 6 dígitos.';
  }
  return null;
}

// 4. Confirmação de senha igual à senha
String? validateConfirmPassword(String? value, String password) {
  if (value == null || value.isEmpty) {
    return 'Este campo não pode estar vazio.';
  }
  if (value != password) {
    return 'As senhas não coincidem.';
  }
  return null;
}
