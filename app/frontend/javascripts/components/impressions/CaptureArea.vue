<template>
  <div class="capture-container">
    <div class="capture-field">
      <span class="capture-field-title">読んだマンガ</span>
      <div class="capture-header">
        <p class="capture-comic-title">{{ comicTitle }}</p>
        <p class="capture-volume-number">{{ displayVolumeNumber }}</p>
        <star-rating
          :increment="0.5"
          :star-size="25"
          :rating="evaluationPoint"
          :read-only="true"
          :fixed-points="1"
          :text-class="'capture-rating-text'" />
      </div>
    </div>

    <div class="capture-field">
      <span class="capture-field-title">読んだあとの気持ち</span>
      <div class="capture-emotions">
        <label v-for="emotion in emotionList"
               class="capture-tag siimple-tag tag--primary hide"
               :data-emotion-id="emotion.id">{{ emotion.name }}</label>
        <label v-if="nothingEmotions" class="capture-tag siimple-tag tag--primary">
          特になし
        </label>
      </div>
    </div>

    <div class="capture-field">
      <span class="capture-field-title">感想</span>
      <p class="capture-report">{{ report }}</p>
    </div>

    <img src="../../../images/card_logo.png" height="80" width="300" />
  </div>
</template>

<script>
import StarRating from 'vue-star-rating'
import { axios } from '../../utils/http-client';
import EmotionApi from '../../api/emotions';

export default {
  name: 'CaptureArea',
  components: {
    StarRating,
  },
  props: {
    comicTitle: String,
    emotions: Array,
    evaluationPoint: Number,
    report: String,
    volumeNumber: [Number, String],
  },
  data() {
    return {
      emotionList: [],
    };
  },
  watch: {
    emotions(val) {
      this.addCheckStyle(val);
    },
  },
  computed: {
    nothingEmotions: function() {
      return this.emotions.length === 0;
    },
    displayVolumeNumber: function() {
      if (this.volumeNumber === null || isNaN(this.volumeNumber)) {
        return '';
      }
      return `${this.volumeNumber}巻`;
    }
  },
  created() {
    EmotionApi.getList().then(res => {
      this.emotionList = res.data;
    });
  },
  methods: {
    addCheckStyle(emotions) {
      this.$el.querySelectorAll('[data-emotion-id]').forEach(element => {
        if (emotions.includes(element.dataset.emotionId)) {
          element.classList.remove('hide');
        } else {
          element.classList.add('hide');
        }
      });
    },
  }
};
</script>
