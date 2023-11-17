import { MenuListItem } from './beans/MenuListItem';
import { AIOTRepository } from './common/http/repository/AIOTRepository';
import { ViewModel } from './ViewModel';

class HomeViewModel extends ViewModel {
  classification = [
    { title: "肉禽", code: "SCREEN_1001" },
    { title: "蔬菜", code: "SCREEN_1003" },
    { title: "水产", code: "SCREEN_1002" },
    { title: "五谷", code: "SCREEN_1004" },
    { title: "净菜", code: "CLEAN_MENU" },
    { title: "料包", code: "SAUCE_MENU" },
    { title: "烹饪历史", code: "HISTORY" },
    { title: "自创菜谱", code: "SELF_CREATE" }
  ]

  /**
   * 获取菜谱列表分页查询
   * @param classifyCode  菜谱分类
   * @param pageIndex     页码
   * @param pageSize      每页加载的数据
   * @returns
   */
  getMenuList(classifyCode: string, pageIndex: number, pageSize: number = 10): Promise<MenuListItem[]> {
    return AIOTRepository.getInstance()
      .getMenuListByCatalog(classifyCode, pageIndex, pageSize)
      .then((value) => {
        return value.list;
      })
  }
}

export const homeViewModel = new HomeViewModel()