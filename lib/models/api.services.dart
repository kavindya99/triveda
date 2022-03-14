import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class APIService {
  static String medicineUrl = 'https://192.168.8.115:44315/api/Medicine';

  static Future fetchMedicine() async {
    return await http.get(Uri.parse(medicineUrl));
  }
}
