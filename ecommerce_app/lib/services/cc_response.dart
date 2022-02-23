class CCResponse<T>{
  Status status = Status.FRESH;
  String? message;
  T? data;

   CCResponse.loading(this.message) : status = Status.LOADING;
   CCResponse.completed(this.data) : status = Status.COMPLETED;
   CCResponse.fresh(this.message) : status = Status.FRESH;
   CCResponse.error(this.message) : status = Status.ERROR;

}

enum Status{
  LOADING,
  COMPLETED,
  FRESH,
  ERROR,
}