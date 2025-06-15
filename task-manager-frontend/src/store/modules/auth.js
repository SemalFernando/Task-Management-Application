import api from '@/utils/api'

export default {
  namespaced: true,
  state: () => ({
    user: null,
    isAuthenticated: false,
    error: null,
    loading: false
  }),
  mutations: {
    SET_USER(state, user) {
      state.user = user
      state.isAuthenticated = true
      state.error = null
    },
    SET_ERROR(state, error) {
      state.error = error
    },
    SET_LOADING(state, loading) {
      state.loading = loading
    },
    CLEAR_ERROR(state) {
      state.error = null
    },
    LOGOUT(state) {
      state.user = null
      state.isAuthenticated = false
      state.error = null
    }
  },
  actions: {
    async register({ commit }, userData) {
      commit('SET_LOADING', true)
      try {
        const response = await api.post('/register', {
          name: userData.name,
          email: userData.email,
          password: userData.password,
          password_confirmation: userData.password_confirmation
        })
        
        commit('SET_USER', response.data.user)
        localStorage.setItem('authToken', response.data.token)
        return response.data
      } catch (error) {
        const message = error.response?.data?.message || 
                       error.response?.data?.error ||
                       'Registration failed'
        commit('SET_ERROR', message)
        throw error
      } finally {
        commit('SET_LOADING', false)
      }
    },

    async login({ commit }, credentials) {
      commit('SET_LOADING', true)
      try {
        const response = await api.post('/login', {
          email: credentials.email,
          password: credentials.password
        })
        
        commit('SET_USER', response.data.user)
        localStorage.setItem('authToken', response.data.token)
        return response.data
      } catch (error) {
        const message = error.response?.data?.message || 
                       error.response?.data?.error ||
                       'Login failed'
        commit('SET_ERROR', message)
        throw error
      } finally {
        commit('SET_LOADING', false)
      }
    },

    async checkAuth({ commit }) {
      const token = localStorage.getItem('authToken')
      if (!token) return
      
      commit('SET_LOADING', true)
      try {
        const response = await api.get('/user')
        commit('SET_USER', response.data)
      } catch (error) {
        localStorage.removeItem('authToken')
        commit('LOGOUT')
      } finally {
        commit('SET_LOADING', false)
      }
    },

    logout({ commit }) {
      localStorage.removeItem('authToken')
      commit('LOGOUT')
    }
  },
  getters: {
    currentUser: state => state.user,
    isAuthenticated: state => state.isAuthenticated,
    authError: state => state.error,
    isLoading: state => state.loading,
    authError: state => state.error
  }
}