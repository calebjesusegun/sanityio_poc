class BlogPost {
  BlogPost({
    required this.query,
    required this.result,
    required this.ms,
  });

  final String query;
  final Result? result;
  final num ms;

  BlogPost copyWith({
    String? query,
    Result? result,
    num? ms,
  }) {
    return BlogPost(
      query: query ?? this.query,
      result: result ?? this.result,
      ms: ms ?? this.ms,
    );
  }

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
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
    required this.posts,
    required this.total,
  });

  final List<Post> posts;
  final num total;

  Result copyWith({
    List<Post>? posts,
    num? total,
  }) {
    return Result(
      posts: posts ?? this.posts,
      total: total ?? this.total,
    );
  }

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      posts: json["posts"] == null
          ? []
          : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
      total: json["total"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "posts": posts.map((x) => x?.toJson()).toList(),
        "total": total,
      };

  @override
  String toString() {
    return "$posts, $total, ";
  }
}

class Post {
  Post({
    required this.slug,
    required this.type,
    required this.createdAt,
    required this.categories,
    required this.rev,
    required this.description,
    required this.body,
    required this.title,
    required this.publishedAt,
    required this.author,
    required this.mainImage,
    required this.id,
    required this.updatedAt,
  });

  final Slug? slug;
  final String type;
  final DateTime? createdAt;
  final List<Category> categories;
  final String rev;
  final String description;
  final List<Body> body;
  final String title;
  final DateTime? publishedAt;
  final Author? author;
  final Image? mainImage;
  final String id;
  final DateTime? updatedAt;

  Post copyWith({
    Slug? slug,
    String? type,
    DateTime? createdAt,
    List<Category>? categories,
    String? rev,
    String? description,
    List<Body>? body,
    String? title,
    DateTime? publishedAt,
    Author? author,
    Image? mainImage,
    String? id,
    DateTime? updatedAt,
  }) {
    return Post(
      slug: slug ?? this.slug,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      categories: categories ?? this.categories,
      rev: rev ?? this.rev,
      description: description ?? this.description,
      body: body ?? this.body,
      title: title ?? this.title,
      publishedAt: publishedAt ?? this.publishedAt,
      author: author ?? this.author,
      mainImage: mainImage ?? this.mainImage,
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      slug: json["slug"] == null ? null : Slug.fromJson(json["slug"]),
      type: json["_type"] ?? "",
      createdAt: DateTime.tryParse(json["_createdAt"] ?? ""),
      categories: json["categories"] == null
          ? []
          : List<Category>.from(
              json["categories"]!.map((x) => Category.fromJson(x))),
      rev: json["_rev"] ?? "",
      description: json["description"] ?? "",
      body: json["body"] == null
          ? []
          : List<Body>.from(json["body"]!.map((x) => Body.fromJson(x))),
      title: json["title"] ?? "",
      publishedAt: DateTime.tryParse(json["publishedAt"] ?? ""),
      author: json["author"] == null ? null : Author.fromJson(json["author"]),
      mainImage:
          json["mainImage"] == null ? null : Image.fromJson(json["mainImage"]),
      id: json["_id"] ?? "",
      updatedAt: DateTime.tryParse(json["_updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "slug": slug?.toJson(),
        "_type": type,
        "_createdAt": createdAt?.toIso8601String(),
        "categories": categories.map((x) => x?.toJson()).toList(),
        "_rev": rev,
        "description": description,
        "body": body.map((x) => x?.toJson()).toList(),
        "title": title,
        "publishedAt": publishedAt?.toIso8601String(),
        "author": author?.toJson(),
        "mainImage": mainImage?.toJson(),
        "_id": id,
        "_updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return "$slug, $type, $createdAt, $categories, $rev, $description, $body, $title, $publishedAt, $author, $mainImage, $id, $updatedAt, ";
  }
}

class Author {
  Author({
    required this.slug,
    required this.createdAt,
    required this.rev,
    required this.type,
    required this.name,
    required this.image,
    required this.bio,
    required this.id,
    required this.updatedAt,
  });

  final Slug? slug;
  final DateTime? createdAt;
  final String rev;
  final String type;
  final String name;
  final Image? image;
  final List<Bio> bio;
  final String id;
  final DateTime? updatedAt;

  Author copyWith({
    Slug? slug,
    DateTime? createdAt,
    String? rev,
    String? type,
    String? name,
    Image? image,
    List<Bio>? bio,
    String? id,
    DateTime? updatedAt,
  }) {
    return Author(
      slug: slug ?? this.slug,
      createdAt: createdAt ?? this.createdAt,
      rev: rev ?? this.rev,
      type: type ?? this.type,
      name: name ?? this.name,
      image: image ?? this.image,
      bio: bio ?? this.bio,
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      slug: json["slug"] == null ? null : Slug.fromJson(json["slug"]),
      createdAt: DateTime.tryParse(json["_createdAt"] ?? ""),
      rev: json["_rev"] ?? "",
      type: json["_type"] ?? "",
      name: json["name"] ?? "",
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      bio: json["bio"] == null
          ? []
          : List<Bio>.from(json["bio"]!.map((x) => Bio.fromJson(x))),
      id: json["_id"] ?? "",
      updatedAt: DateTime.tryParse(json["_updatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "slug": slug?.toJson(),
        "_createdAt": createdAt?.toIso8601String(),
        "_rev": rev,
        "_type": type,
        "name": name,
        "image": image?.toJson(),
        "bio": bio.map((x) => x?.toJson()).toList(),
        "_id": id,
        "_updatedAt": updatedAt?.toIso8601String(),
      };

  @override
  String toString() {
    return "$slug, $createdAt, $rev, $type, $name, $image, $bio, $id, $updatedAt, ";
  }
}

class Bio {
  Bio({
    required this.markDefs,
    required this.children,
    required this.type,
    required this.style,
    required this.key,
  });

  final List<dynamic> markDefs;
  final List<Child> children;
  final String type;
  final String style;
  final String key;

  Bio copyWith({
    List<dynamic>? markDefs,
    List<Child>? children,
    String? type,
    String? style,
    String? key,
  }) {
    return Bio(
      markDefs: markDefs ?? this.markDefs,
      children: children ?? this.children,
      type: type ?? this.type,
      style: style ?? this.style,
      key: key ?? this.key,
    );
  }

  factory Bio.fromJson(Map<String, dynamic> json) {
    return Bio(
      markDefs: json["markDefs"] == null
          ? []
          : List<dynamic>.from(json["markDefs"]!.map((x) => x)),
      children: json["children"] == null
          ? []
          : List<Child>.from(json["children"]!.map((x) => Child.fromJson(x))),
      type: json["_type"] ?? "",
      style: json["style"] ?? "",
      key: json["_key"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "markDefs": markDefs.map((x) => x).toList(),
        "children": children.map((x) => x?.toJson()).toList(),
        "_type": type,
        "style": style,
        "_key": key,
      };

  @override
  String toString() {
    return "$markDefs, $children, $type, $style, $key, ";
  }
}

class Child {
  Child({
    required this.type,
    required this.marks,
    required this.text,
    required this.key,
  });

  final String type;
  final List<String> marks;
  final String text;
  final String key;

  Child copyWith({
    String? type,
    List<String>? marks,
    String? text,
    String? key,
  }) {
    return Child(
      type: type ?? this.type,
      marks: marks ?? this.marks,
      text: text ?? this.text,
      key: key ?? this.key,
    );
  }

  factory Child.fromJson(Map<String, dynamic> json) {
    return Child(
      type: json["_type"] ?? "",
      marks: json["marks"] == null
          ? []
          : List<String>.from(json["marks"]!.map((x) => x)),
      text: json["text"] ?? "",
      key: json["_key"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "_type": type,
        "marks": marks.map((x) => x).toList(),
        "text": text,
        "_key": key,
      };

  @override
  String toString() {
    return "$type, $marks, $text, $key, ";
  }
}

class Image {
  Image({
    required this.asset,
    required this.type,
    required this.alt,
  });

  final Asset? asset;
  final String type;
  final String alt;

  Image copyWith({
    Asset? asset,
    String? type,
    String? alt,
  }) {
    return Image(
      asset: asset ?? this.asset,
      type: type ?? this.type,
      alt: alt ?? this.alt,
    );
  }

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      asset: json["asset"] == null ? null : Asset.fromJson(json["asset"]),
      type: json["_type"] ?? "",
      alt: json["alt"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "asset": asset?.toJson(),
        "_type": type,
        "alt": alt,
      };

  @override
  String toString() {
    return "$asset, $type, $alt, ";
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

class Slug {
  Slug({
    required this.current,
    required this.type,
  });

  final String current;
  final String type;

  Slug copyWith({
    String? current,
    String? type,
  }) {
    return Slug(
      current: current ?? this.current,
      type: type ?? this.type,
    );
  }

  factory Slug.fromJson(Map<String, dynamic> json) {
    return Slug(
      current: json["current"] ?? "",
      type: json["_type"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "current": current,
        "_type": type,
      };

  @override
  String toString() {
    return "$current, $type, ";
  }
}

class Body {
  Body({
    required this.children,
    required this.type,
    required this.style,
    required this.key,
    required this.markDefs,
    required this.listItem,
    required this.level,
  });

  final List<Child> children;
  final String type;
  final String style;
  final String key;
  final List<MarkDef> markDefs;
  final String listItem;
  final num level;

  Body copyWith({
    List<Child>? children,
    String? type,
    String? style,
    String? key,
    List<MarkDef>? markDefs,
    String? listItem,
    num? level,
  }) {
    return Body(
      children: children ?? this.children,
      type: type ?? this.type,
      style: style ?? this.style,
      key: key ?? this.key,
      markDefs: markDefs ?? this.markDefs,
      listItem: listItem ?? this.listItem,
      level: level ?? this.level,
    );
  }

  factory Body.fromJson(Map<String, dynamic> json) {
    return Body(
      children: json["children"] == null
          ? []
          : List<Child>.from(json["children"]!.map((x) => Child.fromJson(x))),
      type: json["_type"] ?? "",
      style: json["style"] ?? "",
      key: json["_key"] ?? "",
      markDefs: json["markDefs"] == null
          ? []
          : List<MarkDef>.from(
              json["markDefs"]!.map((x) => MarkDef.fromJson(x))),
      listItem: json["listItem"] ?? "",
      level: json["level"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "children": children.map((x) => x?.toJson()).toList(),
        "_type": type,
        "style": style,
        "_key": key,
        "markDefs": markDefs.map((x) => x?.toJson()).toList(),
        "listItem": listItem,
        "level": level,
      };

  @override
  String toString() {
    return "$children, $type, $style, $key, $markDefs, $listItem, $level, ";
  }
}

class MarkDef {
  MarkDef({
    required this.type,
    required this.href,
    required this.key,
  });

  final String type;
  final String href;
  final String key;

  MarkDef copyWith({
    String? type,
    String? href,
    String? key,
  }) {
    return MarkDef(
      type: type ?? this.type,
      href: href ?? this.href,
      key: key ?? this.key,
    );
  }

  factory MarkDef.fromJson(Map<String, dynamic> json) {
    return MarkDef(
      type: json["_type"] ?? "",
      href: json["href"] ?? "",
      key: json["_key"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "_type": type,
        "href": href,
        "_key": key,
      };

  @override
  String toString() {
    return "$type, $href, $key, ";
  }
}

class Category {
  Category({
    required this.description,
    required this.id,
    required this.title,
    required this.updatedAt,
    required this.createdAt,
    required this.rev,
    required this.type,
  });

  final String description;
  final String id;
  final String title;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final String rev;
  final String type;

  Category copyWith({
    String? description,
    String? id,
    String? title,
    DateTime? updatedAt,
    DateTime? createdAt,
    String? rev,
    String? type,
  }) {
    return Category(
      description: description ?? this.description,
      id: id ?? this.id,
      title: title ?? this.title,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      rev: rev ?? this.rev,
      type: type ?? this.type,
    );
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      description: json["description"] ?? "",
      id: json["_id"] ?? "",
      title: json["title"] ?? "",
      updatedAt: DateTime.tryParse(json["_updatedAt"] ?? ""),
      createdAt: DateTime.tryParse(json["_createdAt"] ?? ""),
      rev: json["_rev"] ?? "",
      type: json["_type"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "description": description,
        "_id": id,
        "title": title,
        "_updatedAt": updatedAt?.toIso8601String(),
        "_createdAt": createdAt?.toIso8601String(),
        "_rev": rev,
        "_type": type,
      };

  @override
  String toString() {
    return "$description, $id, $title, $updatedAt, $createdAt, $rev, $type, ";
  }
}
