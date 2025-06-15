// src/store/index.js
import { createStore } from 'vuex'
import api from '@/utils/api'
import auth from './modules/auth'

export default createStore({
  modules: {
    auth
  },
  state: {
    user: null,
    isAuthenticated: false,
    error: null,          // Added error state
    loading: false       // Added loading state
  },
  mutations: {
    setUser(state, user) {
      state.user = user
      state.isAuthenticated = true
      state.error = null  // Clear errors on success
    },
    logout(state) {
      state.user = null
      state.isAuthenticated = false
    },
    setError(state, error) {  // New mutation
      state.error = error
    },
    setLoading(state, loading) {  // New mutation
      state.loading = loading
    }
  },
  actions: {
    async register({ commit }, userData) {
      commit('setLoading', true)
      try {
        const response = await api.post('/register', userData)
        commit('setUser', response.data.user)
        localStorage.setItem('authToken', response.data.token)
        return response.data
      } catch (error) {
        const message = error.response?.data?.message || 'Registration failed'
        commit('setError', message)
        throw error
      } finally {
        commit('setLoading', false)
      }
    },
    async login({ commit }, credentials) {
      commit('setLoading', true)
      try {
        const response = await api.post('/login', credentials)
        commit('setUser', response.data.user)
        localStorage.setItem('authToken', response.data.token)
        return response.data
      } catch (error) {
        const message = error.response?.data?.message || 'Login failed'
        commit('setError', message)
        throw error
      } finally {
        commit('setLoading', false)
      }
    },
    async checkAuth({ commit }) {
      try {
        const token = localStorage.getItem('authToken')
        if (token) {
          const response = await api.get('/user')
          commit('setUser', response.data)
        }
      } catch (error) {
        localStorage.removeItem('authToken')
      }
    },
    logout({ commit }) {
      localStorage.removeItem('authToken')
      commit('logout')
    }
  },
  getters: {
    authError: state => state.error,    // New getter
    isLoading: state => state.loading   // New getter
  }
})