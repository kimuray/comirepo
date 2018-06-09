import Vue from 'vue/dist/vue.esm';
import html2canvas from 'html2canvas';
import CaptureArea from './components/impressions/CaptureArea.vue';

new Vue({
  el: '#js-impression-new',
  components: {
    CaptureArea,
  },
  data: {
    comicTitle: '',
    emotions: [],
    bestScene: '',
    report: '',
  },
  methods: {
    captureHTML() {
      const element = this.$el;
      html2canvas(element).then(canvas => {
        document.getElementById('test-image').src = canvas.toDataURL();
      });
    },
    onSubmit() {
    },
  },
});
