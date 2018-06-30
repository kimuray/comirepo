<template>
  <div class="siimple-form-field post-form-comic-title-form">
    <div class="siimple-form-field-label">マンガのタイトル</div>
    <input
      type="text"
      v-model="comicTitle"
      name="impression[comic_title]"
      class="siimple-input post-form-fluid"
      @input="filterComicTitle"
      required />
    <div class="post-form-comic-title-form-suggest" v-show="isDisplaySuggest">
      <p v-for="title in suggestTitleList" class="post-form-suggest-item">
        {{ title }}
      </p>
    </div>
    <p v-if="errors.hasError">{{ errors.message }}</p>
  </div>
</template>

<script>
import ComicsApi from '../../api/comics';

export default {
  props: {
    errors: Object,
  },
  data() {
    return {
      comicTitle: '',
      suggestTitleList: [],
      isDisplaySuggest: false,
    };
  },
  methods: {
    filterComicTitle(e) {
      if (e.target.value === '') {
        this.suggestTitleList = []
        this.isDisplaySuggest = this.suggestTitleList.length > 0
        return
      }
      ComicsApi.filterTitle(e.target.value).then(res => {
        this.suggestTitleList = res.data;
        this.isDisplaySuggest = this.suggestTitleList.length > 0
      });
    },
  }
}
</script>
