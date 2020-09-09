import 'dart:ui';

class SizeFit {

  static double physicalWidth;
  static double physicalheight;
  static double screenWidth;
  static double screenHeight;
  static double dpr;
  static double statusHeight;

  static double rpx;
  static double px;

  static void initialize({double standardSize = 750}) {
    // 1.手机的物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalheight = window.physicalSize.height;

    // 2.手机的逻辑分辨率
    dpr = window.devicePixelRatio;

    // 3.宽度和高度
    screenWidth = physicalWidth/dpr;
    screenHeight = physicalheight/dpr;

    // 4.状态栏高度
    statusHeight = window.padding.top / dpr;

    // 5.计算 rpx 的大小
    rpx = screenWidth / standardSize;
    px = screenWidth / standardSize * 2;

  }

  static double setRpx(double size) {
    return rpx * size;
  }

  static double setPx(double size) {
    return px * size;
  }
}