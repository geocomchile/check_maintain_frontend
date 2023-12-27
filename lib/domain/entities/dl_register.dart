

class DlRegister {
    final int id;
    final String image;
    final double collimationError;
    final DateTime dateError;
    final String dataFile;
    final DateTime created;
    final DateTime updated;
    final int deviceId;

    DlRegister({
        required this.id,
        required this.image,
        required this.collimationError,
        required this.dateError,
        required this.dataFile,
        required this.created,
        required this.updated,
        required this.deviceId,
    });

    factory DlRegister.fromJson(Map<String, dynamic> json) => DlRegister(
        id: json["id"],
        image: json["image"],
        collimationError: json["collimation_error"]?.toDouble(),
        dateError: DateTime.parse(json["date_error"]),
        dataFile: json["data_file"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
        deviceId: json["device"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "collimation_error": collimationError,
        "date_error": dateError.toIso8601String(),
        "data_file": dataFile,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
        "device": deviceId,
    };
}
