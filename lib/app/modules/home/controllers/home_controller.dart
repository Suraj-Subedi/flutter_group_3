import 'package:ecom_3/app/models/specalization.dart';
import 'package:ecom_3/app/utils/constants.dart';
import 'package:ecom_3/app/utils/memory.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  SpecializationResponse? specializationResponse;

  @override
  void onInit() {
    super.onInit();
    getSpecializations();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getSpecializations() async {
    try {
      var url = Uri.http(ipAddress, 'doctor_api/getSpecialization');

      var response = await http.post(url, body: {"token": Memory.getToken()});
      specializationResponse = specializationResponseFromJson(response.body);
      update();

      if (specializationResponse?.success ?? false) {
        // showCustomSnackBar(
        //   message: specializationResponse?.message ?? '',
        //   isSuccess: true,
        // );
      } else {
        showCustomSnackBar(
          message: specializationResponse?.message ?? '',
        );
      }
    } catch (e) {
      print(e);
      showCustomSnackBar(
        message: 'Something went wrong',
      );
    }
  }
}
