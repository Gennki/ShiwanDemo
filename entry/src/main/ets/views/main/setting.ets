import { TopAndDownButton } from '../common/TopAndDownButton'
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

      Scroll() {
        Row() {
          this.buildLeftCard()
          this.buildMiddleCard()
          this.buildRightCard()
        }
      }.scrollable(ScrollDirection.Horizontal)

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

      Button($r('app.string.sign_out'))
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

  @Builder
  buildLeftCard() {
    Column() {
      Text($r('app.string.system_volume'))
        .fontSize(20)
        .fontColor(0x595550)
        .fontWeight(FontWeight.Regular)
        .alignSelf(ItemAlign.Start)
        .margin({ left: 36, top: 40, bottom: 16 })

      Stack() {
        VolumeProgressBar()
        Image($r('app.media.ic_volume'))
          .width(24)
          .height(21)
          .margin({ left: 13 })
      }
      .width(331)
      .height(49)
      .alignContent(Alignment.Start)

      Row() {
        TopAndDownButton({
          src: $r('app.media.ic_clean'),
          text: $r('app.string.self_cleaning'),
        })
        TopAndDownButton({
          src: $r('app.media.ic_wifi'),
          text: $r('app.string.wifi'),
        })
        TopAndDownButton({
          src: $r('app.media.ic_have_update'),
          text: $r('app.string.upgrade'),
        })
      }.margin({ top: 17 })
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)

    }.width(406)
    .height(288)
    .backgroundImage($r('app.media.bg_setting_basic'))
    .backgroundImageSize({ width: 406, height: 288 })
  }

  @Builder
  buildMiddleCard() {
    Column() {
      this.buildListTile(
        $r('app.media.ic_setting_ble'),
        $r('app.string.bluetooth_device_management'),
        $r('app.media.ic_setting_right_arrow'),
        { left: 36, top: 40, right: 23 })

      Row() {
        this.buildBleManageCard($r('app.string.material_box_pro'), $r('app.string.connected'))
        this.buildBleManageCard($r('app.string.drink_wan'), $r('app.string.connected'))

      }.width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({ left: 36, right: 36, top: 16 })

      Blank()

      this.buildListTile(
        $r('app.media.ic_setting_help'),
        $r('app.string.help'),
        $r('app.media.ic_setting_right_arrow'),
        { left: 36, right: 36, bottom: 40 })
    }
    .backgroundImage($r('app.media.bg_ble_manage'))
    .backgroundImageSize({ width: 354, height: 288 })
    .width(354)
    .height(288)
  }

  @Builder
  buildRightCard() {
    Column() {

      Row() {
        Image($r('app.media.ic_music'))
          .width(62)
          .height(62)

        Column() {
          Text('柠檬水里的故事')
            .fontColor(Color.Black)
            .fontSize(24)
            .fontWeight(FontWeight.Regular)

          Text($r('app.string.not_playing'))
            .fontColor($r('app.color.font_grey'))
            .fontSize(20)
            .fontWeight(FontWeight.Regular)
            .margin({ top: 6 })

        }.alignItems(HorizontalAlign.Start)
        .margin({ left: 12 })
      }
      .width('100%')
      .padding({ top: 28, left: 38 })
      .justifyContent(FlexAlign.Start)

      Row() {
        Image($r('app.media.ic_music_last'))
          .width(58)
          .height(58)

        Image($r('app.media.ic_music_play'))
          .width(58)
          .height(58)

        Image($r('app.media.ic_music_next'))
          .width(58)
          .height(58)
      }.width('100%')
      .padding({ top: 20, left: 62, right: 62 })
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Column()
          .width('100%')
          .height(2)
          .linearGradient({ colors: [[0xFDA368, 0], [Color.White, 0.5]] })
          .margin({ top: 16 })
      }.padding({ left: 38, right: 38 })

      Text($r('app.string.music_volume'))
        .fontColor($r('app.color.font_grey'))
        .fontSize(20)
        .fontWeight(FontWeight.Regular)
        .alignSelf(ItemAlign.Start)
        .margin({ left: 38, top: 13 })

      Row() {
        VolumeProgressBar()
          .width('100%')
          .height(20)
      }.padding({ top: 12, left: 38, right: 38 })

    }.width(378)
    .height(288)
    .backgroundImage($r('app.media.bg_setting_music'))
    .backgroundImageSize({ width: 378, height: 288 })
  }

  @Builder
  buildListTile(leftImage: Resource, title: string | Resource, rightImage: Resource, padding?: Padding | Length) {
    Row() {
      Image(leftImage)
        .width(32)
        .height(32)
        .margin({ right: 12 })

      Text(title)
        .fontColor($r('app.color.font_black'))
        .fontSize(22)
        .fontWeight(FontWeight.Regular)

      Blank()

      Image(rightImage)
        .width(32)
        .height(32)
    }
    .width('100%')
    .padding(padding)
  }

  @Builder
  buildBleManageCard(title: string | Resource, subTitle: string | Resource) {
    Column() {
      Text(title)
        .fontSize(22)
        .fontColor($r('app.color.font_black'))
        .fontWeight(FontWeight.Bold)


      Text(subTitle)
        .fontSize(20)
        .fontColor('#828282')
    }
    .backgroundColor('#F9F4F0')
    .alignItems(HorizontalAlign.Start)
    .width(136)
    .height(80)
    .borderRadius(12)
    .padding({ left: 20 })
    .justifyContent(FlexAlign.Center)
  }
}


