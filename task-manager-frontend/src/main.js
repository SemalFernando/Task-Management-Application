// src/main.js
import { createApp } from 'vue'
import App from './App.vue';
import router from './router';
import store from './store'; // This will now be Pinia instead of Vuex
import './assets/main.css' // Adjust path to your CSS file

const app = createApp(App)
app.use(router)
app.use(store) // Only if you keep Vuex, but I recommend Pinia (see below)
app.mount('#app')