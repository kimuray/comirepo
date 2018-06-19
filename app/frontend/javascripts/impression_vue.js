import Vue from 'vue/dist/vue.esm';
import html2canvas from 'html2canvas';
import CaptureArea from './components/impressions/CaptureArea.vue';
import ImpressionApi from './api/impressions';

new Vue({
  el: '#js-impression-new',
  components: {
    CaptureArea,
  },
  data: {
    isModal: false,
    formData: {
      comicTitle: '',
      emotions: [],
      bestScene: '',
      report: '',
      captureImage: '',
    },
    errors: {
      comicTitle: {
        hasError: false,
        message: ''
      },
      bestScene: {
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
      const element = this.$el.querySelector('#js-capture-area');
      const _this = this;
      html2canvas(element).then(canvas => {
        _this.postImpressionToApi(canvas);
      });
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
  },
});
