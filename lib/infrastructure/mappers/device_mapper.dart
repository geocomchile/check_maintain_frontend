import 'package:check_maintain_frontend/domain/entities/device.dart';

class DeviceMapper {
    final int id;
    final String modelName;
    final String modelTypeDevice;
    final int modelId;
    final String serialNumber;
    final bool active;
    final DateTime created;
    final DateTime updated;

    DeviceMapper({
        required this.id,
        required this.modelName,
        required this.modelTypeDevice,
        required this.modelId,
        required this.serialNumber,
        required this.active,
        required this.created,
        required this.updated,
    });

    static Device deviceJsonToEntity(Map<String, dynamic> json) => Device(
        id: json["id"],
        modelName: json["model_name"],
        modelTypeDevice: json["model_type_device"],
        modelId: json["model_id"],
        serialNumber: json["serial_number"],
        active: json["active"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
    );


}