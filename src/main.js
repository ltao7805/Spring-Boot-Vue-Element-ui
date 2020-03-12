import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import element from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import jQuery from 'jquery'

Vue.config.productionTip = false
Vue.use(element)

//跨域设置
jQuery.ajaxSetup({
    xhrFields:{
      withCredentials: true
    },
    crossDomain: true
})

Vue.prototype.jquery=jQuery

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
