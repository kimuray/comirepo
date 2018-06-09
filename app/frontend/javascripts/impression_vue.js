import Vue from 'vue/dist/vue.esm';
import html2canvas from 'html2canvas';

new Vue({
  el: '#js-capture-zone',
  mounted() {
    this.captureHTML();
  },
  methods: {
    captureHTML() {
      const element = this.$el;
      html2canvas(element).then(canvas => {
        document.getElementById('test-image').src = canvas.toDataURL();
      });
    },
  },
});
