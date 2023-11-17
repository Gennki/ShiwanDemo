import { homeViewModel } from '../../HomeViewModel'

@Component
export struct MenuIndicator {
  @Link classifyIndex: number
  controller:TabsController

  build() {
    Tabs({ controller: this.controller }) {
      ForEach(homeViewModel.classification, (item, index: number) => {
        TabContent() {
        }.tabBar(this.TabBuilder(index, item.title))
      }, (item) => item.code)
    }
    .width('100%')
    .height('100%')
    .barMode(BarMode.Scrollable)
    .barPosition(BarPosition.Start)
    .animationDuration(0)
    .onChange((index: number) => {
      this.classifyIndex = index
    })
  }

  @Builder TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.classifyIndex === index ? 0x333333 : 0x828282)
        .fontSize(this.classifyIndex === index ? 32 : 26)
        .fontWeight(this.classifyIndex === index ? FontWeight.Bold : FontWeight.Regular)
      Divider()
        .linearGradient({ colors: [
          [0xFDA368, 0], [0xE9765F, 0.5]
        ], angle: 90 })
        .margin({ top: 12 })
        .opacity(this.classifyIndex === index ? 1 : 0)
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

@Preview({ title: "Indicator", width: 1280, height: 80, dpi: 160 })
@Component
struct MenuIndicatorPreview {
  @State classifyIndex: number = 0

  build() {
    MenuIndicator({ classifyIndex: $classifyIndex })
  }
}
