import Vue from 'vue/dist/vue.esm';
import ElementUI from 'element-ui';
import Rails from 'rails-ujs';
import 'element-ui/lib/theme-chalk/index.css';
import 'stylesheets/application';
require.context('../images', true, /\.(png|jpg|jpeg|svg)$/);

Rails.start();
Vue.use(ElementUI);

new Vue({
  el: '#js-header',
});
