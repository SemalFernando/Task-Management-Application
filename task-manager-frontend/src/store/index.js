// src/store/index.js
import { createStore } from 'vuex';
import api from '@/utils/api';

export default createStore({
  state: {
    user: null,
    isAuthenticated: false
  },
  mutations: {
    setUser(state, user) {
      state.user = user;
      state.isAuthenticated = true;
    },
    logout(state) {
      state.user = null;
      state.isAuthenticated = false;
    }
  },
  actions: {
    async checkAuth({ commit }) {
      try {
        const token = localStorage.getItem('authToken');
        if (token) {
          const response = await api.get('/user');
          commit('setUser', response.data);
        }
      } catch (error) {
        localStorage.removeItem('authToken');
      }
    },
    logout({ commit }) {
      localStorage.removeItem('authToken');
      commit('logout');
    }
  }
});