<template>
  <div class="auth-container">
    <div class="auth-illustration">
      <div>
        <h2 class="illustration-title">Get Started with Task Manager</h2>
        <p class="illustration-text">Join thousands organizing their work efficiently.</p>
        <img 
          src="/images/register-illustration.png" 
          alt="Registration Illustration"
          class="illustration-image"
          @error="showIllustration = false"
          v-if="showIllustration"
        >
        <div v-else class="illustration-placeholder">
          <svg viewBox="0 0 400 300" xmlns="http://www.w3.org/2000/svg">
            <rect width="100%" height="100%" fill="#e2e8f0"/>
            <text x="50%" y="50%" dominant-baseline="middle" text-anchor="middle" fill="#64748b">Task Management</text>
          </svg>
        </div>
      </div>
    </div>
    
    <div class="auth-form-container">
      <div class="auth-form">
        <h1 class="auth-title">Create your account</h1>
        
        <form @submit.prevent="handleRegister">
          <div class="form-group">
            <label for="name" class="form-label">Full Name</label>
            <input
              type="text"
              id="name"
              v-model="form.name"
              class="form-control"
              placeholder="John Doe"
              required
            >
          </div>
          
          <div class="form-group">
            <label for="email" class="form-label">Email address</label>
            <input
              type="email"
              id="email"
              v-model="form.email"
              class="form-control"
              placeholder="you@example.com"
              required
            >
          </div>
          
          <div class="form-group">
            <label for="password" class="form-label">Password</label>
            <input
              type="password"
              id="password"
              v-model="form.password"
              class="form-control"
              placeholder="••••••••"
              required
            >
            <div class="password-hint">Use at least 8 characters with numbers</div>
          </div>
          
          <div class="form-group">
            <label for="password_confirmation" class="form-label">Confirm Password</label>
            <input
              type="password"
              id="password_confirmation"
              v-model="form.password_confirmation"
              class="form-control"
              placeholder="••••••••"
              required
            >
          </div>
          
          <div class="terms-agreement">
            <input type="checkbox" id="terms" v-model="form.terms" required>
            <label for="terms">I agree to the <a href="#" class="terms-link">Terms</a> and <a href="#" class="terms-link">Privacy Policy</a></label>
          </div>
          
          <div class="error-message" v-if="error">{{ error }}</div>
          
          <button type="submit" class="btn btn-primary w-full">
            <span v-if="!loading">Create Account</span>
            <span v-else class="flex items-center justify-center">
              <svg class="animate-spin -ml-1 mr-3 h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
              </svg>
              Creating account...
            </span>
          </button>
        </form>
        
        <div class="divider">
          <span class="divider-text">Or continue with</span>
        </div>
        
        <div class="social-buttons">
          <button type="button" class="social-btn github">
            <svg class="social-icon" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M10 0C4.477 0 0 4.477 0 10c0 4.42 2.865 8.166 6.839 9.489.5.092.682-.217.682-.482 0-.237-.008-.866-.013-1.7-2.782.603-3.369-1.342-3.369-1.342-.454-1.155-1.11-1.462-1.11-1.462-.908-.62.069-.608.069-.608 1.003.07 1.531 1.03 1.531 1.03.892 1.529 2.341 1.087 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.11-4.555-4.943 0-1.091.39-1.984 1.029-2.683-.103-.253-.446-1.27.098-2.647 0 0 .84-.269 2.75 1.025A9.564 9.564 0 0110 4.844c.85.004 1.705.114 2.504.336 1.909-1.294 2.747-1.025 2.747-1.025.546 1.377.203 2.394.1 2.647.64.699 1.028 1.592 1.028 2.683 0 3.842-2.339 4.687-4.566 4.933.359.309.678.919.678 1.852 0 1.336-.012 2.415-.012 2.743 0 .267.18.578.688.48C17.14 18.163 20 14.418 20 10c0-5.523-4.477-10-10-10z" clip-rule="evenodd"/>
            </svg>
            GitHub
          </button>
          <button type="button" class="social-btn google">
            <svg class="social-icon" viewBox="0 0 24 24" fill="currentColor">
              <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4"/>
              <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/>
              <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05"/>
              <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/>
            </svg>
            Google
          </button>
        </div>
        
        <div class="auth-footer">
          Already have an account? <router-link to="/login" class="auth-link">Sign in</router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Register',
  data() {
    return {
      form: {
        name: '',
        email: '',
        password: '',
        password_confirmation: '',
        terms: false
      },
      loading: false,
      error: null,
      showIllustration: true
    }
  },
  methods: {
    async handleRegister() {
      this.loading = true
      this.error = null
      
      if (this.form.password !== this.form.password_confirmation) {
        this.error = 'Passwords do not match'
        this.loading = false
        return
      }
      
      try {
        await this.$store.dispatch('auth/register', this.form)
        this.$router.push('/dashboard')
      } catch (error) {
        this.error = error.response?.data?.message || 'Registration failed. Please try again.'
      } finally {
        this.loading = false
      }
    },
    registerWithGithub() {
      this.error = 'GitHub registration not implemented yet'
    },
    registerWithGoogle() {
      this.error = 'Google registration not implemented yet'
    }
  }
}
</script>

<style scoped>
/* Container Styles */
.auth-container {
  display: flex;
  min-height: 100vh;
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
  box-shadow: var(--shadow-lg);
}

/* Typography */
.auth-title {
  font-size: 1.75rem;
  font-weight: 700;
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
.password-hint {
  font-size: 0.75rem;
  color: var(--gray);
  margin-top: 0.5rem;
}

.terms-agreement {
  display: flex;
  align-items: center;
  margin: 1.5rem 0;
  font-size: 0.875rem;
  color: var(--gray);
}

.terms-agreement input {
  margin-right: 0.5rem;
}

.terms-link {
  color: var(--primary);
  text-decoration: none;
  font-weight: 500;
}

.terms-link:hover {
  text-decoration: underline;
}

/* Divider */
.divider {
  position: relative;
  margin: 1.5rem 0;
  text-align: center;
}

.divider-text {
  position: relative;
  display: inline-block;
  padding: 0 0.5rem;
  background-color: var(--white);
  color: var(--gray);
  font-size: 0.875rem;
}

.divider:before {
  content: "";
  position: absolute;
  top: 50%;
  left: 0;
  right: 0;
  height: 1px;
  background-color: #e2e8f0;
  z-index: -1;
}

/* Social Buttons */
.social-buttons {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 1rem;
  margin-bottom: 1.5rem;
}

.social-btn {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0.75rem;
  border: 1px solid #e2e8f0;
  border-radius: 0.375rem;
  background-color: transparent;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.2s ease;
}

.social-btn:hover {
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

/* Responsive */
@media (min-width: 768px) {
  .auth-illustration {
    display: flex;
  }
}
</style>