import 'package:class_f_story/_core/utils/my_http.dart';
import 'package:dio/dio.dart';

class PostRepository {
  const PostRepository();

  //조회
  Future<Map<String, dynamic>> findAll({int page = 0}) async {
    Response response =
        await dio.get('/api/post', queryParameters: {'page': page});

    // Http 전체 응답메세지에서 바디만 추출 -> 뷰모델로 리턴
    // Map 구조 다운 캐스팅 뷰모델로 리턴
    Map<String, dynamic> responseBody = response.data;
    return responseBody;
  }

  // 게시글 상세 조회
  // findById
  Future<Map<String, dynamic>> findById({required int id}) async {
    Response response = await dio.get('/api/post/$id');

    Map<String, dynamic> responseBody = response.data;
    return responseBody;
  }

  // 게시글 삭제
  // delete
  Future<Map<String, dynamic>> delete({required int id}) async {
    Response response = await dio.delete('/api/post/$id');

    Map<String, dynamic> responseBody = response.data;
    return responseBody;
  }

  // 게시글 생성
  // save
  Future<Map<String, dynamic>> save(Map<String, dynamic> data) async {
    Response response = await dio.post('/api/post', data: data);

    Map<String, dynamic> responseBody = response.data;
    return responseBody;
  }

  // 게시글 수정
  // update
  Future<Map<String, dynamic>> update(
      {required int id, required Map<String, dynamic> data}) async {
    Response response = await dio.put('/api/post/$id', data: data);

    Map<String, dynamic> responseBody = response.data;
    return responseBody;
  }
}
