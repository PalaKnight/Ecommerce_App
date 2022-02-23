
class CreatedUser{
  String id;
  String errorMessage;
  bool success;
  CreatedUser({
    required this.id,
    required this.errorMessage,
    required this.success,
});

  factory CreatedUser.fromJson(Map<String, dynamic> json){
    return CreatedUser(
        id: json['mongoEntity']['id'],
        errorMessage: json['errorMessage'],
        success: json['success']
    );
  }
}