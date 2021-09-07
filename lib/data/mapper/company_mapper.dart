import 'package:movie_app/data/api/model/api_company.dart';
import 'package:movie_app/domain/model/company.dart';

mixin CompanyMapper {
  static CompanyListElement fromApi(ApiCompanyListElement companyListElement) {
    return CompanyListElement(
        id: companyListElement.id, name: companyListElement.name);
  }

  static List<CompanyListElement> fromApiList(
      List<ApiCompanyListElement> companyListElement) {
    return companyListElement.map((movie) => fromApi(movie)).toList();
  }
}
