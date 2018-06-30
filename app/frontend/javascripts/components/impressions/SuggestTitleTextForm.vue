<template>
  <div class="siimple-form-field post-form-comic-title-form">
    <div class="siimple-form-field-label">マンガのタイトル</div>
    <input
      type="text"
      v-model="comicTitle"
      name="impression[comic_title]"
      class="siimple-input post-form-fluid"
      @input="filterComicTitle"
      @keyup.enter="enterComicTitle"
      @blur="deleteSuggestList"
      required />
    <div class="post-form-comic-title-form-suggest" v-if="isDisplaySuggest">
      <p
        v-for="title in suggestTitleList"
        @click="selectSuggestTitle"
        class="post-form-suggest-item">
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
        this.suggestTitleList = [];
        this.deleteSuggestList();
        return;
      }
      ComicsApi.filterTitle(e.target.value).then(res => {
        this.suggestTitleList = res.data;
        this.isDisplaySuggest = this.suggestTitleList.length > 0
      });
    },
    enterComicTitle(e) {
      e.preventDefault();
      if (!!this.suggestTitleList[0]) {
        this.comicTitle = this.suggestTitleList[0];
      }
      this.deleteSuggestList();
    },
    selectSuggestTitle(e) {
      this.comicTitle = e.target.innerText;
      this.deleteSuggestList();
    },
    deleteSuggestList() {
      // FIXME: blurの動作の為に一瞬の待ち時間が必要
      setTimeout(() => {
        this.isDisplaySuggest = false;
      }, 50);
    }
  }
}
</script>
