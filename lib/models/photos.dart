class Photo{
  final int RoomId;
  final int? PhotoId;
  final String PhotoUrl;
  
  Photo({
    this.PhotoId,
    required this.RoomId,
    required this.PhotoUrl,
});
  
  factory Photo.fromJson(Map<String ,dynamic> json){
    return Photo(RoomId: json['roomid'], PhotoUrl: json['photo1'], PhotoId: json['photoid']);
  }
}