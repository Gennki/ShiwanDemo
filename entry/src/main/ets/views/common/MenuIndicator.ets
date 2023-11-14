import { HomeViewModel } from '../../HomeViewModel';
import { createViewModelByEntry } from '../../ViewModel';

/**
 * 菜谱列表顶部指示器
 */
@Component
export struct MenuIndicator {
  private controller = new TabsController()
  private homeViewModel: HomeViewModel = createViewModelByEntry(HomeViewModel)
  @Consume @Watch("onIndexChanged") currentTabIndex: number

  onIndexChanged() {
    this.controller.changeIndex(this.currentTabIndex);
  }

  build() {
    Tabs({ controller: this.controller }) {
      ForEach(this.homeViewModel.classification, (item: {
        title: string;
        code: string;
      }, index: number) => {
        TabContent() {
        }.tabBar(this.TabBuilder(index, item))
      }, (item) => item.code)
    }
    .width('100%')
    .height('100%')
    .barMode(BarMode.Scrollable)
    .barPosition(BarPosition.Start)
    .animationDuration(0)
    .onChange((index: number) => {
      this.currentTabIndex = index
    })
  }

  @Builder TabBuilder(index: number, item: {
    title: string;
    code: string;
  }) {
    Column() {
      Text(item.title)
        .fontColor(this.currentTabIndex === index ? 0x333333 : 0x828282)
        .fontSize(this.currentTabIndex === index ? 32 : 26)
        .fontWeight(this.currentTabIndex === index ? FontWeight.Bold : FontWeight.Regular)
      Divider()
        .linearGradient({ colors: [
          [0xFDA368, 0], [0xE9765F, 0.5]
        ], angle: 90 })
        .margin({ top: 12 })
        .opacity(this.currentTabIndex === index ? 1 : 0)
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