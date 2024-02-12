class Products {
  Products({
    required this.query,
    required this.result,
    required this.ms,
  });

  final String query;
  final Result? result;
  final num ms;

  Products copyWith({
    String? query,
    Result? result,
    num? ms,
  }) {
    return Products(
      query: query ?? this.query,
      result: result ?? this.result,
      ms: ms ?? this.ms,
    );
  }

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      query: json["query"] ?? "",
      result: json["result"] == null ? null : Result.fromJson(json["result"]),
      ms: json["ms"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "query": query,
        "result": result?.toJson(),
        "ms": ms,
      };

  @override
  String toString() {
    return "$query, $result, $ms, ";
  }
}

class Result {
  Result({
    required this.pdfs,
    required this.total,
  });

  final List<Pdf> pdfs;
  final num total;

  Result copyWith({
    List<Pdf>? pdfs,
    num? total,
  }) {
    return Result(
      pdfs: pdfs ?? this.pdfs,
      total: total ?? this.total,
    );
  }

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      pdfs: json["pdfs"] == null
          ? []
          : List<Pdf>.from(json["pdfs"]!.map((x) => Pdf.fromJson(x))),
      total: json["total"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "pdfs": pdfs.map((x) => x?.toJson()).toList(),
        "total": total,
      };

  @override
  String toString() {
    return "$pdfs, $total, ";
  }
}

class Pdf {
  Pdf({
    required this.updatedAt,
    required this.id,
    required this.file,
    required this.createdAt,
    required this.title,
    required this.mainImage,
    required this.fileUrl,
    required this.rev,
    required this.type,
    required this.slug,
  });

  final DateTime? updatedAt;
  final String id;
  final FileClass? file;
  final DateTime? createdAt;
  final String title;
  final MainImage? mainImage;
  final String fileUrl;
  final String rev;
  final String type;
  final Slug? slug;

  Pdf copyWith({
    DateTime? updatedAt,
    String? id,
    FileClass? file,
    DateTime? createdAt,
    String? title,
    MainImage? mainImage,
    String? fileUrl,
    String? rev,
    String? type,
    Slug? slug,
  }) {
    return Pdf(
      updatedAt: updatedAt ?? this.updatedAt,
      id: id ?? this.id,
      file: file ?? this.file,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      mainImage: mainImage ?? this.mainImage,
      fileUrl: fileUrl ?? this.fileUrl,
      rev: rev ?? this.rev,
      type: type ?? this.type,
      slug: slug ?? this.slug,
    );
  }

  factory Pdf.fromJson(Map<String, dynamic> json) {
    return Pdf(
      updatedAt: DateTime.tryParse(json["_updatedAt"] ?? ""),
      id: json["_id"] ?? "",
      file: json["file"] == null ? null : FileClass.fromJson(json["file"]),
      createdAt: DateTime.tryParse(json["_createdAt"] ?? ""),
      title: json["title"] ?? "",
      mainImage: json["mainImage"] == null
          ? null
          : MainImage.fromJson(json["mainImage"]),
      fileUrl: json["fileURL"] ?? "",
      rev: json["_rev"] ?? "",
      type: json["_type"] ?? "",
      slug: json["slug"] == null ? null : Slug.fromJson(json["slug"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "_updatedAt": updatedAt?.toIso8601String(),
        "_id": id,
        "file": file?.toJson(),
        "_createdAt": createdAt?.toIso8601String(),
        "title": title,
        "mainImage": mainImage?.toJson(),
        "fileURL": fileUrl,
        "_rev": rev,
        "_type": type,
        "slug": slug?.toJson(),
      };

  @override
  String toString() {
    return "$updatedAt, $id, $file, $createdAt, $title, $mainImage, $fileUrl, $rev, $type, $slug, ";
  }
}

class FileClass {
  FileClass({
    required this.type,
    required this.asset,
  });

  final String type;
  final Asset? asset;

  FileClass copyWith({
    String? type,
    Asset? asset,
  }) {
    return FileClass(
      type: type ?? this.type,
      asset: asset ?? this.asset,
    );
  }

  factory FileClass.fromJson(Map<String, dynamic> json) {
    return FileClass(
      type: json["_type"] ?? "",
      asset: json["asset"] == null ? null : Asset.fromJson(json["asset"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "_type": type,
        "asset": asset?.toJson(),
      };

  @override
  String toString() {
    return "$type, $asset, ";
  }
}

class Asset {
  Asset({
    required this.ref,
    required this.type,
  });

  final String ref;
  final String type;

  Asset copyWith({
    String? ref,
    String? type,
  }) {
    return Asset(
      ref: ref ?? this.ref,
      type: type ?? this.type,
    );
  }

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      ref: json["_ref"] ?? "",
      type: json["_type"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "_ref": ref,
        "_type": type,
      };

  @override
  String toString() {
    return "$ref, $type, ";
  }
}

class MainImage {
  MainImage({
    required this.type,
    required this.alt,
    required this.asset,
  });

  final String type;
  final String alt;
  final Asset? asset;

  MainImage copyWith({
    String? type,
    String? alt,
    Asset? asset,
  }) {
    return MainImage(
      type: type ?? this.type,
      alt: alt ?? this.alt,
      asset: asset ?? this.asset,
    );
  }

  factory MainImage.fromJson(Map<String, dynamic> json) {
    return MainImage(
      type: json["_type"] ?? "",
      alt: json["alt"] ?? "",
      asset: json["asset"] == null ? null : Asset.fromJson(json["asset"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "_type": type,
        "alt": alt,
        "asset": asset?.toJson(),
      };

  @override
  String toString() {
    return "$type, $alt, $asset, ";
  }
}

class Slug {
  Slug({
    required this.type,
    required this.current,
  });

  final String type;
  final String current;

  Slug copyWith({
    String? type,
    String? current,
  }) {
    return Slug(
      type: type ?? this.type,
      current: current ?? this.current,
    );
  }

  factory Slug.fromJson(Map<String, dynamic> json) {
    return Slug(
      type: json["_type"] ?? "",
      current: json["current"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "_type": type,
        "current": current,
      };

  @override
  String toString() {
    return "$type, $current, ";
  }
}
