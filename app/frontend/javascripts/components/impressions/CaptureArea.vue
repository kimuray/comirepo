<template>
  <div class="capture-container">
    <img src="../../../images/logo.png" height="30" width="128" />
    <div class="capture-contents">
      <div class="capture-field">
        <h3 class="capture-comic-title capture-input">{{ comicTitle }}</h3>
        <p class="capture-message">を読みました！</p>
      </div>

      <div class="capture-field_emotion">
        <div v-for="emotion in emotions" class="capture-emotion-item">
          <label :class="`capture-tag ${isCheckEmotion}`">{{ emotion.name }}</label>
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
import { axios } from '../../utils/http-client';

export default {
  name: 'CaptureArea',
  props: {
    comicTitle: String,
    selectedEmotions: Array,
    bestScene: String,
    report: String,
  },
  data() {
    return {
      emotions: [],
    };
  },
  computed: {
    isCheckEmotion: () => {
      return 'siimple-tag siimple-tag--teal';
    }
  },
  created() {
    axios.get(`/emotions`).then(res => {
      this.emotions = res.data;
    });
  },
};
</script>
