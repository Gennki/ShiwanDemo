import { MenuIndicator } from '../common/MenuIndicator'
import { MenuList } from '../common/MenuList'

@Preview({ width: 1280, height: 400, dpi: 160 })
@Component
export struct Home {
  @Provide currentTabIndex: number = 0

  build() {
    Column() {
      Row() {
        MenuIndicator()
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

      MenuList()
        .width('100%')
        .height('100%')

    }.width('100%')
    .height('100%')
  }
}




