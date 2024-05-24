import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:smarthome/data/model/security/security_model.dart';
import 'package:smarthome/data/repositories/security_repository.dart';

class SecurityController extends GetxController{
    final SecurityRepository _securityRepository = GetIt.I.get<SecurityRepository>();

    RxList<SecurityModel> securityModel = <SecurityModel>[].obs;
    RxList<Data> dataModel = <Data>[].obs;

    Future<void> getAllDeviceSecurity() async{
      await _securityRepository.getSecurity(
          onSuccess: (data){
            securityModel.assignAll([data]);
          }, onError: (_){}
      );
    }

    @override
  void onInit() {
    getAllDeviceSecurity();
    super.onInit();
  }
}