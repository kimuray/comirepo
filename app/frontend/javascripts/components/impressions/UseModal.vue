<template>
  <div class="modal">
    <div v-if="isWait" class="siimple-spinner siimple-spinner--pink"></div>
    <div v-else class="modal-menu">
      <div class="use-image-box">
        <swiper :options="swiperOption">
          <swiper-slide>
            <img src="../../../images/introduction1.png" class="use-image-picture" />
          </swiper-slide>
          <swiper-slide>
            <img src="../../../images/introduction2.png" class="use-image-picture" />
          </swiper-slide>
          <swiper-slide>
            <img src="../../../images/introduction3.png" class="use-image-picture" />
          </swiper-slide>
          <swiper-slide>
            <img src="../../../images/introduction4.png" class="use-image-picture" />
          </swiper-slide>
          <swiper-slide>
            <img src="../../../images/introduction5.png" class="use-image-picture" />
          </swiper-slide>
          <div class="swiper-button-prev" slot="button-prev"></div>
          <div class="swiper-button-next" slot="button-next"></div>
          <div class="swiper-pagination" slot="pagination"></div>
        </swiper>
      </div>
      <a href="javascript:void(0)" @click="closeMenu" class="siimple-btn siimple-btn--grey" style="display: block;">閉じる</a>
    </div>
  </div>
</template>

<script>
import { swiper, swiperSlide } from 'vue-awesome-swiper';

export default {
  components: {
    swiper,
    swiperSlide,
  },
  data() {
    return {
      isWait: true,
      swiperOption: {
        pagination: {
          el: '.swiper-pagination'
        },
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev'
        },
      }
    }
  },
  create() {
    this.isWait = true;
  },
  mounted() {
    setTimeout(() => {
      this.isWait = false;
    }, 1000)
  },
  methods: {
    closeMenu() {
      this.$emit('close');
    }
  }
}
</script>
