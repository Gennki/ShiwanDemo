import { Log } from '../../common/utils/Log'

@Preview({ width: 1280, height: 400, dpi: 160 })
@Component
export struct ControllerWidget {
  private settings = new RenderingContextSettings(true)
  private context = new CanvasRenderingContext2D(this.settings)
  private bg: ImageBitmap // 背景
  private dot: ImageBitmap // 小圆点
  private perAngle: number // 每个点之间间隔的角度
  private radius: number // 圆环的半径

  // 档位圆点的数量
  dotNumber: number = 9
  // 当前在第几个圆点，范围为[0,dotNumber-1]
  currentDot: number = 5

  aboutToAppear() {
    this.bg = new ImageBitmap("images/bg_controller.png");
    this.dot = new ImageBitmap("images/ic_controller_dot.png");

    const width = 286
    const height = 251

    const cx = width / 2
    const cy = cx
    this.radius = cx

    const dot0_y = height
    const dot0_x = -Math.sqrt(this.radius * this.radius - Math.pow((dot0_y - cy), 2)) + cx

    const radians = Math.atan((dot0_y - cy) / (cx - dot0_x))
    const angle = radiansToDegrees(radians) * 2 + 180 - 5
    this.perAngle = angle / (this.dotNumber - 1)
    Log.d(`dot0_x=${dot0_x},radians=${radians},圆弧角度为=${angle},每个点之间的角度=${this.perAngle}`)

  }

  build() {
    Canvas(this.context)
      .onReady(() => {
        // 绘制背景
        this.context.drawImage(this.bg, 0, 0, 286, 251)
        // 绘制灰色的圆弧
        this.drawGrayArc()
        // 绘制所有的档位小圆点
        this.drawAllDot()

        // Log.d(`x=${x},y=${y},dotAngle=${dotAngle}}`)
        // this.context.drawImage(this.dot, x - 12, y - 12, 24, 24)
      }).onTouch((event) => {
      let startAngle = -180 - ((this.dotNumber - 1) * this.perAngle - 180) / 2;

      const x = event.touches[0].x
      const y = event.touches[0].y
      let endAngle = radiansToDegrees(Math.atan2(y - this.radius, x - this.radius))
      Log.d(`startAngle=${startAngle},endAngle=${endAngle}`)

      this.context.beginPath()
      const linearGradient = this.context.createLinearGradient(0, 0, 42, 165);
      linearGradient.addColorStop(0, "#FFC144");
      linearGradient.addColorStop(0.5, "#D84900");
      this.context.strokeStyle = linearGradient
      this.context.lineCap = "round"
      this.context.lineWidth = 22
      this.context.arc(this.radius, this.radius, this.radius - 24, degreesToRadians(startAngle), degreesToRadians(endAngle))
      this.context.stroke()

    })
  }

  /**
   * 绘制进度条
   */

  /**
   * 绘制灰色背景条
   */
  drawGrayArc() {
    let startDotAngle = -180 - ((this.dotNumber - 1) * this.perAngle - 180) / 2;

    this.context.beginPath()
    this.context.strokeStyle = '#D8D8D8'
    this.context.lineCap = 'round'
    this.context.lineWidth = 16
    this.context.arc(this.radius, this.radius, this.radius - 24, degreesToRadians(startDotAngle), degreesToRadians(startDotAngle + (this.dotNumber - 1) * this.perAngle))
    this.context.stroke()
  }

  /**
   * 绘制档位小圆点
   */
  drawAllDot() {
    let startDotAngle = -180 - ((this.dotNumber - 1) * this.perAngle - 180) / 2;
    for (let index = 0; index < this.dotNumber; index++) {
      const dotAngle = startDotAngle + this.perAngle * index
      Log.d(`dotAngle=${dotAngle}`)
      this.drawDot(degreesToRadians(dotAngle))
    }
  }

  drawDot(radians: number) {
    const x = this.radius * Math.cos(radians) * 0.83 + this.radius
    const y = this.radius * Math.sin(radians) * 0.83 + this.radius

    this.context.beginPath()
    this.context.arc(x, y, 4, 0, Math.PI * 2, false)
    this.context.fillStyle = '#ffffff'
    this.context.fill()
  }
}

// 角度转弧度
function degreesToRadians(degrees: number): number {
  return degrees * (Math.PI / 180);
}

// 弧度转角度
function radiansToDegrees(radians: number): number {
  return radians * (180 / Math.PI);
}