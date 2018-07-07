import Vue from 'vue/dist/vue.esm';
import ElementUI from 'element-ui';
import Rails from 'rails-ujs';
import 'element-ui/lib/theme-chalk/index.css';
import 'stylesheets/application';
require.context('../images', true, /\.(png|jpg|jpeg|svg)$/);

Rails.start();
Vue.use(ElementUI);

if (!!document.querySelector('#js-header')) {
  new Vue({
    el: '#js-header',
  });
}

if (!!document.querySelector('#js-alert')) {
  new Vue({
    el: '#js-alert',
    data: {
      isShow: true
    },
    mounted() {
      setTimeout(() => {
        this.isShow = false;
      }, 3000);
    },
  });
}
