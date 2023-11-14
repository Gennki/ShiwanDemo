import { MenuListItem } from '../../beans/MenuListItem'
import { HomeViewModel } from '../../HomeViewModel'
import { createViewModelByEntry } from '../../ViewModel'
import { MenuListItemWidget } from './MenuListItemWidget'

/**
 * 菜谱列表
 */
@Component
export struct MenuList {
  private controller = new TabsController()
  private homeViewModel: HomeViewModel = createViewModelByEntry(HomeViewModel)
  @Consume @Watch("onIndexChanged") currentTabIndex: number
  @State menuList: MenuListItem[] = []

  onIndexChanged() {
    this.controller.changeIndex(this.currentTabIndex)
  }

  aboutToAppear() {
    this.homeViewModel.getMenuList()
      .then((value) => {
        this.menuList = value;
      })
  }

  build() {
    Tabs({ controller: this.controller }) {
      ForEach(this.homeViewModel.classification, () => {
        TabContent() {
          List({ space: 15 }) {
            ForEach(this.menuList, (item) => {
              ListItem() {
                MenuListItemWidget({ isCardSelected: true, menuListItem: item })
              }
            }, (item) => item.id)
          }
          .listDirection(Axis.Horizontal)
          .alignListItem(ListItemAlign.Center)
          .padding({ left: 20 })
          .width('100%')
          .height('100%')

        }.tabBar()
      }, (item) => item.code)
    }
    .onChange((index: number) => {
      this.currentTabIndex = index
    })
    .barHeight(0)
    .width('100%')
  }
}