String getOrderStatus(String? statusCode) {
  switch (statusCode) {
    case "1":
      return "Placed an Order";
    case "2":
      return "Confirmed By Seller";
    case "3":
      return "Parcel Received by Admin";
    case "4":
      return "Delivered";
    case "5":
      return "Received by Buyer";

    default:
      return "Unknown";
  }
}

String getProductStatus(String? statusCode) {
  switch (statusCode) {
    case "1":
      return "In Stock";
    case "2":
      return "Sold Out";

    default:
      return "Unknown";
  }
}
