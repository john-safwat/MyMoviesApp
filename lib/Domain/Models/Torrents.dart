class Torrents {
  Torrents({
      this.url, 
      this.hash, 
      this.quality, 
      this.type, 
      this.seeds, 
      this.peers, 
      this.size, 
      this.sizeBytes, 
      this.dateUploaded, 
      this.dateUploadedUnix,});

  String? url;
  String? hash;
  String? quality;
  String? type;
  num? seeds;
  num? peers;
  String? size;
  num? sizeBytes;
  String? dateUploaded;
  num? dateUploadedUnix;


}