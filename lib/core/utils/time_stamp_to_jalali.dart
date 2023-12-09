import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class DateTimeConvertor {
  static String? timeStampToJalali(String input) {
    // return '${Jalali.fromDateTime(DateTime.parse(input)).hour}:${Jalali.fromDateTime(DateTime.parse(input)).minute}  ${Jalali.fromDateTime(DateTime.parse(input)).year}/${Jalali.fromDateTime(DateTime.parse(input)).month}/${Jalali.fromDateTime(DateTime.parse(input)).day}';
    final f = Jalali.fromDateTime(DateTime.parse(input).toLocal());
    return '${(f.hour.toString().length == 2 ? f.hour : ('0${f.hour}')).toString().toPersianDigit()}:${(f.minute.toString().length == 2 ? f.minute : ('0${f.minute}')).toString().toPersianDigit()}  ${f.year.toString().toPersianDigit()}/${f.month.toString().toPersianDigit()}/${f.day.toString().toPersianDigit()}';
  }

  static String jalaliToGregorian(String input) {
    var parts = input.split('/');
    Jalali j2 =
    Jalali(int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));
    Gregorian g2 = j2.toGregorian();

    return gregorianformatter(g2);

  }

  static String convertTimeStampToJalali(String time) {
    DateTime dateTime = DateTime.parse(time);
    var timestamp = "${dateTime.year}-${dateTime.month}-${dateTime.day}";

    var parts = timestamp.split('-');

    Gregorian g = Gregorian(
        int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));

    Jalali g2j1 = g.toJalali();
    String temp = '${g2j1.year}/${g2j1.month}/${g2j1.day}';

    return temp;
  }
  
  static String convertTimeStampToJalaliCardDate(int time) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(time);
    var gregor = "${date.year}-${date.month}-${date.day}";
    var jalali = DateTimeConvertor.gregorianToJalali(gregor.replaceAll('-', '/'));
    
    var year = jalali.split('-')[0].substring(2, jalali.split('-')[0].length).toPersianDigit();
    var mount = jalali.split('-')[1].toPersianDigit();
    
    return '$year/$mount';
  }

  static String? timeStampNowDateFormat(DateTime f) {
    return '${f.year.toString().toPersianDigit()}-${f.month.toString().toPersianDigit()}-${f.day.toString().toPersianDigit()}';
  }

  static String? timeStampNowDateAndTimeFormat(DateTime f) {
    return '${f.year.toString().toPersianDigit()}-${f.month.toString().toPersianDigit()}-${f.day.toString().toPersianDigit()}';
  }

  static String gregorianToJalali(String gregorian) {
    var parts = gregorian.split('/');

    Gregorian g = Gregorian(
        int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));

    Jalali g2j1 = g.toJalali();

    return toStringFormatter(g2j1);
  }

  static String currentDate () {
    String? fromDateJalali, fromDateGr;
    final year = DateTime.now().year;
    final month = DateTime.now().month;
    final day = DateTime.now().day;
    var outputDate;
    var inputFormat = DateFormat('yyyy/MM/dd');
    var inputDate = inputFormat.parse(
        (year.toString() + "/" + month.toString() + "/" + day.toString()));
    var outputFormat = DateFormat('yyyy/MM/dd');
    outputDate = outputFormat.format(inputDate);
    fromDateGr = outputDate;
    fromDateJalali = DateTimeConvertor.gregorianToJalali2(fromDateGr!);

    return fromDateJalali ;

  }

  static String gregorianToJalali2(String gregorian) {
    var parts = gregorian.split('/');

    Gregorian g = Gregorian(
        int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));

    Jalali g2j1 = g.toJalali();

    return toStringFormatter2(g2j1);
  }

  static String toStringFormatter2(Jalali d) {
    final f = d.formatter;
    return '${f.yyyy}/${f.mm}/${f.dd}';
  }

  static String toStringFormatter(Jalali d) {
    final f = d.formatter;
    return '${f.yyyy}-${f.mm}-${f.dd}';
  }

  static String gregorianformatter(Date d) {
    final f = d.formatter;
    return '${f.yyyy}-${f.mm}-${f.dd}';
  }

  static String? jalaliNowDateFormat(Jalali f) {
    return '${f.year.toString().toPersianDigit()}-${f.month.toString().toPersianDigit()}-${f.day.toString().toPersianDigit()}';
  }

  static String? jalaliNowDateAndTimeFormat(Jalali f) {
    return '${f.hour.toString().toPersianDigit()}:${f.minute.toString().toPersianDigit()}  ${f.year.toString().toPersianDigit()}-${f.month.toString().toPersianDigit()}-${f.day.toString().toPersianDigit()}';
  }
}
