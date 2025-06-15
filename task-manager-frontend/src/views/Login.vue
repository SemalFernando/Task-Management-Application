<template>
  <div class="auth-container">
    <div class="auth-illustration">
      <div>
        <h2 class="illustration-title">Task Management Simplified</h2>
        <p class="illustration-text">Organize, prioritize, and get things done.</p>
        <img 
          src="/images/login-illustration.png" 
          alt="Login Illustration"
          class="illustration-image"
          @error="showIllustration = false"
          v-if="showIllustration"
        >
        <div v-else class="illustration-placeholder">
          <svg viewBox="0 0 400 300" xmlns="http://www.w3.org/2000/svg">
            <rect width="100%" height="100%" fill="#e2e8f0"/>
            <text x="50%" y="50%" dominant-baseline="middle" text-anchor="middle" fill="#64748b">Illustration</text>
          </svg>
        </div>
      </div>
    </div>
    
    <div class="auth-form-container">
      <div class="auth-form">
        <h1 class="auth-title">Sign in to your account</h1>
        
        <form @submit.prevent="handleLogin">
          <div class="form-group">
            <label for="email" class="form-label">Email address</label>
            <input
              type="email"
              id="email"
              v-model.trim="form.email"
              class="form-control"
              :class="{ 'error-input': errors.email }"
              placeholder="you@example.com"
              @blur="validateEmail"
            >
            <span class="error-text" v-if="errors.email">{{ errors.email }}</span>
          </div>
          
          <div class="form-group">
            <label for="password" class="form-label">Password</label>
            <input
              type="password"
              id="password"
              v-model.trim="form.password"
              class="form-control"
              :class="{ 'error-input': errors.password }"
              placeholder="••••••••"
              @blur="validatePassword"
            >
            <span class="error-text" v-if="errors.password">{{ errors.password }}</span>
            <div class="remember-forgot">
              <div class="remember-me">
                <input type="checkbox" id="remember" v-model="form.remember">
                <label for="remember">Remember me</label>
              </div>
              <router-link to="/forgot-password" class="forgot-password">Forgot password?</router-link>
            </div>
          </div>
          
          <div class="error-message" v-if="authError">{{ authError }}</div>
          
          <button type="submit" class="login-button" :disabled="loading || !isFormValid">
            <span v-if="!loading">Sign in</span>
            <span v-else class="loading-spinner">
              <svg class="spinner" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
              </svg>
              Signing in...
            </span>
          </button>
        </form>
        
        <div class="divider">
          <div class="divider-line"></div>
          <div class="divider-text">Or continue with</div>
        </div>
        
        <div class="social-buttons">
          <button type="button" class="social-button github" @click="loginWithGithub">
            <svg class="social-icon" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true">
              <path fill-rule="evenodd" d="M10 0C4.477 0 0 4.477 0 10c0 4.42 2.865 8.166 6.839 9.489.5.092.682-.217.682-.482 0-.237-.008-.866-.013-1.7-2.782.603-3.369-1.342-3.369-1.342-.454-1.155-1.11-1.462-1.11-1.462-.908-.62.069-.608.069-.608 1.003.07 1.531 1.03 1.531 1.03.892 1.529 2.341 1.087 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.11-4.555-4.943 0-1.091.39-1.984 1.029-2.683-.103-.253-.446-1.27.098-2.647 0 0 .84-.269 2.75 1.025A9.564 9.564 0 0110 4.844c.85.004 1.705.114 2.504.336 1.909-1.294 2.747-1.025 2.747-1.025.546 1.377.203 2.394.1 2.647.64.699 1.028 1.592 1.028 2.683 0 3.842-2.339 4.687-4.566 4.933.359.309.678.919.678 1.852 0 1.336-.012 2.415-.012 2.743 0 .267.18.578.688.48C17.14 18.163 20 14.418 20 10c0-5.523-4.477-10-10-10z" clip-rule="evenodd" />
            </svg>
            GitHub
          </button>
          <button type="button" class="social-button google" @click="loginWithGoogle">
            <svg class="social-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
              <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4"/>
              <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/>
              <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05"/>
              <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/>
            </svg>
            Google
          </button>
        </div>
        
        <div class="auth-footer">
          Don't have an account? <router-link to="/register" class="auth-link">Sign up</router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex';

export default {
  data() {
    return {
      form: {
        email: '',
        password: '',
        remember: false
      },
      errors: {
        email: '',
        password: ''
      },
      showIllustration: true
    };
  },
  computed: {
    ...mapGetters('auth', ['loading', 'error']),
    authError() {
      return this.error;
    },
    isFormValid() {
      return this.form.email && this.form.password && 
             !this.errors.email && !this.errors.password;
    }
  },
  methods: {
    ...mapActions('auth', ['login']),
    
    async handleLogin() {
      if (!this.validateForm()) return;
      
      try {
        await this.login({
          email: this.form.email,
          password: this.form.password,
          remember: this.form.remember
        });
        
        // Redirect to dashboard or intended route
        const redirectTo = this.$route.query.redirect || '/dashboard';
        this.$router.push(redirectTo);
      } catch (error) {
        // Error is handled by the store
        if (error.response && error.response.status === 422) {
          // Handle validation errors from server
          const serverErrors = error.response.data.errors;
          for (const field in serverErrors) {
            if (this.errors.hasOwnProperty(field)) {
              this.errors[field] = serverErrors[field][0];
            }
          }
        }
      }
    },
    
    validateForm() {
      let isValid = true;
      
      if (!this.form.email) {
        this.errors.email = 'Email is required';
        isValid = false;
      } else if (!this.isValidEmail(this.form.email)) {
        this.errors.email = 'Please enter a valid email';
        isValid = false;
      }
      
      if (!this.form.password) {
        this.errors.password = 'Password is required';
        isValid = false;
      } else if (this.form.password.length < 8) {
        this.errors.password = 'Password must be at least 8 characters';
        isValid = false;
      }
      
      return isValid;
    },
    
    validateEmail() {
      if (!this.form.email) {
        this.errors.email = 'Email is required';
      } else if (!this.isValidEmail(this.form.email)) {
        this.errors.email = 'Please enter a valid email';
      } else {
        this.errors.email = '';
      }
    },
    
    validatePassword() {
      if (!this.form.password) {
        this.errors.password = 'Password is required';
      } else if (this.form.password.length < 8) {
        this.errors.password = 'Password must be at least 8 characters';
      } else {
        this.errors.password = '';
      }
    },
    
    isValidEmail(email) {
      const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      return re.test(email);
    },
    
    loginWithGithub() {
      // Implement GitHub OAuth redirect
      window.location.href = '/api/auth/github';
    },
    
    loginWithGoogle() {
      // Implement Google OAuth redirect
      window.location.href = '/api/auth/google';
    }
  },
  mounted() {
    // Clear any existing errors when component mounts
    this.$store.commit('auth/SET_ERROR', null);
  }
};
</script>

<style scoped>
/* Color Variables */
:root {
  --primary: #4361ee;
  --primary-dark: #3a56d4;
  --primary-light: #edf2ff;
  --white: #ffffff;
  --light-gray: #f8f9fa;
  --gray: #6c757d;
  --dark-gray: #343a40;
  --error: #ef4444;
}

/* Container Styles */
.auth-container {
  display: flex;
  min-height: 100vh;
  background-color: var(--white);
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
  line-height: 1.5;
  color: var(--dark-gray);
}

.auth-illustration {
  flex: 1;
  background-color: var(--primary-light);
  display: none;
  align-items: center;
  justify-content: center;
  padding: 2rem;
}

.auth-form-container {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 2rem;
}

.auth-form {
  width: 100%;
  max-width: 400px;
  padding: 2.5rem;
  background-color: var(--white);
  border-radius: 0.5rem;
  box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.auth-form:hover {
  transform: translateY(-2px);
  box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
}

/* Typography */
.auth-title {
  font-size: 1.75rem;
  font-weight: 700;
  color: var(--dark-gray);
  margin-bottom: 1.5rem;
  text-align: center;
}

.illustration-title {
  font-size: 1.875rem;
  font-weight: 700;
  color: var(--primary);
  margin-bottom: 1rem;
}

.illustration-text {
  color: var(--gray);
  margin-bottom: 2rem;
}

/* Form Elements */
.form-group {
  margin-bottom: 1.5rem;
}

.form-label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: 500;
  color: var(--dark-gray);
}

.form-control {
  width: 100%;
  padding: 0.75rem 1rem;
  border: 1px solid #ced4da;
  border-radius: 0.375rem;
  font-size: 1rem;
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}

.form-control:focus {
  outline: 0;
  border-color: var(--primary);
  box-shadow: 0 0 0 0.2rem rgba(67, 97, 238, 0.25);
}

.error-message {
  color: var(--error);
  font-size: 0.875rem;
  margin-bottom: 1rem;
  text-align: center;
}

/* Remember Me & Forgot Password */
.remember-forgot {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 0.5rem;
  font-size: 0.875rem;
}

.remember-me {
  display: flex;
  align-items: center;
}

.remember-me input {
  margin-right: 0.5rem;
}

.forgot-password {
  color: var(--primary);
  text-decoration: none;
  font-weight: 500;
}

.forgot-password:hover {
  text-decoration: underline;
}

/* Login Button */
.login-button {
  width: 100%;
  padding: 0.75rem;
  background-color: var(--primary);
  color: var(--white);
  border: none;
  border-radius: 0.375rem;
  font-weight: 500;
  cursor: pointer;
  transition: background-color 0.2s ease;
  margin-top: 0.5rem;
}

.login-button:hover:not(:disabled) {
  background-color: var(--primary-dark);
}

.login-button:disabled {
  opacity: 0.7;
  cursor: not-allowed;
}

.loading-spinner {
  display: flex;
  align-items: center;
  justify-content: center;
}

.spinner {
  animation: spin 1s linear infinite;
  width: 1.25rem;
  height: 1.25rem;
  margin-right: 0.5rem;
}

@keyframes spin {
  from { transform: rotate(0deg); }
  to { transform: rotate(360deg); }
}

/* Divider */
.divider {
  position: relative;
  margin: 1.5rem 0;
}

.divider-line {
  position: absolute;
  top: 50%;
  width: 100%;
  height: 1px;
  background-color: #e2e8f0;
  z-index: 1;
}

.divider-text {
  position: relative;
  z-index: 2;
  display: inline-block;
  padding: 0 0.5rem;
  background-color: var(--white);
  color: var(--gray);
  font-size: 0.875rem;
  left: 50%;
  transform: translateX(-50%);
}

/* Social Buttons */
.social-buttons {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 1rem;
  margin-bottom: 1.5rem;
}

.social-button {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0.75rem;
  border: 1px solid #e2e8f0;
  border-radius: 0.375rem;
  background-color: transparent;
  color: var(--dark-gray);
  font-weight: 500;
  cursor: pointer;
  transition: all 0.2s ease;
}

.social-button:hover {
  background-color: var(--primary-light);
  border-color: var(--primary);
}

.social-icon {
  width: 1.25rem;
  height: 1.25rem;
  margin-right: 0.5rem;
}

/* Footer */
.auth-footer {
  margin-top: 1.5rem;
  text-align: center;
  color: var(--gray);
  font-size: 0.875rem;
}

.auth-link {
  color: var(--primary);
  text-decoration: none;
  font-weight: 500;
}

.auth-link:hover {
  text-decoration: underline;
}

/* Illustration */
.illustration-image {
  width: 100%;
  max-width: 400px;
  height: auto;
  border-radius: 0.5rem;
}

.illustration-placeholder {
  width: 100%;
  height: 200px;
  background-color: #e2e8f0;
  border-radius: 0.5rem;
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--gray);
}

.illustration-placeholder svg {
  width: 100%;
  height: 100%;
}

/* Responsive Design */
@media (min-width: 768px) {
  .auth-illustration {
    display: flex;
  }
}

.error-input {
  border-color: var(--error) !important;
}

.error-text {
  color: var(--error);
  font-size: 0.75rem;
  margin-top: 0.25rem;
  display: block;
}
</style>