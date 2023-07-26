typedef JsonMapper<T> = T Function(Map<String, dynamic> json);
typedef StringMapper<T> = T Function(String json);
typedef ListMapper<T> = T Function(List<dynamic> json);