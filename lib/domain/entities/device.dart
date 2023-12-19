class Device {
  final int id;
  final String modelName;
  final String modelTypeDevice;
  final String serialNumber;
  final bool active;
  final int modelId;
  final DateTime created;
  final DateTime updated;

  Device({
    required this.id,
    required this.modelName,
    required this.modelTypeDevice,
    required this.modelId,
    required this.serialNumber,
    required this.active,
    required this.created,
    required this.updated,
  });

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        id: json["id"],
        modelName: json["model_name"],
        modelTypeDevice: json["model_type_device"],
        modelId: json["model_id"],
        serialNumber: json["serial_number"],
        active: json["active"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "model_name": modelName,
        "model_type_device": modelTypeDevice,
        "serial_number": serialNumber,
        "model_id": modelId,
        "active": active,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
      };
}
