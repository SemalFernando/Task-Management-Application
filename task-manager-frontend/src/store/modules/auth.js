// src/store/modules/auth.js
const state = {
  user: null,
  isAuthenticated: false,
  loading: false,
  error: null
};

const mutations = {
  SET_USER(state, user) {
    state.user = user;
    state.isAuthenticated = true;
    state.error = null;
  },
  SET_LOADING(state, loading) {
    state.loading = loading;
  },
  SET_ERROR(state, error) {
    state.error = error;
  },
  LOGOUT(state) {
    state.user = null;
    state.isAuthenticated = false;
  }
};

const actions = {
  async login({ commit }, credentials) {
    commit('SET_LOADING', true);
    try {
      const response = await api.post('/login', credentials);
      localStorage.setItem('authToken', response.data.token);
      commit('SET_USER', response.data.user);
      return response.data.user;
    } catch (error) {
      let errorMessage = 'Login failed';
      if (error.response) {
        if (error.response.status === 422) {
          errorMessage = error.response.data.message || 'Validation error';
        } else if (error.response.status === 401) {
          errorMessage = 'Invalid credentials';
        }
      }
      commit('SET_ERROR', errorMessage);
      throw error;
    } finally {
      commit('SET_LOADING', false);
    }
  },

  async register({ commit }, userData) {
    commit('SET_LOADING', true);
    try {
      const response = await api.post('/register', userData);
      localStorage.setItem('authToken', response.data.token);
      commit('SET_USER', response.data.user);
      return response.data.user;
    } catch (error) {
      let errorMessage = 'Registration failed';
      if (error.response && error.response.status === 422) {
        errorMessage = error.response.data.message || 'Validation error';
      }
      commit('SET_ERROR', errorMessage);
      throw error;
    } finally {
      commit('SET_LOADING', false);
    }
  },

  async checkAuth({ commit }) {
    const token = localStorage.getItem('authToken');
    if (token) {
      commit('SET_LOADING', true);
      try {
        const response = await api.get('/user'); // Your endpoint to get user data
        commit('SET_USER', response.data);
      } catch (error) {
        localStorage.removeItem('authToken');
        commit('LOGOUT');
      } finally {
        commit('SET_LOADING', false);
      }
    }
  },

  logout({ commit }) {
    localStorage.removeItem('authToken');
    commit('LOGOUT');
  }
};

const getters = {
  currentUser: state => state.user,
  isAuthenticated: state => state.isAuthenticated,
  authLoading: state => state.loading,
  authError: state => state.error
};

export default {
  namespaced: true,
  state,
  mutations,
  actions,
  getters
};