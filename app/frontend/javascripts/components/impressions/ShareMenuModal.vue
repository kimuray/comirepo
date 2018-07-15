<template>
  <div class="modal">
    <div class="modal-menu">
      <div class="modal-share-image">
        <img :src="postData.capture_url" />
      </div>
      <div class="modal-field">
        <a
          :href="tweetUrl"
          class="siimple-btn siimple-btn--blue modal-share-btn"
          target="_blank">
           Twitterでシェア
        </a>
      </div>
      <div class="modal-field">
        <a
          :href="postData.capture_url"
          class="siimple-btn siimple-btn--grey modal-share-btn"
          download="capture">
          画像をダウンロード
        </a>
      </div>
      <div class="modal-field">
        <a
          class="siimple-btn modal-share-btn"
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
  computed: {
    tweetUrl: function() {
      const baseText = `${this.postData.comic_title}を読みました！`;
      const url = this.postData.page_url;
      const hashtags = `まんがのおばけ`;
      const postUrl = `https://twitter.com/intent/tweet?text=${baseText}&url=${url}&hashtags=${hashtags}`;
      return postUrl;
    }
  },
  methods: {
    closeMenu() {
      this.$emit('close-menu');
    },
  }
}
</script>
