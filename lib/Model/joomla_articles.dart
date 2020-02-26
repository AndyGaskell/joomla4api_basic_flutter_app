// To parse this JSON data, do
//
//     final joomlaArticles = joomlaArticlesFromJson(jsonString);

import 'dart:convert';

JoomlaArticles joomlaArticlesFromJson(String str) => JoomlaArticles.fromJson(json.decode(str));

String joomlaArticlesToJson(JoomlaArticles data) => json.encode(data.toJson());

class JoomlaArticles {
    Links links;
    List<Adata> data;
    Meta meta;

    JoomlaArticles({
        this.links,
        this.data,
        this.meta,
    });

    factory JoomlaArticles.fromJson(Map<String, dynamic> json) => JoomlaArticles(
        links: Links.fromJson(json["links"]),
        data: List<Adata>.from(json["data"].map((x) => Adata.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "links": links.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
    };
}

class Adata {
    Type type;
    String id;
    Attributes attributes;

    Adata({
        this.type,
        this.id,
        this.attributes,
    });

    factory Adata.fromJson(Map<String, dynamic> json) => Adata(
        type: typeValues.map[json["type"]],
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class Attributes {
    int id;
    int assetId;
    String title;
    int state;
    DateTime created;
    Language language;
    TypeAlias typeAlias;
    String text;
    List<dynamic> tags;
    String lat;
    String lon;

    Attributes({
        this.id,
        this.assetId,
        this.title,
        this.state,
        this.created,
        this.language,
        this.typeAlias,
        this.text,
        this.tags,
        this.lat,
        this.lon,
    });

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        id: json["id"],
        assetId: json["asset_id"],
        title: json["title"],
        state: json["state"],
        created: DateTime.parse(json["created"]),
        language: languageValues.map[json["language"]],
        typeAlias: typeAliasValues.map[json["typeAlias"]],
        text: json["text"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        lat: json["lat"] == null ? null : json["lat"],
        lon: json["lon"] == null ? null : json["lon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "asset_id": assetId,
        "title": title,
        "state": state,
        "created": created.toIso8601String(),
        "language": languageValues.reverse[language],
        "typeAlias": typeAliasValues.reverse[typeAlias],
        "text": text,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "lat": lat == null ? null : lat,
        "lon": lon == null ? null : lon,
    };
}

enum Language { EMPTY }

final languageValues = EnumValues({
    "*": Language.EMPTY
});

enum TypeAlias { COM_CONTENT_ARTICLE }

final typeAliasValues = EnumValues({
    "com_content.article": TypeAlias.COM_CONTENT_ARTICLE
});

enum Type { ARTICLES }

final typeValues = EnumValues({
    "articles": Type.ARTICLES
});

class Links {
    String self;
    String first;
    String next;
    String previous;
    String last;

    Links({
        this.self,
        this.first,
        this.next,
        this.previous,
        this.last,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"],
        first: json["first"],
        next: json["next"],
        previous: json["previous"],
        last: json["last"],
    );

    Map<String, dynamic> toJson() => {
        "self": self,
        "first": first,
        "next": next,
        "previous": previous,
        "last": last,
    };
}

class Meta {
    int totalPages;

    Meta({
        this.totalPages,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        totalPages: json["total-pages"],
    );

    Map<String, dynamic> toJson() => {
        "total-pages": totalPages,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
