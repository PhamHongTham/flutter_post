class Validator {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email không được để trống';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Email không hợp lệ';
    } else if (value.contains(' ')) {
      return 'Email không được chứa khoảng trắng';
    } else if (value.contains('..')) {
      return 'Email không được chứa 2 dấu chấm liên tiếp';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mật khẩu không được để trống';
    } else if (value.length < 8) {
      return 'Mật khẩu phải có ít nhất 8 ký tự';
    } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
        .hasMatch(value)) {
      return 'Mật khẩu phải có ít nhất 1 chữ hoa, 1 chữ thường và 1 số';
    } else if (value.contains(' ')) {
      return 'Mật khẩu không được chứa khoảng trắng';
    }
    return null;
  }

  static String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Số điện thoại không được để trống';
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Số điện thoại không hợp lệ';
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tên không được để trống';
    }
    return null;
  }
}
