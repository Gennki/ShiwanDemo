import { Log } from '../../common/utils/Log'
import { HomeViewModel } from '../../HomeViewModel'
import { createViewModelByEntry } from '../../ViewModel'
import { MenuListCard } from '../common/MenuListCard'

@Preview({ width: 1280, height: 400, dpi: 160 })
@Component
export struct Home {
  build() {
    Column() {
      Row() {
        Indicator()
          .layoutWeight(1)
          .margin({ top: 29 })
          .width('100%')
          .height('100%')

        Image($r('app.media.ic_search'))
          .width(72)
          .height(84)
          .margin({ top: 5, right: 16 })
          .onClick(() => {

          })

        Image($r('app.media.ic_box_disconnected'))
          .width(195)
          .height(84)
          .margin({ top: 5, right: 11 })

      }
      .alignItems(VerticalAlign.Top)
      .width('100%')
      .height(108)

      MenuListWidget()
        .width('100%')
        .height('100%')

    }.width('100%')
    .height('100%')
  }
}


@Component
struct Indicator {
  private controller = new TabsController()
  @State homeViewModel: HomeViewModel = createViewModelByEntry(HomeViewModel)

  aboutToAppear() {
    this.homeViewModel.currentTabIndex.addObserver(this, (state => {
      this.controller.changeIndex(state);
    }));
  }

  aboutToDisappear() {
    this.homeViewModel.currentTabIndex.removeObserver(this)
  }

  build() {
    Tabs({ controller: this.controller }) {
      ForEach(this.homeViewModel.classification, (item: {
        title: string;
        code: string;
      }, index: number) => {
        TabContent() {
        }.tabBar(this.TabBuilder(index, item))
      }, (item: string) => item)
    }
    .width('100%')
    .height('100%')
    .barMode(BarMode.Scrollable)
    .barPosition(BarPosition.Start)
    .animationDuration(0)
    .onChange((index: number) => {
      this.homeViewModel.changeTab(index)
    })
  }

  @Builder TabBuilder(index: number, item: {
    title: string;
    code: string;
  }) {
    Column() {
      Text(item.title)
        .fontColor(this.homeViewModel.currentTabIndex.getState() === index ? 0x333333 : 0x828282)
        .fontSize(this.homeViewModel.currentTabIndex.getState() === index ? 32 : 26)
        .fontWeight(this.homeViewModel.currentTabIndex.getState() === index ? FontWeight.Bold : FontWeight.Regular)
      Divider()
        .linearGradient({ colors: [
          [0xFDA368, 0], [0xE9765F, 0.5]
        ], angle: 90 })
        .margin({ top: 12 })
        .opacity(this.homeViewModel.currentTabIndex.getState() === index ? 1 : 0)
        .width(45)
        .height(5)
        .borderRadius(2.5)
    }.margin({ left: this.getIndicatorMarginLeft(index, item.title) })
  }

  getIndicatorMarginLeft(index: number, name: string): number {
    if (index == 0) {
      return 46
    } else if (name.length > 2) {
      return 47
    } else {
      return 57
    }
  }
}

@Component
struct MenuListWidget {
  private controller = new TabsController()
  @State homeViewModel: HomeViewModel = createViewModelByEntry(HomeViewModel)

  aboutToAppear() {
    this.homeViewModel.getMenuList()
    this.homeViewModel.currentTabIndex.addObserver(this, (state => {
      this.controller.changeIndex(state)
    }));
  }

  aboutToDisappear() {
    this.homeViewModel.currentTabIndex.removeObserver(this);
  }

  build() {
    Tabs({ controller: this.controller }) {
      ForEach(this.homeViewModel.classification, () => {
        TabContent() {
          List({ space: 15 }) {
            ForEach(this.homeViewModel.menuList, (item) => {
              ListItem() {
                MenuListCard({ isCardSelected: true, menuListItem: item })
              }
            }, (item) => item.id)
          }
          .listDirection(Axis.Horizontal)
          .alignListItem(ListItemAlign.Center)
          .padding({ left: 20 })
          .width('100%')
          .height('100%')

        }.tabBar()
      }, (item: string) => item)
    }
    .onChange((index: number) => {
      this.homeViewModel.changeTab(index)
    })
    .barHeight(0)
    .width('100%')
  }
}
