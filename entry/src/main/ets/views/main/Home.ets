import { AIOTRepository } from '../../common/http/repository/AIOTRepository'
import { Log } from '../../common/utils/Log'

@Preview
@Component
export struct Home {
  @State currentIndex: number = 0
  private classification: string[] = ['肉禽', '蔬菜', '水产', '五谷', '净菜', '料包', '烹饪历史', '自创菜谱']

  build() {
    Column() {
      Row() {
        Indicator({ titles: this.classification, currentIndex: $currentIndex })
          .layoutWeight(1)
          .margin({ top: 29 })
          .width('100%')
          .height('100%')

        Image($r('app.media.ic_search'))
          .width(72)
          .height(84)
          .margin({ top: 5, right: 16 })
          .onClick(() => {
            AIOTRepository.getInstance().getMenuListByCatalog("SCREEN_1003", 1, 10)
              .then((value) => {
                // value.list
              })
          })

        Image($r('app.media.ic_box_disconnected'))
          .width(195)
          .height(84)
          .margin({ top: 5, right: 11 })

      }
      .alignItems(VerticalAlign.Top)
      .width('100%')
      .height(108)

      MenuListWidget({ titles: this.classification, currentIndex: $currentIndex })
        .width('100%')
        .height('100%')

    }.width('100%')
    .height('100%')
  }
}


@Component
struct Indicator {
  @Link @Watch('unIndexChanged') currentIndex: number
  titles: string[]
  private controller = new TabsController()

  unIndexChanged() {
    this.controller.changeIndex(this.currentIndex)
  }

  build() {
    Tabs({ controller: this.controller }) {
      ForEach(this.titles, (item: string, index: number) => {
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
      this.currentIndex = index
    })
  }

  @Builder TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? 0x333333 : 0x828282)
        .fontSize(this.currentIndex === index ? 32 : 26)
        .fontWeight(this.currentIndex === index ? FontWeight.Bold : FontWeight.Regular)
      Divider()
        .linearGradient({ colors: [
          [0xFDA368, 0], [0xE9765F, 0.5]
        ], angle: 90 })
        .margin({ top: 12 })
        .opacity(this.currentIndex === index ? 1 : 0)
        .width(45)
        .height(5)
        .borderRadius(2.5)
    }.margin({ left: this.getIndicatorMarginLeft(index, name) })
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
  @Link @Watch('unIndexChanged') currentIndex: number
  titles: string[]
  private controller = new TabsController()

  unIndexChanged() {
    this.controller.changeIndex(this.currentIndex)
  }

  build() {
    Tabs({ controller: this.controller }) {
      ForEach(this.titles, (item: string) => {
        TabContent() {
          Column() {
            Text(item)
          }.backgroundColor(0xFFFF00)
          .width('100%')
          .height('100%')
        }.tabBar()
      }, (item: string) => item)
    }
    .onChange((index: number) => {
      this.currentIndex = index
    })
    .barHeight(0)
    .width('100%')
    .height('100%')
  }
}