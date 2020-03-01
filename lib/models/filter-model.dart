enum OrderBy { DATE, PRICE }
const VENDOR_TYPE_SALON = 1 << 0; //001
const VENDOR_TYPE_PRIVATE = 1 << 1; //0010

class Filter {
  Filter({
    this.search,
    this.orderBy,
    this.minPrice,
    this.maxPrice,
    this.vendorType = VENDOR_TYPE_SALON | VENDOR_TYPE_PRIVATE,
  });

  String search;
  OrderBy orderBy;
  int minPrice;
  int maxPrice;
  int vendorType;
}
