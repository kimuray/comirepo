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
    formData: {
      comicTitle: '',
      emotions: [],
      bestScene: '',
      report: '',
      captureImage: '',
    },
  },
  methods: {
    onSubmit() {
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
          window.location.href = `/impressions/${res.data.id}`;
        })
        .catch(err => {
          console.log(err)
        });
    },
  },
});
