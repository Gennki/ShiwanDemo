import { MenuListItem } from './beans/MenuListItem';
import { AIOTRepository } from './common/http/repository/AIOTRepository';
import { ViewModel } from "./ViewModel";

@Observed
export class HomeViewModel extends ViewModel {
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

  getMenuList(): Promise<MenuListItem[]> {
    return AIOTRepository.getInstance()
      .getMenuListByCatalog("SCREEN_1003", 1, 10)
      .then((value) => {
        return value.list;
      })
  }
}
