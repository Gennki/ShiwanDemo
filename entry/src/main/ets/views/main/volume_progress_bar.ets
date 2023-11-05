@Preview
@Component
export struct VolumeProgressBar {
  //用来配置CanvasRenderingContext2D对象的参数，包括是否开启抗锯齿，true表明开启抗锯齿。
  private settings: RenderingContextSettings = new RenderingContextSettings(true)
  //用来创建CanvasRenderingContext2D对象，通过在canvas中调用CanvasRenderingContext2D对象来绘制。
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings)
  max?: number = 10
  @State value?: number = 5

  build() {
    Canvas(this.context)
      .width(331)
      .height(49)
      .borderRadius(12)
      .onReady(() => {
        this.onDraw()
      })
      .clip(true)
      .borderRadius(12)
      .backgroundColor(0xDEDEDE)
      .onTouch((event) => {
        if (event.type === TouchType.Move) {
          let touchX = event.touches[0].x;
          if (touchX < 0) {
            touchX = 0;
          }
          if (touchX > this.context.width) {
            touchX = this.context.width
          }
          this.value = Math.round(touchX / this.context.width * this.max);
          console.log(`move=================${event.touches[0].x},${event.touches[0].y},value=${this.value}`)
          this.onDraw()
        }
      })
  }

  onDraw() {
    const width = this.context.width;
    const height = this.context.height;

    const linearGradient = this.context.createLinearGradient(0, 0, width, height);
    linearGradient.addColorStop(0, "#FF640A");
    linearGradient.addColorStop(0.5, "#FF9000");

    this.context.fillStyle = linearGradient;
    this.context.clearRect(0, 0, width, height);
    this.context.fillRect(0, 0, width * this.value / this.max, height);
  }
}


