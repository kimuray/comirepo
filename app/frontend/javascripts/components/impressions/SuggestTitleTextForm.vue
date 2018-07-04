<template>
  <div class="siimple-form-field post-form-comic-title-form">
    <div class="siimple-form-field-label">マンガのタイトル</div>
    <input
      type="text"
      v-model="comicTitle"
      name="impression[comic_title]"
      class="siimple-input post-form-fluid"
      @keyup="filterComicTitle"
      @keyup.enter="enterComicTitle"
      @blur="deleteSuggestList"
      required />
    <div class="post-form-comic-title-form-suggest" v-if="displaySuggest">
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
import { debounce } from 'lodash';
import ComicsApi from '../../api/comics';

export default {
  props: {
    errors: Object,
  },
  data() {
    return {
      comicTitle: '',
      suggestTitleList: [],
      isDisplaySuggest: true,
    };
  },
  computed: {
    displaySuggest: function() {
      // FIXME: サジェストの表示制御が複雑。。。
      if (!this.isDisplaySuggest) {
        return false;
      }
      return this.suggestTitleList.length > 0;
    }
  },
  watch: {
    comicTitle(val) {
      this.$emit('change-title', val);
    }
  },
  created() {
    this.filterComicTitle = debounce((e) => {
      if (e.target.value === '') {
        this.suggestTitleList = [];
        return;
      }
      ComicsApi.filterTitle(e.target.value).then(res => {
        this.suggestTitleList = res.data;
        if (this.suggestTitleList.length > 0) {
          this.isDisplaySuggest = true;
        }
      });
    }, 500);
  },
  methods: {
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
