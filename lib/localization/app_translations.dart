import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US':{
    'welcome': 'Welcome to Find',
    'enter_phone': 'Enter your phone number below to get into ',
    'phone': 'Phone',
    'continue': 'CONTINUE',
    'error' : "Please enter your phone number",
    'error1': "Error",
    'Success': 'Success',
    'cattitle': 'Food & Drinks',
    'deliver': 'Delivered to '
  },
'ar_ae':{
    'welcome': 'مرحبا بك في البحث',
    'enter_phone': 'أدخل رقم هاتفك أدناه للدخول إلى البحث',
    'phone': 'هاتف',
    'continue': 'استمر',
    'error': 'يرجى إدخال رقم الهاتف الخاص بك.',
    'error1': 'خطأ',
    'Success': 'نجاح',
    'cattitle': 'أطعمة ومشروبات',
    'deliver': 'سلمت ل '
  }
  };
}
