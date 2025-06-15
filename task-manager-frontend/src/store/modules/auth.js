import api from '@/utils/api'

export default {
  namespaced: true,
  state: () => ({
    user: null,
    error: null,
    isAuthenticated: false,
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
      state.isAuthenticated = false
    },
    SET_LOADING(state, isLoading) {
      state.loading = isLoading
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
        let errorMessage = 'Registration failed'
        if (error.response) {
          if (error.response.status === 422) {
            errorMessage = error.response.data.message || 'Validation error'
          } else if (error.response.status === 500) {
            errorMessage = 'Server error'
          }
        }
        commit('SET_ERROR', errorMessage)
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
        let errorMessage = 'Login failed'
        if (error.response) {
          if (error.response.status === 401) {
            errorMessage = 'Invalid credentials'
          } else if (error.response.status === 422) {
            errorMessage = 'Validation error'
          }
        }
        commit('SET_ERROR', errorMessage)
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
        const response = await api.get('/user', {
          headers: {
            Authorization: `Bearer ${token}`
          }
        })
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
    isLoading: state => state.loading
  }
}