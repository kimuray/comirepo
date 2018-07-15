<template>
  <div class="modal">
    <div class="modal-menu">
      <div class="modal-share-image">
        <img :src="postData.capture_url" />
      </div>
      <div class="modal-field">
        <a
          href="https://twitter.com/intent/tweet"
          class="siimple-btn siimple-btn--blue modal-share-btn"
          target="_blank">
           Twitterでシェア
        </a>
      </div>
      <div class="modal-field">
        <a
          :href="postData.capture_url"
          class="siimple-btn siimple-btn--blue modal-share-btn"
          download="capture">
          画像をダウンロード
        </a>
      </div>
      <div class="modal-field">
        <a
          class="siimple-btn siimple-btn--gray modal-share-btn"
          @click="closeMenu">
          閉じる
        </a>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: ['postData'],
  methods: {
    closeMenu() {
      this.$emit('close-menu');
    },
  }
}
</script>
