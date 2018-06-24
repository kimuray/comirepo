<template>
  <div class="capture-container">
    <img src="../../../images/logo.png" height="30" width="128" />
    <div class="capture-contents">
      <div class="capture-field">
        <h3 class="capture-comic-title capture-input">{{ comicTitle }}</h3>
        <p class="capture-message">を読みました！</p>
      </div>

      <div class="capture-field_emotion">
        <!-- <div v-for="emotion in emotions" class="capture-emotion-item">
          <label class="capture-tag" :data-emotion-id="emotion.id">{{ emotion.name }}</label>
        </div> -->
        <div class="capture-emotion-item">
          <p class="capture-emotion-item-label">楽しみ</p>
          <star-rating
            :increment="0.5"
            :star-size="35"
            :rating="emotions.joy" />
        </div>

        <div class="capture-emotion-item">
          <p class="capture-emotion-item-label">悲しみ</p>
          <star-rating
            :increment="0.5"
            :star-size="35"
            :rating="emotions.sorrow" />
        </div>

        <div class="capture-emotion-item">
          <p class="capture-emotion-item-label">期待</p>
          <star-rating
            :increment="0.5"
            :star-size="35"
            :rating="emotions.expectation" />
        </div>
      </div>

      <div class="capture-field">
        <h3 class="capture-sub-title">ベストシーン</h3>
        <p class="capture-message capture-input">{{ bestScene }}</p>
      </div>

      <div class="capture-field">
        <h3 class="capture-sub-title">感想</h3>
        <p class="capture-message capture-input">{{ report }}</p>
      </div>
    </div>
  </div>
</template>

<script>
import StarRating from 'vue-star-rating'
import { axios } from '../../utils/http-client';

export default {
  name: 'CaptureArea',
  components: {
    StarRating,
  },
  props: {
    comicTitle: String,
    emotions: Object,
    bestScene: String,
    report: String,
  },
  methods: {
    addCheckStyle(emotions) {
      this.$el.querySelectorAll('[data-emotion-id]').forEach(element => {
        if (emotions.includes(element.dataset.emotionId)) {
          element.classList.add('siimple-tag');
          element.classList.add('siimple-tag--teal');
        } else {
          element.classList.remove('siimple-tag');
          element.classList.remove('siimple-tag--teal');
        }
      });
    },
  }
};
</script>
