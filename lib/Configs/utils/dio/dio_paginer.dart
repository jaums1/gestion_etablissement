
// Configuration pour les requêtes paginées
class PaginationConfig {
  final int page;
  final int limit;
  final String? sortBy;
  final String? sortOrder;
  final Map<String, dynamic>? filters;

  PaginationConfig({
    this.page = 1,
    this.limit = 10,
    this.sortBy,
    this.sortOrder = 'asc',
    this.filters,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'page': page,
      'limit': limit,
    };
    
    if (sortBy != null) map['sort_by'] = sortBy;
    if (sortOrder != null) map['sort_order'] = sortOrder;
    if (filters != null) map.addAll(filters!);
    
    return map;
  }
}
