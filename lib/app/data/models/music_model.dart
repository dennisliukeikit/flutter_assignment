class MusicModel {
  int? resultCount;
  List<MusicResults>? results;

  MusicModel({this.resultCount, this.results});

  MusicModel.fromJson(Map<String, dynamic> json) {
    resultCount = json['resultCount'];
    if (json['results'] != null) {
      results = <MusicResults>[];
      json['results'].forEach((v) {
        results?.add(MusicResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['resultCount'] = resultCount;
    if (results != null) {
      data['results'] = results?.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static MusicModel empty = MusicModel();

  bool get isEmpty => this == MusicModel.empty;

  bool get isNotEmpty => this != MusicModel.empty;
}

class MusicResults {
  String? wrapperType;
  String? kind;
  int? artistId;
  int? collectionId;
  int? trackId;
  String? artistName;
  String? collectionName;
  String? trackName;
  String? collectionCensoredName;
  String? trackCensoredName;
  String? artistViewUrl;
  String? collectionViewUrl;
  String? trackViewUrl;
  String? previewUrl;
  String? artworkUrl30;
  String? artworkUrl60;
  String? artworkUrl100;
  double? collectionPrice;
  double? trackPrice;
  String? releaseDate;
  String? collectionExplicitness;
  String? trackExplicitness;
  int? discCount;
  int? discNumber;
  int? trackCount;
  int? trackNumber;
  int? trackTimeMillis;
  String? country;
  String? currency;
  String? primaryGenreName;
  bool? isStreamable;
  int? collectionArtistId;
  String? collectionArtistViewUrl;
  double? trackRentalPrice;
  double? collectionHdPrice;
  double? trackHdPrice;
  double? trackHdRentalPrice;
  String? contentAdvisoryRating;
  String? shortDescription;
  String? longDescription;
  bool? hasITunesExtras;

  MusicResults(
      {this.wrapperType,
      this.kind,
      this.artistId,
      this.collectionId,
      this.trackId,
      this.artistName,
      this.collectionName,
      this.trackName,
      this.collectionCensoredName,
      this.trackCensoredName,
      this.artistViewUrl,
      this.collectionViewUrl,
      this.trackViewUrl,
      this.previewUrl,
      this.artworkUrl30,
      this.artworkUrl60,
      this.artworkUrl100,
      this.collectionPrice,
      this.trackPrice,
      this.releaseDate,
      this.collectionExplicitness,
      this.trackExplicitness,
      this.discCount,
      this.discNumber,
      this.trackCount,
      this.trackNumber,
      this.trackTimeMillis,
      this.country,
      this.currency,
      this.primaryGenreName,
      this.isStreamable,
      this.collectionArtistId,
      this.collectionArtistViewUrl,
      this.trackRentalPrice,
      this.collectionHdPrice,
      this.trackHdPrice,
      this.trackHdRentalPrice,
      this.contentAdvisoryRating,
      this.shortDescription,
      this.longDescription,
      this.hasITunesExtras});

  MusicResults.fromJson(Map<String, dynamic> json) {
    wrapperType = json['wrapperType'];
    kind = json['kind'];
    artistId = json['artistId'];
    collectionId = json['collectionId'];
    trackId = json['trackId'];
    artistName = json['artistName'];
    collectionName = json['collectionName'];
    trackName = json['trackName'];
    collectionCensoredName = json['collectionCensoredName'];
    trackCensoredName = json['trackCensoredName'];
    artistViewUrl = json['artistViewUrl'];
    collectionViewUrl = json['collectionViewUrl'];
    trackViewUrl = json['trackViewUrl'];
    previewUrl = json['previewUrl'];
    artworkUrl30 = json['artworkUrl30'];
    artworkUrl60 = json['artworkUrl60'];
    artworkUrl100 = json['artworkUrl100'];
    collectionPrice = json['collectionPrice'];
    trackPrice = json['trackPrice'];
    releaseDate = json['releaseDate'];
    collectionExplicitness = json['collectionExplicitness'];
    trackExplicitness = json['trackExplicitness'];
    discCount = json['discCount'];
    discNumber = json['discNumber'];
    trackCount = json['trackCount'];
    trackNumber = json['trackNumber'];
    trackTimeMillis = json['trackTimeMillis'];
    country = json['country'];
    currency = json['currency'];
    primaryGenreName = json['primaryGenreName'];
    isStreamable = json['isStreamable'];
    collectionArtistId = json['collectionArtistId'];
    collectionArtistViewUrl = json['collectionArtistViewUrl'];
    trackRentalPrice = json['trackRentalPrice'];
    collectionHdPrice = json['collectionHdPrice'];
    trackHdPrice = json['trackHdPrice'];
    trackHdRentalPrice = json['trackHdRentalPrice'];
    contentAdvisoryRating = json['contentAdvisoryRating'];
    shortDescription = json['shortDescription'];
    longDescription = json['longDescription'];
    hasITunesExtras = json['hasITunesExtras'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['wrapperType'] = wrapperType;
    data['kind'] = kind;
    data['artistId'] = artistId;
    data['collectionId'] = collectionId;
    data['trackId'] = trackId;
    data['artistName'] = artistName;
    data['collectionName'] = collectionName;
    data['trackName'] = trackName;
    data['collectionCensoredName'] = collectionCensoredName;
    data['trackCensoredName'] = trackCensoredName;
    data['artistViewUrl'] = artistViewUrl;
    data['collectionViewUrl'] = collectionViewUrl;
    data['trackViewUrl'] = trackViewUrl;
    data['previewUrl'] = previewUrl;
    data['artworkUrl30'] = artworkUrl30;
    data['artworkUrl60'] = artworkUrl60;
    data['artworkUrl100'] = artworkUrl100;
    data['collectionPrice'] = collectionPrice;
    data['trackPrice'] = trackPrice;
    data['releaseDate'] = releaseDate;
    data['collectionExplicitness'] = collectionExplicitness;
    data['trackExplicitness'] = trackExplicitness;
    data['discCount'] = discCount;
    data['discNumber'] = discNumber;
    data['trackCount'] = trackCount;
    data['trackNumber'] = trackNumber;
    data['trackTimeMillis'] = trackTimeMillis;
    data['country'] = country;
    data['currency'] = currency;
    data['primaryGenreName'] = primaryGenreName;
    data['isStreamable'] = isStreamable;
    data['collectionArtistId'] = collectionArtistId;
    data['collectionArtistViewUrl'] = collectionArtistViewUrl;
    data['trackRentalPrice'] = trackRentalPrice;
    data['collectionHdPrice'] = collectionHdPrice;
    data['trackHdPrice'] = trackHdPrice;
    data['trackHdRentalPrice'] = trackHdRentalPrice;
    data['contentAdvisoryRating'] = contentAdvisoryRating;
    data['shortDescription'] = shortDescription;
    data['longDescription'] = longDescription;
    data['hasITunesExtras'] = hasITunesExtras;
    return data;
  }
}
