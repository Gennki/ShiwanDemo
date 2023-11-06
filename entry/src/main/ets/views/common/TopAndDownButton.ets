@Preview
@Component
export struct TopAndDownButton {
  src: string | PixelMap | Resource = $r('app.media.ic_clean');
  imageWidth: number = 76;
  imageHeight: number = 76;
  text: string | Resource = '自清洁';
  fontColor: ResourceColor = $r('app.color.font_grey');
  fontWeight: FontWeight = FontWeight.Regular;
  fontSize: number = 20;
  fontMargin: Margin | Length = { top: 6 };

  build() {
    Column() {
      Image(this.src)
        .width(this.imageWidth)
        .width(this.imageHeight)

      Text(this.text)
        .fontColor(this.fontColor)
        .fontWeight(this.fontWeight)
        .fontSize(this.fontSize)
        .margin(this.fontMargin)
    }
  }
}