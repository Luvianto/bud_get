class DataResponse<T> {
  final bool status;
  int? statusCode;
  final String message;
  final List<ErrorField>? errors;
  final T? data;
  final Pagination? pagination;

  DataResponse({
    required this.status,
    this.statusCode,
    required this.message,
    this.errors,
    this.data,
    this.pagination,
  });

  factory DataResponse.fromJson(Map<String, dynamic> json) {
    return DataResponse(
      status: json['status'],
      statusCode: json['status_code'],
      message: json['message'],
      errors: (json['errors'] as List?)
          ?.map((e) => ErrorField.fromJson(e))
          .toList(),
      data: json['data'],
      pagination: json['pagination'] != null
          ? Pagination.fromJson(json['pagination'])
          : null,
    );
  }

  static String getErrorMessage(dynamic error) {
    return error is DataResponse ? error.message : 'Unknown error occurred';
  }
}

class ErrorField {
  final String field;
  final String message;

  ErrorField._(this.field, this.message);

  factory ErrorField.fromJson(Map<String, dynamic> json) {
    return ErrorField._(json['field'], json['message']);
  }
}

class Pagination {
  final int? page;
  final int? limit;
  final int? totalItems;
  final int? totalPages;

  Pagination({this.page, this.limit, this.totalItems, this.totalPages});

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      page: json['page'],
      limit: json['limit'],
      totalItems: json['total_items'],
      totalPages: json['total_pages'],
    );
  }
}
