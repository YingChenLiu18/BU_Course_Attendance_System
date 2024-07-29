import Vue from 'vue';
import Router from 'vue-router';
import MainLayout from '@/components/MainLayout.vue'; // 确保路径和组件名称正确

Vue.use(Router);

const routes = [
  {
    path: '/login',
    name: 'Login',
    component: () => import('@/views/login/index.vue')
  },
  {
    path: '/register',
    name: 'Register',
    component: () => import('@/views/signUp/index.vue')
  },
  {
    path: '/forgotPassword',
    name: 'ForgotPassword',
    component: () => import('@/views/forgotPassword/index.vue')
  },
  {
    path: '/',
    component: MainLayout,
    redirect: '/dashboard',
    children: [
      {
        path: 'dashboard',
        name: 'Dashboard',
        component: () => import('@/views/dashboard/index.vue')
      },
      {
        path: 'attendance',
        name: 'Attendance',
        component: () => import('@/views/attendance/index.vue')
      },
      {
        path: 'course',
        name: 'Course',
        component: () => import('@/views/course/index.vue')
      },
      {
        path: 'help',
        name: 'Help',
        component: () => import('@/views/help/index.vue')
      },
      {
        path: 'statistics',
        name: 'Statistics',
        component: () => import('@/views/statistics/index.vue')
      },
      {
        path: 'student',
        name: 'Student',
        component: () => import('@/views/student/index.vue')
      },
      {
        path: 'user',
        name: 'User',
        component: () => import('@/views/user/index.vue')
      }
    ]
  }
];

export default new Router({
  routes
});