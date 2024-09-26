class ApiResponse<T> {
  final int code;
  final String message;
  final T data;

  ApiResponse({required this.code, required this.message, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      code: json['code'],
      message: json['message'],
      data: json['data'],
    );
  }
}
