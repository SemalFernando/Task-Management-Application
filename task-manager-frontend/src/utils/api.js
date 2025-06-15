import axios from 'axios';

const api = axios.create({
  baseURL: 'http://localhost:8000/api', // Adjust this to match your Laravel backend URL
});

// Add a request interceptor to include the auth token
api.interceptors.request.use((config) => {
  const token = localStorage.getItem('authToken');
  if (token) {
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

export default api;