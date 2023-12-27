

import 'package:check_maintain_frontend/domain/entities/dl_register.dart';

class DlRegisterMapper {
    final int id;
    final String image;
    final double collimationError;
    final DateTime dateError;
    final String dataFile;
    final DateTime created;
    final DateTime updated;
    final int deviceId;

    DlRegisterMapper({
        required this.id,
        required this.image,
        required this.collimationError,
        required this.dateError,
        required this.dataFile,
        required this.created,
        required this.updated,
        required this.deviceId,
    });

    static DlRegister dlRegisterJsonToEntity(Map<String, dynamic> json) => DlRegister(
        id: json["id"],
        image: json["image"],
        collimationError: json["collimation_error"]?.toDouble(),
        dateError: DateTime.parse(json["date_error"]),
        dataFile: json["data_file"] ?? "",
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        deviceId: json["device"],
    );


}