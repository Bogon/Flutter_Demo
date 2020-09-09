import '../../ui/shared/size_fit.dart';

extension IntFit on int {

  double get px {
    return SizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return SizeFit.setRpx(this.toDouble());
  }
}