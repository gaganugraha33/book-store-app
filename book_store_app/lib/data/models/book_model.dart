class BookModel {
  int? count;
  String? next;
  String? previous;
  List<Books>? results;

  BookModel({this.count, this.next, this.previous, this.results});

  BookModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <Books>[];
      json['results'].forEach((v) {
        results!.add(Books.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Books {
  int? id;
  String? title;
  List<Authors>? authors;
  List<String>? subjects;
  List<String>? bookshelves;
  List<String>? languages;
  bool? copyright;
  String? mediaType;
  // Formats? formats;
  int? downloadCount;

  Books(
      {this.id,
        this.title,
        this.authors,
        this.subjects,
        this.bookshelves,
        this.languages,
        this.copyright,
        this.mediaType,
        // this.formats,
        this.downloadCount});

  Books.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['authors'] != null) {
      authors = <Authors>[];
      json['authors'].forEach((v) {
        authors!.add( Authors.fromJson(v));
      });
    }
    subjects = json['subjects'].cast<String>();
    bookshelves = json['bookshelves'].cast<String>();
    languages = json['languages'].cast<String>();
    copyright = json['copyright'];
    mediaType = json['media_type'];
    // formats =
    // json['formats'] != null ? Formats.fromJson(json['formats']) : null;
    downloadCount = json['download_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (authors != null) {
      data['authors'] = authors!.map((v) => v.toJson()).toList();
    }
    data['subjects'] = subjects;
    data['bookshelves'] = bookshelves;
    data['languages'] = languages;
    data['copyright'] = copyright;
    data['media_type'] =mediaType;
    // if (formats != null) {
    //   data['formats'] = formats!.toJson();
    // }
    data['download_count'] = downloadCount;
    return data;
  }
}


class Authors {
  String? name;
  int? birthYear;
  int? deathYear;

  Authors({this.name, this.birthYear, this.deathYear});

  Authors.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    birthYear = json['birth_year'];
    deathYear = json['death_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['birth_year'] = birthYear;
    data['death_year'] = deathYear;
    return data;
  }
}

class Formats {
  String? textHtml;
  String? applicationEpubZip;
  String? applicationXMobipocketEbook;
  String? applicationRdfXml;
  String? imageJpeg;
  String? textPlainCharsetUsAscii;
  String? applicationOctetStream;
  String? textHtmlCharsetUtf8;
  String? textPlainCharsetUtf8;
  String? textPlainCharsetIso88591;
  String? textHtmlCharsetIso88591;

  Formats(
      {this.textHtml,
        this.applicationEpubZip,
        this.applicationXMobipocketEbook,
        this.applicationRdfXml,
        this.imageJpeg,
        this.textPlainCharsetUsAscii,
        this.applicationOctetStream,
        this.textHtmlCharsetUtf8,
        this.textPlainCharsetUtf8,
        this.textPlainCharsetIso88591,
        this.textHtmlCharsetIso88591});

  Formats.fromJson(Map<String, dynamic> json) {
    textHtml = json['text/html'];
    applicationEpubZip = json['application/epub+zip'];
    applicationXMobipocketEbook = json['application/x-mobipocket-ebook'];
    applicationRdfXml = json['application/rdf+xml'];
    imageJpeg = json['image/jpeg'];
    textPlainCharsetUsAscii = json['text/plain; charset=us-ascii'];
    applicationOctetStream = json['application/octet-stream'];
    textHtmlCharsetUtf8 = json['text/html; charset=utf-8'];
    textPlainCharsetUtf8 = json['text/plain; charset=utf-8'];
    textPlainCharsetIso88591 = json['text/plain; charset=iso-8859-1'];
    textHtmlCharsetIso88591 = json['text/html; charset=iso-8859-1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text/html'] = textHtml;
    data['application/epub+zip'] = applicationEpubZip;
    data['application/x-mobipocket-ebook'] = applicationXMobipocketEbook;
    data['application/rdf+xml'] = applicationRdfXml;
    data['image/jpeg'] = imageJpeg;
    data['text/plain; charset=us-ascii'] = textPlainCharsetUsAscii;
    data['application/octet-stream'] = applicationOctetStream;
    data['text/html; charset=utf-8'] = textHtmlCharsetUtf8;
    data['text/plain; charset=utf-8'] = textPlainCharsetUtf8;
    data['text/plain; charset=iso-8859-1'] = textPlainCharsetIso88591;
    data['text/html; charset=iso-8859-1'] = textHtmlCharsetIso88591;
    return data;
  }
}