/// 插件列表排序VO对象
class PluginMenuSortVO {
  PluginMenuSortVO(this.id, this.name, this.asc, this.selected, this.sortFun);

  final int id;

  /// 排序方式名称
  final String name;

  /// 排序方式 true:正序 false:倒序
  bool asc;

  /// 筛选方式是否被选中
  bool selected;

  /// 筛选执行的函数
  final Function sortFun;
}
