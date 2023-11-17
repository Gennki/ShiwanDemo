import { homeViewModel } from '../../HomeViewModel'
import { MenuIndicator } from '../common/MenuIndicator'
import { MenuListWidget } from '../common/MenuListWidget'

@Preview({ width: 1280, height: 400, dpi: 160 })
@Component
export struct Home {
  @State @Watch('onIndexChanged') classifyIndex: number = 0 // 当前用户选中的分类
  private controller = new TabsController()

  onIndexChanged() {
    this.controller.changeIndex(this.classifyIndex)
  }

  build() {
    Column() {
      Row() {
        MenuIndicator({ classifyIndex: $classifyIndex, controller: this.controller })
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

      Tabs({ controller: this.controller }) {
        ForEach(homeViewModel.classification, (item,index) => {
          TabContent() {
            MenuListWidget({ classifyIndex: index })
          }.tabBar()
        }, (item) => item.code)
      }
      .onChange((index: number) => {
        this.classifyIndex = index
      })
      .barHeight(0)
      .width('100%')
      .height('100%')

    }.width('100%')
    .height('100%')
  }
}







