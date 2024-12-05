import '../api/order_history_api.dart';
import '../response/order_history_response.dart';

class OrderHistoryRepository {
  Future<OrderHistoryResponse?> orderHistory() async {
    return OrderHistoryAPI().orderHistory();
  }
}
