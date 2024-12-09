import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar', 'ur'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
    String? urText = '',
  }) =>
      [enText, arText, urText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    '02bfsver': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // intro
  {
    'veqfgedv': {
      'en': 'Get delivered,\nanything, anywhere',
      'ar': 'احصل على أي شيء، في أي مكان',
      'ur': 'پہنچایا جائے،\nکچھ بھی، کہیں بھی',
    },
    'fb9d3aa9': {
      'en': 'Next',
      'ar': 'التالي',
      'ur': 'اگلا',
    },
    'q83ksvop': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // intro2
  {
    '8bwut1sv': {
      'en': 'Delivery at \nyour doorstep',
      'ar': 'التوصيل إلى باب منزلك',
      'ur': 'پر ڈیلیوری \nآپ کی دہلیز',
    },
    '5l6vt599': {
      'en': 'Next',
      'ar': 'التالي',
      'ur': 'اگلا',
    },
    'yexf3fof': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // intro3
  {
    'osjj3x8q': {
      'en': 'Book your item to be \ndelivered anywhere \nin U.A.E',
      'ar':
          'احجز العنصر الخاص بك ليتم توصيله إلى أي مكان في الإمارات العربية المتحدة',
      'ur': 'ہونے کے لیے اپنا آئٹم بک کرو \nکہیں بھی پہنچایا \nU.A.E میں',
    },
    'ihu27sqq': {
      'en': 'Next',
      'ar': 'التالي',
      'ur': 'اگلا',
    },
    'l1qkb9il': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // MainPage
  {
    'asqfopfs': {
      'en': 'Continue with Mobile number',
      'ar': 'متابعة برقم الجوال',
      'ur': 'موبائل نمبر کے ساتھ جاری رکھیں',
    },
    'pwn11tb3': {
      'en': '   Signin With Google',
      'ar': 'تسجيل الدخول باستخدام جوجل',
      'ur': 'گوگل کے ساتھ سائن ان کریں۔',
    },
    'kn6t0jiy': {
      'en': 'or Login using',
      'ar': 'أو قم بتسجيل الدخول باستخدام',
      'ur': 'یا استعمال کرکے لاگ ان کریں۔',
    },
    'lo5rtlfu': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // LoginPage
  {
    'yn4aea2v': {
      'en': 'Enter your mobile number',
      'ar': 'أدخل رقم هاتفك المحمول',
      'ur': 'اپنا موبائل نمبر درج کریں۔',
    },
    '5t8s4y4s': {
      'en': 'Type in your mobile number to sign in or create a new account.',
      'ar': 'اكتب رقم هاتفك المحمول لتسجيل الدخول أو إنشاء حساب جديد.',
      'ur':
          'سائن ان کرنے یا نیا اکاؤنٹ بنانے کے لیے اپنا موبائل نمبر ٹائپ کریں۔',
    },
    'o0oqu2if': {
      'en': 'Mobile Number',
      'ar': 'رقم الهاتف المحمول',
      'ur': 'موبائل نمبر',
    },
    '0tfpy6v1': {
      'en': 'Confirm',
      'ar': 'يتأكد',
      'ur': 'تصدیق کریں۔',
    },
    'y4kz5pb7': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // HomePage01
  {
    'gbzwhjox': {
      'en': 'Book your Order',
      'ar': 'احجز طلبك',
      'ur': 'اپنا آرڈر بک کروائیں۔',
    },
    'x273bhqy': {
      'en': 'Buy From Store',
      'ar': 'شراء من المتجر',
      'ur': 'اسٹور سے خریدیں۔',
    },
    'cdnepvby': {
      'en': 'Testing logout Button',
      'ar': 'اختبار زر تسجيل الخروج',
      'ur': 'لاگ آؤٹ بٹن کی جانچ',
    },
    'zkmlgnkp': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // Order01
  {
    '5ajum07d': {
      'en': 'Search Location',
      'ar': 'موقع البحث',
      'ur': 'مقام تلاش کریں۔',
    },
    '9a76szv8': {
      'en': 'Delivery Point',
      'ar': 'نقطة التسليم',
      'ur': 'ڈیلیوری پوائنٹ',
    },
    'r9vep871': {
      'en': '4014 Way CBD',
      'ar': '4014 طريقة CBD',
      'ur': '4014 وے سی بی ڈی',
    },
    'yvs6muaj': {
      'en': 'Confirm',
      'ar': 'يتأكد',
      'ur': 'تصدیق کریں۔',
    },
    'jxyxo2js': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // otp
  {
    '7or123k0': {
      'en': 'Enter OTP Code',
      'ar': 'أدخل رمز OTP',
      'ur': 'OTP کوڈ درج کریں۔',
    },
    '2obblxaf': {
      'en': 'OTP has been sent  to ',
      'ar': 'تم إرسال OTP إلى',
      'ur': 'کو OTP بھیج دیا گیا ہے۔',
    },
    '65vcbxu5': {
      'en': 'Resend code in',
      'ar': 'إعادة إرسال الكود في s',
      'ur': 'ایس میں کوڈ دوبارہ بھیجیں۔',
    },
    'p7p0kyna': {
      'en': 'confirm',
      'ar': 'يتأكد',
      'ur': 'تصدیق کریں',
    },
    'xxgjvod4': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // Order02
  {
    'obkuweh8': {
      'en': 'Click Helpline',
      'ar': 'انقر على خط المساعدة',
      'ur': 'ہیلپ لائن پر کلک کریں۔',
    },
    '5byfru8s': {
      'en': 'Dubai',
      'ar': 'دبي',
      'ur': 'دبئی',
    },
    'e7eu5znh': {
      'en': 'Choose Vehicle Type:',
      'ar': 'اختر نوع السيارة:',
      'ur': 'گاڑی کی قسم کا انتخاب کریں:',
    },
    'jo4aq3a3': {
      'en': 'Scooter',
      'ar': 'سكوتر',
      'ur': 'سکوٹر',
    },
    'ebfn9mtf': {
      'en': 'Truck',
      'ar': 'شاحنة',
      'ur': 'ٹرک',
    },
    'rgvm48ai': {
      'en': 'Scooter',
      'ar': 'سكوتر',
      'ur': 'سکوٹر',
    },
    '2ev2j62k': {
      'en': 'Car',
      'ar': 'سيارة',
      'ur': 'کار',
    },
    'jsyh09wh': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // profilemenu
  {
    'pj98ih85': {
      'en': 'Orders',
      'ar': 'طلبات',
      'ur': 'احکامات',
    },
    'mfej17t3': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'ur': 'پروفائل',
    },
    '3c9h2lz4': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'ur': 'پروفائل میں ترمیم کریں۔',
    },
    'kjzijng1': {
      'en': 'My Address',
      'ar': 'عنواني',
      'ur': 'میرا پتہ',
    },
    'r46xcnnv': {
      'en': 'Wallet',
      'ar': 'محفظة',
      'ur': 'پرس',
    },
    '247vcr9e': {
      'en': 'Saved Cards',
      'ar': 'البطاقات المحفوظة',
      'ur': 'محفوظ کردہ کارڈز',
    },
    'zb1dzgnq': {
      'en': 'Support Benefits and Preference',
      'ar': 'مزايا وتفضيلات الدعم',
      'ur': 'سپورٹ فوائد اور ترجیحات',
    },
    '7h5zobms': {
      'en': 'Change Language',
      'ar': 'تغيير اللغة',
      'ur': 'زبان تبدیل کریں',
    },
    '6ksu3k5j': {
      'en': 'City Selection',
      'ar': 'اختيار المدينة',
      'ur': 'شہر کا انتخاب',
    },
    'vwq4a5on': {
      'en': 'Reward Points',
      'ar': 'نقاط المكافأة',
      'ur': 'انعامی پوائنٹس',
    },
    'b7je5ils': {
      'en': 'Logout',
      'ar': 'يتأكد',
      'ur': 'تصدیق کریں۔',
    },
    '447v4mh9': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // editprofile
  {
    '6hdryxxp': {
      'en': 'Profile Settings',
      'ar': 'إعدادات الملف الشخصي',
      'ur': 'پروفائل کی ترتیبات',
    },
    'l0haqnkw': {
      'en': 'Name',
      'ar': 'اسم',
      'ur': 'نام',
    },
    'g1nkcokr': {
      'en': 'Mobile Number',
      'ar': 'رقم الهاتف المحمول',
      'ur': 'موبائل نمبر',
    },
    'piw14v36': {
      'en': 'Gender',
      'ar': 'جنس',
      'ur': 'جنس',
    },
    'l5alcqzt': {
      'en': 'Date Of Birth',
      'ar': 'تاريخ الميلاد',
      'ur': 'تاریخ پیدائش',
    },
    'eeptzq1r': {
      'en': 'Login Settings',
      'ar': 'إعدادات تسجيل الدخول',
      'ur': 'لاگ ان کی ترتیبات',
    },
    'grd6o64f': {
      'en': 'Email ',
      'ar': 'بريد إلكتروني',
      'ur': 'ای میل',
    },
    'agn8ekfy': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'ur': 'پاس ورڈ تبدیل کریں۔',
    },
    'l5f0ntq6': {
      'en': 'Back',
      'ar': 'يتأكد',
      'ur': 'تصدیق کریں۔',
    },
    '0pwljw36': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // editname
  {
    'ucymnd5e': {
      'en': 'Update Your Name',
      'ar': 'تحديث اسمك',
      'ur': 'اپنا نام اپ ڈیٹ کریں۔',
    },
    'zmdo9xns': {
      'en': 'First Name',
      'ar': 'الاسم الأول',
      'ur': 'پہلا نام',
    },
    'u92ds8r2': {
      'en': '',
      'ar': 'الاسم الأول',
      'ur': 'پہلا نام',
    },
    '23uj34j1': {
      'en': 'Last Name',
      'ar': 'اسم العائلة',
      'ur': 'آخری نام',
    },
    'ol0dbs9g': {
      'en': '',
      'ar': 'اسم العائلة',
      'ur': 'آخری نام',
    },
    'xgdpnc9y': {
      'en': 'Confirm',
      'ar': 'يتأكد',
      'ur': 'تصدیق کریں۔',
    },
  },
  // editemailid
  {
    '5cci1asc': {
      'en': 'Update Your Email Id',
      'ar': 'تحديث معرف البريد الإلكتروني الخاص بك',
      'ur': 'اپنا ای میل آئی ڈی اپ ڈیٹ کریں۔',
    },
    'i74zumm2': {
      'en': 'We will send an OTP to verify your email ID',
      'ar': 'سوف نرسل لك OTP للتحقق من معرف البريد الإلكتروني الخاص بك',
      'ur': 'ہم آپ کی ای میل ID کی تصدیق کے لیے ایک OTP بھیجیں گے۔',
    },
    'yve0dw5g': {
      'en': 'Mail id ',
      'ar': 'معرف البريد الإلكتروني',
      'ur': 'میل آئی ڈی',
    },
    'ovp3u63k': {
      'en': '',
      'ar': 'أدخل معرف البريد الإلكتروني',
      'ur': 'میل آئی ڈی درج کریں۔',
    },
    'alwklyfb': {
      'en': 'Confirm',
      'ar': 'يتأكد',
      'ur': 'تصدیق کریں۔',
    },
  },
  // myaddress
  {
    'eg1rc13v': {
      'en': 'My Addresses',
      'ar': 'عناويني',
      'ur': 'میرے پتے',
    },
    'htg4jerb': {
      'en': 'Add new Address',
      'ar': 'إضافة عنوان جديد',
      'ur': 'نیا پتہ شامل کریں۔',
    },
    'zxo3vx6t': {
      'en': 'Work',
      'ar': 'عمل',
      'ur': 'کام',
    },
    'pi3gs43v': {
      'en': 'Address 1',
      'ar': 'العنوان 1',
      'ur': 'پتہ 1',
    },
    '5smhzxii': {
      'en': 'Address 2',
      'ar': 'العنوان 2',
      'ur': 'پتہ 2',
    },
    'flud9n9q': {
      'en': 'city',
      'ar': 'مدينة',
      'ur': 'شہر',
    },
    'zaqc29ii': {
      'en': 'country',
      'ar': 'دولة',
      'ur': 'ملک',
    },
    'rhptksyc': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
    '3g82nkbn': {
      'en': 'Addresss1',
      'ar': 'العناوين1',
      'ur': 'پتے 1',
    },
    'o52dvt7i': {
      'en': 'Address2',
      'ar': 'العنوان2',
      'ur': 'پتہ 2',
    },
    '7603venw': {
      'en': 'City',
      'ar': 'مدينة',
      'ur': 'شہر',
    },
    'mq0ih14g': {
      'en': 'Country',
      'ar': 'دولة',
      'ur': 'ملک',
    },
    'cr2onqbr': {
      'en': 'Confirm',
      'ar': 'يتأكد',
      'ur': 'تصدیق کریں۔',
    },
    'fmq6wgcm': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // wallet
  {
    '142uoeps': {
      'en': 'Wallet',
      'ar': 'محفظة',
      'ur': 'پرس',
    },
    '161nujgx': {
      'en': 'Wallet Balance',
      'ar': 'رصيد المحفظة',
      'ur': 'والیٹ بیلنس',
    },
    '72rk16fo': {
      'en': '4500 AED',
      'ar': '4500 درهم إماراتي',
      'ur': '4500 AED',
    },
    'hnmicob6': {
      'en': 'Confirm',
      'ar': 'يتأكد',
      'ur': 'تصدیق کریں۔',
    },
    'tb8sry9p': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // newaddress
  {
    'ae1upe4s': {
      'en': 'Add new Address',
      'ar': 'إضافة عنوان جديد',
      'ur': 'نیا پتہ شامل کریں۔',
    },
    'hjh5gsvm': {
      'en': 'Address1',
      'ar': 'العنوان1',
      'ur': 'پتہ 1',
    },
    'hkcdwfeb': {
      'en': '',
      'ar': 'العنوان1',
      'ur': 'پتہ 1',
    },
    'dof5z0su': {
      'en': 'Address2',
      'ar': 'العنوان2',
      'ur': 'پتہ 2',
    },
    'zyedi65m': {
      'en': '',
      'ar': 'العنوان2',
      'ur': 'پتہ 2',
    },
    'oxkkizq6': {
      'en': 'City',
      'ar': 'مدينة',
      'ur': 'شہر',
    },
    'mr2rktof': {
      'en': '',
      'ar': 'مدينة',
      'ur': 'شہر',
    },
    'biyvztos': {
      'en': 'Dubai',
      'ar': 'دبي',
      'ur': 'دبئی',
    },
    'ubi6zity': {
      'en': 'India',
      'ar': 'الهند',
      'ur': 'انڈیا',
    },
    '2pojp9oo': {
      'en': 'UAE',
      'ar': 'الامارات العربية المتحدة',
      'ur': 'یو اے ای',
    },
    'ys941gj0': {
      'en': 'Select Country',
      'ar': 'اختر البلد',
      'ur': 'ملک منتخب کریں۔',
    },
    'z5zjwcae': {
      'en': 'Search...',
      'ar': 'يبحث...',
      'ur': 'تلاش کریں...',
    },
    '063l4sfo': {
      'en': 'Work',
      'ar': 'عمل',
      'ur': 'کام',
    },
    'xmb62n1w': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
    'hps434u9': {
      'en': 'Others',
      'ar': 'آحرون',
      'ur': 'دوسرے',
    },
    '8t3vehb2': {
      'en': 'Confirm',
      'ar': 'يتأكد',
      'ur': 'تصدیق کریں۔',
    },
    'dlned129': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // loadwallet
  {
    'vp6kimcn': {
      'en': 'Load Wallet',
      'ar': 'تحميل المحفظة',
      'ur': 'پرس لوڈ کریں۔',
    },
    'pab38x3v': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'nfu4z15g': {
      'en': '20000',
      'ar': '20000',
      'ur': '20000',
    },
    'oct42a1z': {
      'en': 'Confirm',
      'ar': 'يتأكد',
      'ur': 'تصدیق کریں۔',
    },
  },
  // editmobilenumber
  {
    'kepexcto': {
      'en': 'Update Your Mobile Number',
      'ar': 'تحديث رقم هاتفك المحمول',
      'ur': 'اپنا موبائل نمبر اپ ڈیٹ کریں۔',
    },
    'a1mlugh4': {
      'en': 'We will Send an OTP to verify your Number',
      'ar': 'سوف نرسل لك رمز OTP للتحقق من رقمك',
      'ur': 'ہم آپ کے نمبر کی تصدیق کے لیے ایک OTP بھیجیں گے۔',
    },
    '67pyin1y': {
      'en': 'Mobile Number',
      'ar': 'رقم الهاتف المحمول',
      'ur': 'موبائل نمبر',
    },
    'y9i01wd7': {
      'en': 'Confirm',
      'ar': 'يتأكد',
      'ur': 'تصدیق کریں۔',
    },
  },
  // Citypage
  {
    'uvd4eqnk': {
      'en': 'Select City',
      'ar': 'اختر المدينة',
      'ur': 'شہر منتخب کریں۔',
    },
    'dwvpsc6i': {
      'en': 'Abu Dhabi',
      'ar': 'ابوظبي',
      'ur': 'ابوظہبی',
    },
    'tagb3y4f': {
      'en': 'Ajman',
      'ar': 'عجمان',
      'ur': 'عجمان',
    },
    'fp4gp5la': {
      'en': 'Al Ain',
      'ar': 'العين',
      'ur': 'العین',
    },
    '72paeyvh': {
      'en': 'Dubai',
      'ar': 'دبي',
      'ur': 'دبئی',
    },
    '3y4w9jmr': {
      'en': 'Fujarah',
      'ar': 'الفجيرة',
      'ur': 'فجارہ',
    },
    'el3pab1l': {
      'en': 'Ras Al Khaimah',
      'ar': 'رأس الخيمة',
      'ur': 'راس الخیمہ',
    },
    'wp6bx1sm': {
      'en': 'Sharjah',
      'ar': 'الشارقة',
      'ur': 'شارجہ',
    },
    '7fsy039h': {
      'en': 'Confirm',
      'ar': 'يتأكد',
      'ur': 'تصدیق کریں۔',
    },
    'g3k2543w': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // changelanguage
  {
    'ecchrrdr': {
      'en': 'Language',
      'ar': 'لغة',
      'ur': 'زبان',
    },
    'ogafuoga': {
      'en': 'Search Language',
      'ar': 'لغة البحث',
      'ur': 'زبان تلاش کریں۔',
    },
    'zdbhyuy3': {
      'en': 'English',
      'ar': 'إنجليزي',
      'ur': 'انگریزی',
    },
    'qdxw01mt': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'tfov4dln': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'p8908p5n': {
      'en': 'Arabic',
      'ar': 'عربي',
      'ur': 'عربی',
    },
    'mv3el5gx': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    '25gw58p9': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'p6wlvha6': {
      'en': 'Urdu',
      'ar': 'الأردية',
      'ur': 'اردو',
    },
    'zo5isv88': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    '3lx195sm': {
      'en': '',
      'ar': '',
      'ur': '',
    },
  },
  // deliverysummary
  {
    'tf64g6dt': {
      'en': 'Delivery Summary',
      'ar': 'ملخص التسليم',
      'ur': 'ڈیلیوری کا خلاصہ',
    },
    'x3ndoj9j': {
      'en': '3 items',
      'ar': '3 عناصر',
      'ur': '3 آئٹمز',
    },
    'v26vfvgv': {
      'en': 'Thai Long Vogue\nClothes',
      'ar': 'ملابس تايلاندية طويلة',
      'ur': 'تھائی لانگ ووگ\nکپڑے',
    },
    'ci2hf03z': {
      'en': '45 min',
      'ar': '45 دقيقة',
      'ur': '45 منٹ',
    },
    'as1stcec': {
      'en': 'City Name',
      'ar': 'اسم المدينة',
      'ur': 'شہر کا نام',
    },
    '6peic3ni': {
      'en': 'Palm Beach',
      'ar': 'بالم بيتش',
      'ur': 'پام بیچ',
    },
    'd5zq5nru': {
      'en': 'Strawberry Desert',
      'ar': 'صحراء الفراولة',
      'ur': 'اسٹرابیری صحرا',
    },
    'pxo73pki': {
      'en': 'Quantity : 01 Bottle ',
      'ar': 'الكمية : 01 زجاجة',
      'ur': 'مقدار: 01 بوتل',
    },
    'ih4zewrq': {
      'en': '01',
      'ar': '01',
      'ur': '01',
    },
    'xn5ztuw9': {
      'en': '\$10.50',
      'ar': '10.50 دولار',
      'ur': '\$10.50',
    },
    '38wo145u': {
      'en': 'Orange Fruit jam',
      'ar': 'مربى فاكهة البرتقال',
      'ur': 'اورنج فروٹ جام',
    },
    '9w5m4lia': {
      'en': 'Quantity: 01 Bottle',
      'ar': 'الكمية: 01 زجاجة',
      'ur': 'مقدار: 01 بوتل',
    },
    '9q4r84qv': {
      'en': '01',
      'ar': '01',
      'ur': '01',
    },
    'l6nanovm': {
      'en': '\$50.00',
      'ar': '50.00 دولار',
      'ur': '\$50.00',
    },
    '8mzc3c20': {
      'en': 'Golden Fruit Jam',
      'ar': 'مربى الفاكهة الذهبية',
      'ur': 'گولڈن فروٹ جام',
    },
    '2echw7x2': {
      'en': 'Quantity: 01 Bottle',
      'ar': 'الكمية: 01 زجاجة',
      'ur': 'مقدار: 01 بوتل',
    },
    'd1nhrucf': {
      'en': '01',
      'ar': '01',
      'ur': '01',
    },
    'aj6125wm': {
      'en': '\$20',
      'ar': '20 دولار',
      'ur': '\$20',
    },
    'bhteuv2b': {
      'en': 'Total Amount',
      'ar': 'المبلغ الإجمالي',
      'ur': 'کل رقم',
    },
    'uzcj3cxu': {
      'en': 'Inclusive of all taxes',
      'ar': 'شامل جميع الضرائب',
      'ur': 'تمام ٹیکسوں سمیت',
    },
    'l6a4fuvz': {
      'en': '\$30.49',
      'ar': '30.49 دولار',
      'ur': '\$30.49',
    },
    'wa5xjs8c': {
      'en': 'Confirrm',
      'ar': 'تأكيد',
      'ur': 'تصدیق کریں۔',
    },
    '66ji2lnz': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // tracking
  {
    '6rt5kkfi': {
      'en': 'Detail Location',
      'ar': 'تفاصيل الموقع',
      'ur': 'تفصیلی مقام',
    },
    'hysp8kd2': {
      'en': 'Distance',
      'ar': 'مسافة',
      'ur': 'فاصلہ',
    },
    'sdyyvu46': {
      'en': 'Delivery in',
      'ar': 'التسليم في',
      'ur': 'میں ترسیل',
    },
    'pbo8soc5': {
      'en': '40 kms',
      'ar': '40 كيلومتر',
      'ur': '40 کلومیٹر',
    },
    'yehtaw7t': {
      'en': '50 mins',
      'ar': '50 دقيقة',
      'ur': '50 منٹ',
    },
    'sjekjnp6': {
      'en': 'Estimated Pickup in 10 mins',
      'ar': 'من المتوقع أن يتم الاستلام خلال 10 دقائق',
      'ur': '10 منٹ میں پک اپ کا تخمینہ',
    },
    'wjwgc15m': {
      'en': '40 kms',
      'ar': '40 كيلومتر',
      'ur': '40 کلومیٹر',
    },
    'fuczg4q1': {
      'en': '50 mins delivery',
      'ar': 'التسليم خلال 50 دقيقة',
      'ur': '50 منٹ کی ترسیل',
    },
    'q0pdjg6c': {
      'en': 'Pickup Point',
      'ar': 'نقطة الإستلام',
      'ur': 'پک اپ پوائنٹ',
    },
    'm48exhxu': {
      'en': 'Change',
      'ar': 'يتغير',
      'ur': 'تبدیلی',
    },
    '5ic3pf7s': {
      'en': '48, Al Majarrah Street Hadbat Al Za\'faranah, Abu Dhabi',
      'ar': '48, شارع المجرة هضبة الزعفرانة, أبوظبي',
      'ur': '48، المجرہ اسٹریٹ حدبت الظفرانہ، ابوظہبی',
    },
    'iy4ir0vk': {
      'en': 'Delivery Point',
      'ar': 'نقطة التسليم',
      'ur': 'ڈیلیوری پوائنٹ',
    },
    '7yrfgobj': {
      'en': 'Change',
      'ar': 'يتغير',
      'ur': 'تبدیلی',
    },
    'ztw3wbju': {
      'en': '4014 Way CBD',
      'ar': '4014 طريقة CBD',
      'ur': '4014 وے سی بی ڈی',
    },
    'e61j7wfa': {
      'en': 'Checkout',
      'ar': 'الدفع',
      'ur': 'چیک آؤٹ',
    },
    'y2kl3t6w': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // homepage07
  {
    'e2ezbyyc': {
      'en': 'Get Upto 60%',
      'ar': 'احصل على خصم يصل إلى 60%',
      'ur': '60% تک حاصل کریں',
    },
    'hlzkq8ik': {
      'en': 'off your next order \nnow with our\n mobile app',
      'ar': 'احصل على خصم على طلبك التالي الآن باستخدام تطبيقنا المحمول',
      'ur': 'آپ کے اگلے آرڈر سے دور \nاب ہمارے ساتھ\n موبائل ایپ',
    },
    'wpktw5zu': {
      'en': 'Claim Now',
      'ar': 'اطلب الآن',
      'ur': 'ابھی دعوی کریں۔',
    },
    'v8hvbll3': {
      'en': 'Pizza',
      'ar': 'بيتزا',
      'ur': 'پیزا',
    },
    '5ylg6l6t': {
      'en': 'Burger',
      'ar': 'برجر',
      'ur': 'برگر',
    },
    'xa46m1vk': {
      'en': 'Drinks',
      'ar': 'مشروبات',
      'ur': 'مشروبات',
    },
    'bqf99us2': {
      'en': 'Fruits',
      'ar': 'الفواكه',
      'ur': 'پھل',
    },
    '17lfpit9': {
      'en': 'Foods',
      'ar': 'الأطعمة',
      'ur': 'کھانے کی اشیاء',
    },
    'wruyjj4y': {
      'en': 'Grocery',
      'ar': 'خضروات',
      'ur': 'گروسری',
    },
    'm7t0s441': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // homepage09
  {
    '7x3he5h6': {
      'en': 'Delivery anything, anywhere',
      'ar': 'توصيل أي شيء، في أي مكان',
      'ur': 'کچھ بھی، کہیں بھی ڈیلیوری کریں۔',
    },
    '5lebftu9': {
      'en': 'Sit back and relax, we will do your delivery safely and securely',
      'ar': 'اجلس واسترخِ، وسنتولى تسليم طلبك بأمان وأمان',
      'ur':
          'آرام سے بیٹھیں اور آرام کریں، ہم آپ کی ڈیلیوری محفوظ اور محفوظ طریقے سے کریں گے۔',
    },
    '7vlw381h': {
      'en': 'Select Pickup and Delivery Location',
      'ar': 'حدد موقع الاستلام والتسليم',
      'ur': 'پک اپ اور ڈیلیوری کا مقام منتخب کریں۔',
    },
    'z69d6cnd': {
      'en': 'Hassle free delivery ',
      'ar': 'تسليم خالي من المتاعب',
      'ur': 'پریشانی سے پاک ترسیل',
    },
    'r7i9sdf7': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // Pickuppoint
  {
    'tofq1vaf': {
      'en': 'Select Location',
      'ar': 'حدد الموقع',
      'ur': 'مقام منتخب کریں۔',
    },
    'nbpf59xk': {
      'en': 'Pick up point',
      'ar': 'نقطة الالتقاء',
      'ur': 'پک اپ پوائنٹ',
    },
    'acvs8ot4': {
      'en': '48, Al Majarrah Street Hadbat  Al Za\'faranah, Abu Dhabi',
      'ar': '48, شارع المجرة هضبة الزعفرانة, أبوظبي',
      'ur': '48، المجرہ اسٹریٹ حدبت الظفرانہ، ابوظہبی',
    },
    'frlokfbl': {
      'en': 'Confirm',
      'ar': 'يتأكد',
      'ur': 'تصدیق کریں۔',
    },
    'pjj5jwlc': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // pickupaddress
  {
    'yk07j9e5': {
      'en': 'Enter the Address',
      'ar': 'أدخل العنوان',
      'ur': 'ایڈریس درج کریں۔',
    },
    '3v2a916f': {
      'en': '48, Al Majarrah Street Hadbat  \nAl Za\'faranah',
      'ar': '48 شارع المجرة هضبة الزعفرانة',
      'ur': '48، المجرہ اسٹریٹ حدبت  \nالظفرانہ',
    },
    '2thuuxj9': {
      'en': 'Edit',
      'ar': 'يحرر',
      'ur': 'ترمیم کریں۔',
    },
    '751mafbf': {
      'en': 'Enter Address',
      'ar': 'أدخل العنوان',
      'ur': 'ایڈریس درج کریں۔',
    },
    'j3twicng': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'scmfm2y1': {
      'en': 'Landmark (Optional)',
      'ar': 'معلم (اختياري)',
      'ur': 'لینڈ مارک (اختیاری)',
    },
    '7nej7bym': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'gq7wk5zw': {
      'en': 'Receiver’s Name',
      'ar': 'اسم المستلم (اختياري)',
      'ur': 'وصول کنندہ کا نام (اختیاری',
    },
    'h5hrfow0': {
      'en': 'Receiver’s Mobile number',
      'ar': 'رقم الهاتف المحمول للمستلم (اختياري)',
      'ur': 'وصول کنندہ کا موبائل نمبر (اختیاری)',
    },
    'kk506vhf': {
      'en': 'Save to addresses',
      'ar': 'حفظ في العناوين',
      'ur': 'پتوں پر محفوظ کریں۔',
    },
    'w27tl67v': {
      'en': 'Submit',
      'ar': 'يُقدِّم',
      'ur': 'جمع کروائیں۔',
    },
    'z1u6imp1': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // deliveryaddress
  {
    'ipipya17': {
      'en': 'Enter the Address',
      'ar': 'أدخل العنوان',
      'ur': 'ایڈریس درج کریں۔',
    },
    'pl234978': {
      'en': '4014 Way CBD',
      'ar': '4014 طريقة CBD',
      'ur': '4014 وے سی بی ڈی',
    },
    'glji3jvm': {
      'en': 'Edit',
      'ar': 'يحرر',
      'ur': 'ترمیم کریں۔',
    },
    'l439aom8': {
      'en': 'Enter Address',
      'ar': 'أدخل العنوان',
      'ur': 'ایڈریس درج کریں۔',
    },
    'hfj1dq4g': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    '8c9l1yoe': {
      'en': 'Landmark (Optional)',
      'ar': 'معلم (اختياري)',
      'ur': 'لینڈ مارک (اختیاری)',
    },
    'p7llkeot': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'xg4y9pg6': {
      'en': 'Recepient’s Name (Optional)',
      'ar': 'اسم المستلم (اختياري)',
      'ur': 'وصول کنندہ کا نام (اختیاری)',
    },
    '4d07lido': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    '51ypkaku': {
      'en': 'Recepient’s Mobile number (Optional)',
      'ar': 'رقم الهاتف المحمول للمستلم (اختياري)',
      'ur': 'وصول کنندہ کا موبائل نمبر (اختیاری)',
    },
    'jdgh0ix0': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'hmvt1dp6': {
      'en': 'Submit',
      'ar': 'يُقدِّم',
      'ur': 'جمع کروائیں۔',
    },
    'dqvmdtrb': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // homepage08
  {
    'q68gm2kh': {
      'en': 'Select Pickup Location',
      'ar': 'حدد موقع الاستلام',
      'ur': 'پک اپ لوکیشن منتخب کریں۔',
    },
    'tcdvpuht': {
      'en': 'Select drop location',
      'ar': 'حدد موقع الإنزال',
      'ur': 'ڈراپ لوکیشن منتخب کریں۔',
    },
    'h8y2gvsz': {
      'en': 'Dimension',
      'ar': 'البعد',
      'ur': 'طول و عرض',
    },
    'wompoitc': {
      'en': '0',
      'ar': '0',
      'ur': '0',
    },
    '7gcb6ce5': {
      'en': 'Kg',
      'ar': 'كجم',
      'ur': 'کلو',
    },
    'wzvxya3q': {
      'en': 'Choose Vehicle type',
      'ar': 'اختر نوع السيارة',
      'ur': 'گاڑی کی قسم کا انتخاب کریں۔',
    },
    '89v5t30v': {
      'en': 'Two Wheeler',
      'ar': 'مركبة ذات عجلتين',
      'ur': 'ٹو وہیلر',
    },
    'fhll2fr9': {
      'en': 'Car',
      'ar': 'سيارة',
      'ur': 'کار',
    },
    'lmb1tb4p': {
      'en': 'Truck',
      'ar': 'شاحنة',
      'ur': 'ٹرک',
    },
    '3foqw7ag': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'r40vobeg': {
      'en': 'Search...',
      'ar': 'يبحث...',
      'ur': 'تلاش کریں...',
    },
    'ds4gvinx': {
      'en': 'Submit',
      'ar': 'يُقدِّم',
      'ur': 'جمع کروائیں۔',
    },
    '7lzoenzk': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // checkoutpage1
  {
    'l8cbji4d': {
      'en': 'Verify Details',
      'ar': 'التحقق من التفاصيل',
      'ur': 'تفصیلات کی تصدیق کریں۔',
    },
    'um4zt19f': {
      'en': '48, Al Majarra Street Hadbat',
      'ar': '48 شارع المجرة الحدبة',
      'ur': '48، المجرہ اسٹریٹ حدبت',
    },
    '156gkyfv': {
      'en': '4014 Way CBD',
      'ar': '4014 طريقة CBD',
      'ur': '4014 وے سی بی ڈی',
    },
    '6lznxm8v': {
      'en': '40 kms',
      'ar': '40 كيلومتر',
      'ur': '40 کلومیٹر',
    },
    'e1mf744q': {
      'en': '50 mins delivery',
      'ar': 'التسليم خلال 50 دقيقة',
      'ur': '50 منٹ کی ترسیل',
    },
    'gi12g5o4': {
      'en': 'Instruction to Delivery Partner',
      'ar': 'تعليمات لشريك التوصيل',
      'ur': 'ڈیلیوری پارٹنر کو ہدایت',
    },
    'u5vvyq26': {
      'en': 'Coupons & Discounts',
      'ar': 'كوبونات وخصومات',
      'ur': 'کوپن اور چھوٹ',
    },
    'alwtgxj0': {
      'en': 'Apply Coupon',
      'ar': 'تطبيق الكوبون',
      'ur': 'کوپن لگائیں۔',
    },
    'l1kwfgcm': {
      'en': 'Bill Details',
      'ar': 'تفاصيل الفاتورة',
      'ur': 'بل کی تفصیلات',
    },
    'qstf2pjp': {
      'en': 'Delivery Charges',
      'ar': 'رسوم التوصيل',
      'ur': 'ڈیلیوری چارجز',
    },
    'byez2a4d': {
      'en': 'AED 129',
      'ar': '129 درهم إماراتي',
      'ur': 'AED 129',
    },
    'oqp7cacu': {
      'en': 'CPICOUPON',
      'ar': 'كوبون خصم سي بي آي',
      'ur': 'CPICOUPON',
    },
    '63k9f48l': {
      'en': 'AED 10',
      'ar': '10 درهم إماراتي',
      'ur': 'AED 10',
    },
    'j1ugidz5': {
      'en': 'To Pay',
      'ar': 'للدفع',
      'ur': 'ادا کرنا',
    },
    'up6uso5t': {
      'en': 'AED 119',
      'ar': '119 درهم إماراتي',
      'ur': 'AED 119',
    },
    'fomzs6h2': {
      'en': 'Review your order to avoid cancellations',
      'ar': 'قم بمراجعة طلبك لتجنب الإلغاءات',
      'ur': 'منسوخی سے بچنے کے لیے اپنے آرڈر کا جائزہ لیں۔',
    },
    '2v82lc1c': {
      'en':
          'A cancellation fee will be charged if an order is cancelled after the delivery partner has arrived at the pickup location',
      'ar':
          'سيتم فرض رسوم إلغاء إذا تم إلغاء الطلب بعد وصول شريك التوصيل إلى موقع الاستلام',
      'ur':
          'ڈیلیوری پارٹنر کے پک اپ مقام پر پہنچنے کے بعد آرڈر منسوخ ہونے پر منسوخی فیس وصول کی جائے گی۔',
    },
    'yuoztrwz': {
      'en': 'Read Policy',
      'ar': 'اقرأ السياسة',
      'ur': 'پالیسی پڑھیں',
    },
    '5z0s4m4r': {
      'en': 'Checkout',
      'ar': 'الدفع',
      'ur': 'چیک آؤٹ',
    },
    'videmfoo': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // button
  {
    'fbbieulm': {
      'en': 'HomePage01',
      'ar': 'الصفحة الرئيسية01',
      'ur': 'ہوم پیج01',
    },
    'm2xtfo6t': {
      'en': 'Homepage02',
      'ar': 'الصفحة الرئيسية02',
      'ur': 'ہوم پیج02',
    },
    'xq65hrjk': {
      'en': 'pickup point',
      'ar': 'نقطة الالتقاط',
      'ur': 'پک اپ پوائنٹ',
    },
    '1l5xdphv': {
      'en': 'Pickup Address',
      'ar': 'عنوان الاستلام',
      'ur': 'اٹھانے کا پتہ',
    },
    '0a7j4wbn': {
      'en': 'HomePage',
      'ar': 'الصفحة الرئيسية',
      'ur': 'ہوم پیج',
    },
    'slili77m': {
      'en': 'MainPage',
      'ar': 'الصفحة الرئيسية',
      'ur': 'مین پیج',
    },
    '4iriwj5k': {
      'en': 'LoginPage',
      'ar': 'صفحة تسجيل الدخول',
      'ur': 'لاگ ان پیج',
    },
    'eapcsceu': {
      'en': 'OTP',
      'ar': 'كلمة مرور لمرة واحدة',
      'ur': 'OTP',
    },
    's3misyn9': {
      'en': 'Change Language',
      'ar': 'تغيير اللغة',
      'ur': 'زبان تبدیل کریں۔',
    },
    'xbyc2m42': {
      'en': 'Load Wallet',
      'ar': 'تحميل المحفظة',
      'ur': 'پرس لوڈ کریں۔',
    },
    'ay8m85qg': {
      'en': 'Change Gender',
      'ar': 'تغيير الجنس',
      'ur': 'جنس تبدیل کریں۔',
    },
    'pibsqill': {
      'en': 'Delivery Point',
      'ar': 'نقطة التسليم',
      'ur': 'ڈیلیوری پوائنٹ',
    },
    'xw1poga1': {
      'en': 'Delivery Address',
      'ar': 'عنوان التسليم',
      'ur': 'ڈیلیوری کا پتہ',
    },
    '57fsyed4': {
      'en': 'Tracking1',
      'ar': 'التتبع1',
      'ur': 'ٹریکنگ 1',
    },
    '07xtjm6g': {
      'en': 'CheckOut Page',
      'ar': 'صفحة الخروج',
      'ur': 'چیک آؤٹ صفحہ',
    },
    '0k78fgbw': {
      'en': 'Profile Menu',
      'ar': 'قائمة الملف الشخصي',
      'ur': 'پروفائل مینو',
    },
    'mmpu5840': {
      'en': 'Edit Name',
      'ar': 'تعديل الاسم',
      'ur': 'نام میں ترمیم کریں۔',
    },
    'zbre3m8r': {
      'en': 'Edit Email ID',
      'ar': 'تعديل معرف البريد الإلكتروني',
      'ur': 'ای میل آئی ڈی میں ترمیم کریں۔',
    },
    '1d87awt1': {
      'en': 'My Address',
      'ar': 'عنواني',
      'ur': 'میرا پتہ',
    },
    '2abg196g': {
      'en': 'Wallet',
      'ar': 'محفظة',
      'ur': 'پرس',
    },
    '277xsb8k': {
      'en': 'New Address',
      'ar': 'عنوان جديد',
      'ur': 'نیا پتہ',
    },
    'yc3nbypa': {
      'en': 'Edit Mobile Number',
      'ar': 'تعديل رقم الهاتف المحمول',
      'ur': 'موبائل نمبر میں ترمیم کریں۔',
    },
    'emn1evbn': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'ur': 'پروفائل میں ترمیم کریں۔',
    },
    'vm04uvdo': {
      'en': 'City Page',
      'ar': 'صفحة المدينة',
      'ur': 'سٹی پیج',
    },
    '2bqm9h8z': {
      'en': 'Tracking2',
      'ar': 'التتبع2',
      'ur': 'ٹریکنگ2',
    },
  },
  // tracking2
  {
    '843k1zqf': {
      'en': 'Detail Location',
      'ar': 'تفاصيل الموقع',
      'ur': 'تفصیلی مقام',
    },
    'feuhf0kf': {
      'en': 'Your Package on the way',
      'ar': 'حزمتك في الطريق',
      'ur': 'آپ کا پیکیج راستے میں ہے۔',
    },
    'mfeti6rn': {
      'en': 'Arriving at pick up point in ',
      'ar': 'الوصول إلى نقطة الاستلام في',
      'ur': 'پک اپ پوائنٹ پر پہنچنا',
    },
    '6fu4ktz3': {
      'en': '2 ',
      'ar': '2',
      'ur': '2',
    },
    'h1wio5ae': {
      'en': 'min',
      'ar': 'دقيقة',
      'ur': 'منٹ',
    },
    'nvtb5dxj': {
      'en': 'Harry Johnson',
      'ar': 'هاري جونسون',
      'ur': 'ہیری جانسن',
    },
    'bpeeahn3': {
      'en': '4.9',
      'ar': '4.9',
      'ur': '4.9',
    },
    '9sn8mufb': {
      'en': '1213 Washington Blvd, Belpre, OH ',
      'ar': '1213 واشنطن بوليفارد، بيلبري، أوهايو',
      'ur': '1213 واشنگٹن Blvd، Belpre، OH',
    },
    'whtrk2qr': {
      'en': '121 Pike St, Marietta, OH',
      'ar': '121 شارع بايك، مارييتا، أوهايو',
      'ur': '121 پائیک سینٹ، میریٹا، او ایچ',
    },
    'gt295x45': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // paymentpage
  {
    'n4iju7zz': {
      'en': 'Payment Methods',
      'ar': 'طرق الدفع',
      'ur': 'ادائیگی کے طریقے',
    },
    'tgngg0ah': {
      'en': '48, Al Majarrah Street Hadbat',
      'ar': '48 شارع المجرة الهضبة',
      'ur': '48، المجرہ اسٹریٹ حدبت',
    },
    'dqwrpk7a': {
      'en': '4014 Way CBD',
      'ar': '4014 طريقة CBD',
      'ur': '4014 وے سی بی ڈی',
    },
    'r2raxhxk': {
      'en': '40kms',
      'ar': '40 كيلومتر',
      'ur': '40 کلومیٹر',
    },
    '7z6frk1i': {
      'en': '50 mins Delivery',
      'ar': '50 دقيقة للتسليم',
      'ur': '50 منٹ کی ترسیل',
    },
    'svqejg1x': {
      'en': 'Payment Methods',
      'ar': 'طرق الدفع',
      'ur': 'ادائیگی کے طریقے',
    },
    'y50mlm9r': {
      'en': 'Credit Card / Debit Card                                  ',
      'ar': 'بطاقة الائتمان / بطاقة الخصم',
      'ur': 'کریڈٹ کارڈ/ڈیبٹ کارڈ',
    },
    'vz46hlvp': {
      'en': 'Add a new Card',
      'ar': 'أضف بطاقة جديدة',
      'ur': 'نیا کارڈ شامل کریں۔',
    },
    'qz87oerz': {
      'en':
          'Cash                                                                      ',
      'ar': 'نقدي',
      'ur': 'کیش',
    },
    'scx4bbtn': {
      'en':
          'Wallets                                                                  ',
      'ar': 'المحافظ',
      'ur': 'بٹوے',
    },
    'b5f8s1re': {
      'en': 'Pay',
      'ar': 'يدفع',
      'ur': 'ادا کریں۔',
    },
    'ind9zpzc': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // AddcardDetails
  {
    '88up40q4': {
      'en': 'Add new card',
      'ar': 'إضافة بطاقة جديدة',
      'ur': 'نیا کارڈ شامل کریں۔',
    },
    '6ae8buq4': {
      'en': 'Card number',
      'ar': 'رقم البطاقة',
      'ur': 'کارڈ نمبر',
    },
    '4iw7rfzv': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'egge6nx1': {
      'en': 'Valid through (MM/YY)',
      'ar': 'صالحة حتى (MM/YY)',
      'ur': '(MM/YY) کے ذریعے درست',
    },
    '81tef3i3': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    '0n4dku9w': {
      'en': 'CVV',
      'ar': 'قيمة رمز التحقق',
      'ur': 'سی وی وی',
    },
    '3t2pej1o': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'zy6xf3cu': {
      'en': 'Name on Card',
      'ar': 'الاسم الموجود على البطاقة',
      'ur': 'کارڈ پر نام',
    },
    'bzy0of64': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'w2k5ezcn': {
      'en': 'Nickname (for Identification)',
      'ar': 'اللقب (للتعريف)',
      'ur': 'عرفی نام (شناخت کے لیے)',
    },
    '62wo30ha': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    '617qrewc': {
      'en': 'Secure this card',
      'ar': 'تأمين هذه البطاقة',
      'ur': 'اس کارڈ کو محفوظ کریں۔',
    },
    't1cep86b': {
      'en': 'Proceed',
      'ar': 'يتابع',
      'ur': 'آگے بڑھیں۔',
    },
    'ahzbqw2u': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // sendLocation
  {
    'vzv565m1': {
      'en': 'Pickup location',
      'ar': 'مكان الاستلام',
      'ur': 'پک اپ کا مقام',
    },
    'm0bc8nwc': {
      'en': '*',
      'ar': '*',
      'ur': '*',
    },
    '83mf4cb7': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'oeadaxfp': {
      'en': 'Search Pickup Location',
      'ar': 'البحث عن موقع الاستلام',
      'ur': 'پک اپ لوکیشن تلاش کریں۔',
    },
    'gw0x64wi': {
      'en': 'Drop point',
      'ar': 'نقطة الإسقاط',
      'ur': 'ڈراپ پوائنٹ',
    },
    'yzgua4xp': {
      'en': '*',
      'ar': '*',
      'ur': '*',
    },
    's73hqkem': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'sx0umdoq': {
      'en': 'Search Drop Location',
      'ar': 'البحث عن موقع الإسقاط',
      'ur': 'ڈراپ لوکیشن تلاش کریں۔',
    },
    'hzm2yyhx': {
      'en': 'Any Instructions for the delivery Partner?',
      'ar': 'هل هناك تعليمات لشريك التوصيل؟',
      'ur': 'ڈیلیوری پارٹنر کے لیے کوئی ہدایات؟',
    },
    '91an64eb': {
      'en':
          'By confirming I accept this order doesn’t contain illegal/resticted items, if illegal/restricted items are found by App Partner, they may report it to the law enforcement authorities.Terms and Conditions.',
      'ar':
          'من خلال التأكيد على أنني أوافق على أن هذا الطلب لا يحتوي على عناصر غير قانونية/محظورة، وإذا عثر شريك التطبيق على عناصر غير قانونية/محظورة، فيجوز له الإبلاغ عنها إلى سلطات إنفاذ القانون.الشروط والأحكام.',
      'ur':
          'اس بات کی تصدیق کر کے کہ میں قبول کرتا ہوں کہ اس آرڈر میں غیر قانونی/ممنوعہ آئٹمز شامل نہیں ہیں، اگر ایپ پارٹنر کے ذریعے غیر قانونی/محدود اشیاء پائی جاتی ہیں، تو وہ قانون نافذ کرنے والے حکام کو اس کی اطلاع دے سکتے ہیں۔شرائط و ضوابط۔',
    },
    'mosp8fol': {
      'en': 'Confirm Order',
      'ar': 'تأكيد الطلب',
      'ur': 'آرڈر کی تصدیق کریں۔',
    },
    'mayvgbee': {
      'en': 'Send packages in Chennai',
      'ar': 'إرسال الطرود في تشيناي',
      'ur': 'چنئی میں پیکج بھیجیں۔',
    },
    'l5ybbyrl': {
      'en': 'Your on demand local courier',
      'ar': 'خدمة التوصيل المحلية حسب الطلب',
      'ur': 'آپ کا آن ڈیمانڈ مقامی کورئیر',
    },
    's7il1dl8': {
      'en': 'GHOST',
      'ar': 'شبح',
      'ur': 'GHOST',
    },
    'g82o6l2f': {
      'en': 'Cart',
      'ar': 'العربة',
      'ur': 'ٹوکری',
    },
    'yco1f27f': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
      'ur': 'سائن ان کریں۔',
    },
    '81rkwf6g': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // websignin
  {
    'm9w4lqfx': {
      'en': 'GHOST',
      'ar': 'شبح',
      'ur': 'GHOST',
    },
    'vov3si67': {
      'en': 'Cart',
      'ar': 'العربة',
      'ur': 'ٹوکری',
    },
    'gs0yun3s': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
      'ur': 'سائن ان کریں۔',
    },
    'h0m1nwuv': {
      'en': 'Send packages in Chennai',
      'ar': 'إرسال الطرود في تشيناي',
      'ur': 'چنئی میں پیکج بھیجیں۔',
    },
    'fjuui4vs': {
      'en': 'Your on demand local courier',
      'ar': 'خدمة التوصيل المحلية حسب الطلب',
      'ur': 'آپ کا آن ڈیمانڈ مقامی کورئیر',
    },
    'xmg1by82': {
      'en': 'Pickup location',
      'ar': 'مكان الاستلام',
      'ur': 'پک اپ کا مقام',
    },
    '5n221zqg': {
      'en': '*',
      'ar': '*',
      'ur': '*',
    },
    'mpsz669w': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'je153a1s': {
      'en': 'Search Pickup Location',
      'ar': 'البحث عن موقع الاستلام',
      'ur': 'پک اپ لوکیشن تلاش کریں۔',
    },
    'aafhrij6': {
      'en': 'Drop point',
      'ar': 'نقطة الإسقاط',
      'ur': 'ڈراپ پوائنٹ',
    },
    'w54nk986': {
      'en': '*',
      'ar': '*',
      'ur': '*',
    },
    'b546vy77': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'gshhaugx': {
      'en': 'Search Drop Location',
      'ar': 'البحث عن موقع الإسقاط',
      'ur': 'ڈراپ لوکیشن تلاش کریں۔',
    },
    'nfw0takx': {
      'en': 'Any instruction for delivery\npartner?',
      'ar': 'هل هناك تعليمات لشريك التوصيل؟',
      'ur': 'ترسیل کے لیے کوئی ہدایات\nساتھی؟',
    },
    'wreo51yu': {
      'en':
          'By confirming I accept this order doesn’t contain illegal/resticted items, if illegal/restricted items are found by Partner, they may report it to the law enforcement authorities.Terms and Conditions.',
      'ar':
          'من خلال التأكيد على أنني أوافق على أن هذا الطلب لا يحتوي على عناصر غير قانونية/محظورة، وإذا عثر الشريك على عناصر غير قانونية/محظورة، فيحق له الإبلاغ عنها إلى سلطات إنفاذ القانون.الشروط والأحكام.',
      'ur':
          'اس بات کی تصدیق کر کے میں قبول کرتا ہوں کہ اس آرڈر میں غیر قانونی/ممنوعہ آئٹمز شامل نہیں ہیں، اگر پارٹنر کے ذریعہ غیر قانونی/محدود اشیاء پائی جاتی ہیں، تو وہ قانون نافذ کرنے والے حکام کو اس کی اطلاع دے سکتے ہیں۔ شرائط و ضوابط۔',
    },
    'nuwggh4j': {
      'en': 'Sign in & Pay',
      'ar': 'تسجيل الدخول والدفع',
      'ur': 'سائن ان کریں اور ادائیگی کریں۔',
    },
    'xjyyn33i': {
      'en': 'Invoice',
      'ar': 'فاتورة',
      'ur': 'رسید',
    },
    'go2r0lys': {
      'en': '•  Cash cannot be used to Send Package',
      'ar': '• لا يمكن استخدام النقود لإرسال الطرد',
      'ur': '• پیکج بھیجنے کے لیے کیش کا استعمال نہیں کیا جا سکتا',
    },
    'qwo8hmhy': {
      'en': '• Delivery charges may change after signing i',
      'ar': '• قد تتغير رسوم التوصيل بعد التوقيع',
      'ur': 'ڈیلیوری چارجز i دستخط کرنے کے بعد تبدیل ہو سکتے ہیں۔',
    },
    '45u3bnze': {
      'en': 'Partner Delivery Fee ',
      'ar': 'رسوم التوصيل للشريك',
      'ur': 'پارٹنر ڈیلیوری فیس',
    },
    'qhnjayo1': {
      'en': '\$46',
      'ar': '46 دولار',
      'ur': '\$46',
    },
    'phozltol': {
      'en': 'To Pay',
      'ar': 'للدفع',
      'ur': 'ادا کرنا',
    },
    'n3unp3ow': {
      'en': '\$46',
      'ar': '46 دولار',
      'ur': '\$46',
    },
    'kau139ua': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // webcheckout
  {
    '1kqith8t': {
      'en': 'GHOST',
      'ar': 'شبح',
      'ur': 'GHOST',
    },
    'wnjtm9lg': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
      'ur': 'سائن ان کریں۔',
    },
    '5x6kxte9': {
      'en': 'Sign in to place your order',
      'ar': 'تسجيل الدخول لتقديم طلبك',
      'ur': 'اپنا آرڈر دینے کے لیے سائن ان کریں۔',
    },
    'datydsy7': {
      'en':
          'New to Dunzo? Sign up now to get started! Or log in to your existing account',
      'ar':
          'هل أنت جديد على Dunzo؟ سجِّل الآن للبدء! أو سجِّل الدخول إلى حسابك الحالي',
      'ur':
          'Dunzo میں نئے ہیں؟ شروع کرنے کے لیے ابھی سائن اپ کریں! یا اپنے موجودہ اکاؤنٹ میں لاگ ان کریں۔',
    },
    'nd2t8tjb': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
      'ur': 'سائن ان کریں۔',
    },
    '4dsb22wx': {
      'en': 'Your Cart',
      'ar': 'عربة التسوق الخاصة بك',
      'ur': 'آپ کی ٹوکری',
    },
    'il7s2i5u': {
      'en': 'from',
      'ar': 'من',
      'ur': 'سے',
    },
    '8xsnchuy': {
      'en': 'Send Packages',
      'ar': 'إرسال الطرود',
      'ur': 'پیکجز بھیجیں۔',
    },
    'm9b9569o': {
      'en': 'Pickup Location',
      'ar': 'مكان الاستلام',
      'ur': 'پک اپ کا مقام',
    },
    'y2443qx3': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'jp1zy8gw': {
      'en':
          'KG Halli, D\' Souza Layout, Ashok Nagar, Bengaluru, Karnataka, India, 560001\n\n',
      'ar':
          'KG Halli, D\'Souza Layout, Ashok Nagar, بنغالورو, كارناتاكا, الهند, 560001',
      'ur':
          'کے جی ہالی، ڈی سوزا لے آؤٹ، اشوک نگر، بنگلورو، کرناٹک، بھارت، 560001',
    },
    'ek5yuxc7': {
      'en': 'Drop Location',
      'ar': 'موقع الإنزال',
      'ur': 'ڈراپ لوکیشن',
    },
    '7p8j3kqj': {
      'en':
          'KG Halli, D\' Souza Layout, Ashok Nagar, Bengaluru, Karnataka, India, 560001\n\n',
      'ar':
          'KG Halli, D\'Souza Layout, Ashok Nagar, بنغالورو, كارناتاكا, الهند, 560001',
      'ur':
          'کے جی ہالی، ڈی سوزا لے آؤٹ، اشوک نگر، بنگلورو، کرناٹک، بھارت، 560001',
    },
    'fmykeog2': {
      'en': 'Select payment method',
      'ar': 'حدد طريقة الدفع',
      'ur': 'ادائیگی کا طریقہ منتخب کریں۔',
    },
    '43dmdsyd': {
      'en': 'Select your payment method from the existing one or add new one',
      'ar': 'حدد طريقة الدفع الخاصة بك من الطريقة الحالية أو أضف طريقة جديدة',
      'ur': 'موجودہ سے اپنی ادائیگی کا طریقہ منتخب کریں یا نیا شامل کریں۔',
    },
    'lrehqdfh': {
      'en': 'Any Instructions related to delivery?',
      'ar': 'هل هناك أي تعليمات تتعلق بالتسليم؟',
      'ur': 'ترسیل سے متعلق کوئی ہدایات؟',
    },
    '9wfwkrrt': {
      'en': 'Invoice',
      'ar': 'فاتورة',
      'ur': 'رسید',
    },
    '029wpcgd': {
      'en': '• Delivery charges may change after signing in',
      'ar': '• قد تتغير رسوم التوصيل بعد تسجيل الدخول',
      'ur': '• سائن ان کرنے کے بعد ڈیلیوری چارجز تبدیل ہو سکتے ہیں۔',
    },
    'ts39twus': {
      'en': 'Partner Delivery Fee ',
      'ar': 'رسوم التوصيل للشريك',
      'ur': 'پارٹنر ڈیلیوری فیس',
    },
    'ffx9ye5g': {
      'en': '\$46',
      'ar': '46 دولار',
      'ur': '\$46',
    },
    '03i88e2z': {
      'en': 'To Pay',
      'ar': 'للدفع',
      'ur': 'ادا کرنا',
    },
    '89tecckq': {
      'en': '\$46',
      'ar': '46 دولار',
      'ur': '\$46',
    },
    'udtymlbu': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
  },
  // menu
  {
    '33pv6wys': {
      'en': 'Home',
      'ar': 'بيت',
      'ur': 'گھر',
    },
    'lqoccvwi': {
      'en': 'Rate App',
      'ar': 'تقييم التطبيق',
      'ur': 'ایپ کی درجہ بندی کریں۔',
    },
    'hkq275q4': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'ur': 'پروفائل',
    },
  },
  // changegender
  {
    'r6if8yw8': {
      'en': 'Choose your gender',
      'ar': 'اختر جنسك',
      'ur': 'اپنی جنس کا انتخاب کریں۔',
    },
    'ilpuj2lh': {
      'en': 'Male',
      'ar': 'ذكر',
      'ur': 'مرد',
    },
    '16yout0n': {
      'en': 'Female',
      'ar': 'أنثى',
      'ur': 'خاتون',
    },
    'b7x7gzg0': {
      'en': 'Prefer not to specify',
      'ar': 'يفضل عدم التحديد',
      'ur': 'وضاحت نہ کرنے کو ترجیح دیں۔',
    },
    'td1ae7fu': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'ur': 'منسوخ کریں۔',
    },
    'qs9l6fgw': {
      'en': 'Ok',
      'ar': 'نعم',
      'ur': 'ٹھیک ہے',
    },
  },
  // passwordchange
  {
    'ix135syh': {
      'en': 'Update Password',
      'ar': 'تحديث كلمة المرور',
      'ur': 'پاس ورڈ اپ ڈیٹ کریں۔',
    },
    'ibeq4py2': {
      'en': 'Enter Your Password',
      'ar': 'أدخل كلمة المرور الخاصة بك',
      'ur': 'اپنا پاس ورڈ درج کریں۔',
    },
    'w1bpbotm': {
      'en': 'Type Password',
      'ar': 'اكتب كلمة المرور',
      'ur': 'پاس ورڈ ٹائپ کریں۔',
    },
    'aqqr2fan': {
      'en': 'Retype Password',
      'ar': 'أعد كتابة كلمة المرور',
      'ur': 'پاس ورڈ دوبارہ ٹائپ کریں۔',
    },
    'tbpjpku9': {
      'en': 'Submit',
      'ar': 'يُقدِّم',
      'ur': 'جمع کروائیں۔',
    },
  },
  // changeprofilephoto
  {
    '90whwwv0': {
      'en': 'Change Photo',
      'ar': 'تغيير الصورة',
      'ur': 'تصویر تبدیل کریں۔',
    },
    'epc1tm6f': {
      'en': 'Upload Image',
      'ar': 'تحميل الصورة',
      'ur': 'تصویر اپ لوڈ کریں۔',
    },
    'r2jeax1q': {
      'en': 'Save',
      'ar': 'يحفظ',
      'ur': 'محفوظ کریں۔',
    },
  },
  // pickup
  {
    '58d8o3it': {
      'en': 'Search / Choose Pickup Location',
      'ar': 'البحث / اختيار موقع الاستلام',
      'ur': 'تلاش کریں / اٹھانے کی جگہ کا انتخاب کریں۔',
    },
    'u3nxu34d': {
      'en': 'Search location..',
      'ar': 'البحث عن الموقع..',
      'ur': 'مقام تلاش کریں..',
    },
    'i317s4ax': {
      'en': 'Use current location',
      'ar': 'استخدم الموقع الحالي',
      'ur': 'موجودہ مقام کا استعمال کریں۔',
    },
  },
  // pickuplocationnotfound
  {
    'rtzr1qyq': {
      'en': 'Search / Choose Pickup Location',
      'ar': 'البحث / اختيار موقع الاستلام',
      'ur': 'تلاش کریں / اٹھانے کی جگہ کا انتخاب کریں۔',
    },
    'k3n1koms': {
      'en': 'Search location..',
      'ar': 'البحث عن الموقع..',
      'ur': 'مقام تلاش کریں..',
    },
    'mn9nxjmi': {
      'en': 'Use current location',
      'ar': 'استخدم الموقع الحالي',
      'ur': 'موجودہ مقام کا استعمال کریں۔',
    },
    'oze3tx96': {
      'en': 'Unable to fetch gps location',
      'ar': 'غير قادر على جلب موقع GPS',
      'ur': 'جی پی ایس لوکیشن حاصل کرنے سے قاصر',
    },
    'zgo8a34h': {
      'en':
          'You have blocked the app from tracking your location. \nPleasechange your location settings\n in the browser.',
      'ar':
          'لقد قمت بحظر التطبيق من تتبع موقعك.\nيرجى تغيير إعدادات موقعك\nفي المتصفح.',
      'ur':
          'آپ نے ایپ کو اپنے مقام کو ٹریک کرنے سے روک دیا ہے۔ \nبراہ کرم اپنے مقام کی ترتیبات تبدیل کریں۔\n براؤزر میں',
    },
    'eo4sp1fr': {
      'en': 'Search for location',
      'ar': 'البحث عن الموقع',
      'ur': 'مقام تلاش کریں۔',
    },
  },
  // signinn
  {
    'do4cgaxi': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
      'ur': 'سائن ان کریں۔',
    },
    'gu30hve8': {
      'en': 'Get started with App',
      'ar': 'البدء باستخدام التطبيق',
      'ur': 'ایپ کے ساتھ شروع کریں۔',
    },
    'c41g6t53': {
      'en': '*',
      'ar': '*',
      'ur': '*',
    },
    'wpdsbfbe': {
      'en': 'Enter your phone number',
      'ar': 'أدخل رقم هاتفك',
      'ur': 'اپنا فون نمبر درج کریں۔',
    },
    'xf6ykxgn': {
      'en': '+91',
      'ar': '+91',
      'ur': '+91',
    },
    '5bwgns60': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    '5yy2vbiz': {
      'en': 'Mobile Number',
      'ar': 'رقم الهاتف المحمول',
      'ur': 'موبائل نمبر',
    },
    'f8yqvm2z': {
      'en': 'I accept the terms of use  & privacy policy',
      'ar': 'أوافق على شروط الاستخدام وسياسة الخصوصية',
      'ur': 'میں استعمال کی شرائط اور رازداری کی پالیسی کو قبول کرتا ہوں۔',
    },
    '2x3va1qj': {
      'en': 'View T&C',
      'ar': 'عرض الشروط والأحكام',
      'ur': 'T&C دیکھیں',
    },
    'p7drvq69': {
      'en': 'Send OTP',
      'ar': 'إرسال OTP',
      'ur': 'OTP بھیجیں۔',
    },
  },
  // Miscellaneous
  {
    'oha8t9p1': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'ynhghbfa': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'hhd5e2lk': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'p62kcnnv': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'ly4qo1s1': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'oqlcd0pn': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    '711u31cu': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    '4v2ywr21': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'eos22k6s': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'rs8c8vm0': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    '4w1d90kk': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    '4uxjo0n1': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'ph3xhblo': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'k3o79lht': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'kia22nlm': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    '8xixdpqj': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'yq0h7trp': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'ownk77xu': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'b3hr069w': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'b0bal027': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    '8os3fe8h': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'jl3usks9': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'jsk8s69s': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'i1d0jpps': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'kktb4028': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'p0ofrd5u': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    '13qs3n8p': {
      'en': '',
      'ar': '',
      'ur': '',
    },
    'a07fkshb': {
      'en': '',
      'ar': '',
      'ur': '',
    },
  },
].reduce((a, b) => a..addAll(b));
