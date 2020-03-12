import Vue from 'vue'
import VueRouter from 'vue-router'
import login from '../views/Login.vue'
import register from '../views/register.vue'
import index from '../views/index.vue'
import auction from '../views/auction.vue'
import manager from '../views/spmanager.vue'
import adds from '../views/addSp.vue'
import results from '../views/spResult.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/login',
    name: 'login',
    component: login
  },
  {
    path: '/register',
    name: 'register',
    component: register
  },
  {
    path: '/index',
    name: 'index',
    component: index,
    children:[
      {
        path: '/index/auction',
        name: 'auction',
        component: auction
      },
      {
        path: '/index/manager',
        name: 'manager',
        component: manager
      },
      {
        path: '/index/adds',
        name: 'adds',
        component: adds
      },
      {
        path: '/index/results',
        name: 'results',
        component: results
      },
    ]
  },
]

const router = new VueRouter({
  routes
})

//路由前置守卫拦截器
router.beforeEach((to, from, next) => {
  //放行登录注册
  if(to.path === '/login' || to.path === '/register'){
    next();
  }else{
    //已登录放行
    if(sessionStorage.getItem("users")){
        next();
    }else{
      next('/login');
    }
  }
})

export default router
