import { createRouter, createWebHistory } from 'vue-router'
import store from '../store' // Make sure to import your Vuex store

import Login from '../views/Login.vue'
import Register from '../views/Register.vue'
import Dashboard from '../views/Dashboard.vue'

const routes = [
  { 
    path: '/', 
    redirect: '/dashboard' 
  },
  { 
    path: '/login',
    name: 'Login',
    component: Login,
    meta: { 
      guestOnly: true,
      title: 'Login'
    } 
  },
  { 
    path: '/register',
    name: 'Register', 
    component: Register,
    meta: { 
      guestOnly: true,
      title: 'Register'
    } 
  },
  {
    path: '/dashboard',
    name: 'Dashboard',
    component: Dashboard,
    meta: { 
      requiresAuth: true,
      title: 'Task Dashboard'
    }
  },
  // Simple redirect for unknown routes
  {
    path: '/:pathMatch(.*)*',
    redirect: '/dashboard'
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

// Navigation guard for authentication
router.beforeEach(async (to, from, next) => {
  // Check if the route requires authentication
  const requiresAuth = to.matched.some(record => record.meta.requiresAuth)
  const guestOnly = to.matched.some(record => record.meta.guestOnly)
  
  // Check the current authentication state
  const isAuthenticated = store.getters['auth/isAuthenticated']
  
  // If the route requires auth and user isn't authenticated
  if (requiresAuth && !isAuthenticated) {
    next('/login')
  } 
  // If the route is guest-only and user is authenticated
  else if (guestOnly && isAuthenticated) {
    next('/dashboard') // Redirect to dashboard if logged in user tries to access login/register
  }
  // Otherwise, proceed to the route
  else {
    next()
  }
  
  // Optional: Set document title from route meta
  if (to.meta.title) {
    document.title = `${to.meta.title} | Task Manager`
  }
})

export default router