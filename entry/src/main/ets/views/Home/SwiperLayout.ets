import { IBannerItem, BannerListDataSource } from '../../model/HomeData';

@Component
export default struct SwiperLayout {
  @ObjectLink bannerList: BannerListDataSource

  build() {
    Swiper() {
      LazyForEach(this.bannerList, (banner: IBannerItem) => {
        Image(banner.imageURL)
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Fill)
      }, (banner: IBannerItem) => banner.id + '')
    }
    .width('100%')
    .height(211 - 36) //减去状态栏高度
    .autoPlay(true)
    .interval(3000)
    .indicator(
      new DotIndicator()
        .color($r('app.color.indicator_color'))
        .selectedColor($r('app.color.indicator_active_color'))
    )
  }
}
