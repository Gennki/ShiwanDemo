import { MenuListItem } from './beans/MenuListItem';
import { AIOTRepository } from './common/http/repository/AIOTRepository';
import { Observable } from './Observable';
import { ViewModel } from "./ViewModel";

export class HomeViewModel extends ViewModel {
  // 当前选中的tab位置
  currentTabIndex = new Observable(0)
  menuList: MenuListItem[] = []
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

  getMenuList() {
    AIOTRepository.getInstance()
      .getMenuListByCatalog("SCREEN_1003", 1, 10)
      .then((value) => {
        this.menuList = value.list;
      })
  }

  changeTab(index: number) {
    this.currentTabIndex.setState(index);
  }
}
