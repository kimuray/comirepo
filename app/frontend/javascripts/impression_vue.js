import Vue from 'vue/dist/vue.esm';
import html2canvas from 'html2canvas';
import StarRating from 'vue-star-rating'
import CaptureArea from './components/impressions/CaptureArea.vue';
import SuggestTitleTextForm from './components/impressions/SuggestTitleTextForm';
import ImpressionApi from './api/impressions';

new Vue({
  el: '#js-impression-new',
  components: {
    StarRating,
    CaptureArea,
    SuggestTitleTextForm,
  },
  data: {
    isModal: false,
    emotions: {
      joy: 0,
      sorrow: 0,
      expectation: 0,
    },
    formData: {
      comicTitle: '',
      evaluationPoint: 0.0,
      report: '',
      captureImage: '',
      emotions: [],
    },
    errors: {
      comicTitle: {
        hasError: false,
        message: ''
      },
      report: {
        hasError: false,
        message: ''
      },
    }
  },
  methods: {
    onSubmit() {
      this.isModal = true;
      setTimeout(() => {
        const element = this.$el.querySelector('#js-capture-area');
        const _this = this;
        html2canvas(element).then(canvas => {
          _this.postImpressionToApi(canvas);
        });
      }, 1000)
    },
    postImpressionToApi(canvas) {
      this.formData.captureImage = canvas.toDataURL();
      ImpressionApi.create(this.formData)
        .then(res => {
          this.isModal = false;
          window.location.href = `/impressions/${res.data.id}`;
        })
        .catch(err => {
          this.isModal = false;
          Object.keys(err.response.data).forEach(key => {
            this.errors[key].hasError = true;
            this.errors[key].message = err.response.data[key]
          });
        });
    },
    changeTitle(title) {
      this.formData.comicTitle = title;
    },
  },
});
