<template>
  <div class="capture">
    <h3>タイトル</h3>
    <p>{{ comicTitle }}</p>
    <h3>感情</h3>
    <span v-for="emotion in emotions">
      <span class="message">{{ emotion.name }}</span>
    </span>
    <h3>ベストシーン</h3>
    <p>{{ bestScene }}</p>
    <h3>感想</h3>
    <p style="white-space: pre-wrap;">{{ report }}</p>
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
  created() {
    axios.get(`/emotions`).then(res => {
      this.emotions = res.data;
    });
  },
};
</script>
