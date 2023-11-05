import { VolumeProgressBar } from './volume_progress_bar'

@Preview({
  width: 1280,
  height: 400,
  dpi: 160,
})
@Component
export struct Setting {
  build() {
    Column() {
      this.buildUserInfo()

      Column() {
        Text('系统音量')
          .fontSize(20)
          .fontColor(0x595550)
          .fontWeight(FontWeight.Regular)
          .alignSelf(ItemAlign.Start)
          .margin({ left: 36, top: 40 })

        VolumeProgressBar()

      }.width(406)
      .height(288)
      .backgroundImage($r('app.media.bg_setting_basic'))

    }.width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background'))
  }

  @Builder
  buildUserInfo() {
    Row() {
      Row() {
        Image($r('app.media.ic_user_default_head'))
          .objectFit(ImageFit.Cover)
          .width(60)
          .height(60)

        Text('小骨朵快走的烘万')
          .fontColor($r('app.color.font_black'))
          .fontSize(26)
          .fontWeight(FontWeight.Regular)
          .margin({ left: 12 })
      }

      Button('退出登录')
        .fontColor($r('app.color.font_black'))
        .fontColor($r('app.color.logout_button_font'))
        .fontSize(28)
        .fontWeight(FontWeight.Regular)
        .borderWidth(1)
        .borderStyle(BorderStyle.Solid)
        .borderColor($r('app.color.logout_button_border'))
        .backgroundColor(Color.Transparent)
    }.width('100%')
    .height(92)
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({ left: 32, right: 40 })
  }
}


