class Photo{
  final int RoomId;
  final String PhotoUrl;
  
  Photo({
    required this.RoomId,
    required this.PhotoUrl,
});
  
  factory Photo.fromJson(Map<String ,dynamic> json){
    return Photo(RoomId: json['roomid'], PhotoUrl: json['photo1']);
  }
}