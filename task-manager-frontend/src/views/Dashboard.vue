<template>
  <div class="dashboard-container">
    <!-- Sidebar Navigation -->
    <aside class="sidebar">
      <div class="sidebar-header">
        <h2 class="app-logo">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 inline mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
          </svg>
          Task Manager
        </h2>
      </div>
      
      <nav class="sidebar-nav">
        <router-link to="/dashboard" class="nav-item active">
          <svg class="nav-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
          </svg>
          <span>Dashboard</span>
        </router-link>
        
        <router-link to="/tasks" class="nav-item">
          <svg class="nav-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
          </svg>
          <span>Tasks</span>
          <span class="badge">{{ summary.totalTasks }}</span>
        </router-link>
        
        <router-link to="/categories" class="nav-item">
          <svg class="nav-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z" />
          </svg>
          <span>Categories</span>
        </router-link>

        <router-link to="/calendar" class="nav-item">
          <svg class="nav-icon" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
          </svg>
          <span>Calendar</span>
        </router-link>
      </nav>
      
      <div class="sidebar-footer">
        <div class="user-profile">
          <div class="avatar">
            <img src="https://ui-avatars.com/api/?name=John+Doe&background=3b82f6&color=fff" alt="John Doe">
          </div>
          <div class="user-info">
            <span class="user-name">John Doe</span>
            <span class="user-email">john@example.com</span>
          </div>
        </div>
        <button class="logout-btn" @click="handleLogout" title="Logout">
          <svg xmlns="http://www.w3.org/2000/svg" class="logout-icon" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
          </svg>
        </button>
      </div>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
      <header class="main-header">
        <div>
          <h1 class="page-title">Dashboard</h1>
          <p class="page-subtitle">Welcome back! Here's what's happening today.</p>
        </div>
        <button class="btn btn-primary" @click="showTaskForm = true">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6" />
          </svg>
          Add Task
        </button>
      </header>
      
      <!-- Summary Cards -->
      <div class="summary-cards">
        <div class="card">
          <div class="card-body">
            <div class="card-icon bg-blue-100 text-blue-600">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
              </svg>
            </div>
            <h3 class="card-title">Total Tasks</h3>
            <p class="card-value">{{ summary.totalTasks }}</p>
            <p class="card-change positive">+2 from last week</p>
          </div>
        </div>
        
        <div class="card">
          <div class="card-body">
            <div class="card-icon bg-green-100 text-green-600">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
              </svg>
            </div>
            <h3 class="card-title">Completed</h3>
            <p class="card-value">{{ summary.completedTasks }}</p>
            <p class="card-change positive">+1 from last week</p>
          </div>
        </div>
        
        <div class="card">
          <div class="card-body">
            <div class="card-icon bg-yellow-100 text-yellow-600">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
            </div>
            <h3 class="card-title">Pending</h3>
            <p class="card-value">{{ summary.pendingTasks }}</p>
            <p class="card-change neutral">No change</p>
          </div>
        </div>
        
        <div class="card">
          <div class="card-body">
            <div class="card-icon bg-red-100 text-red-600">
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
              </svg>
            </div>
            <h3 class="card-title">Overdue</h3>
            <p class="card-value">{{ summary.overdueTasks }}</p>
            <p class="card-change negative">-1 from last week</p>
          </div>
        </div>
      </div>
      
      <!-- Task List -->
      <div class="task-list-container">
        <div class="task-list-header">
          <h2 class="section-title">My Tasks</h2>
          <div class="task-filters">
            <div class="filter-group">
              <label for="category-filter" class="filter-label">Category</label>
              <select id="category-filter" class="filter-select" v-model="filters.category">
                <option value="">All Categories</option>
                <option v-for="category in categories" :key="category.id" :value="category.id">
                  {{ category.name }}
                </option>
              </select>
            </div>
            <div class="filter-group">
              <label for="status-filter" class="filter-label">Status</label>
              <select id="status-filter" class="filter-select" v-model="filters.status">
                <option value="">All Status</option>
                <option value="pending">Pending</option>
                <option value="in_progress">In Progress</option>
                <option value="completed">Completed</option>
              </select>
            </div>
            <div class="filter-group">
              <label for="priority-filter" class="filter-label">Priority</label>
              <select id="priority-filter" class="filter-select" v-model="filters.priority">
                <option value="">All Priorities</option>
                <option value="high">High</option>
                <option value="medium">Medium</option>
                <option value="low">Low</option>
              </select>
            </div>
          </div>
        </div>
        
        <div class="task-list">
          <div 
            class="task-item" 
            v-for="task in filteredTasks" 
            :key="task.id"
            :class="{ 
              'completed': task.status === 'completed',
              'priority-high': task.priority === 'high',
              'priority-medium': task.priority === 'medium',
              'priority-low': task.priority === 'low'
            }"
          >
            <div class="task-checkbox">
              <input 
                type="checkbox" 
                :checked="task.status === 'completed'" 
                @change="toggleTaskStatus(task)"
              >
            </div>
            <div class="task-content">
              <div class="task-header">
                <h3 class="task-title">{{ task.title }}</h3>
                <div class="task-priority" :class="task.priority">
                  {{ task.priority }}
                </div>
              </div>
              <p class="task-description">{{ task.description }}</p>
              <div class="task-meta">
                <span 
                  class="task-category" 
                  :style="{ backgroundColor: getCategoryColor(task.category_id), color: getContrastColor(getCategoryColor(task.category_id)) }"
                >
                  {{ getCategoryName(task.category_id) }}
                </span>
                <span class="task-due-date" :class="{ 'overdue': isOverdue(task.due_date) && task.status !== 'completed' }">
                  <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 mr-1" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                  </svg>
                  {{ formatDate(task.due_date) }}
                  <span v-if="isOverdue(task.due_date) && task.status !== 'completed'" class="overdue-badge">Overdue</span>
                </span>
              </div>
              <div class="task-progress">
                <div class="progress-bar">
                  <div class="progress" :style="{ width: getProgressWidth(task) }"></div>
                </div>
                <span class="progress-text">{{ getProgressText(task) }}</span>
              </div>
            </div>
            <div class="task-actions">
              <button class="action-btn edit" @click="editTask(task)" title="Edit">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                </svg>
              </button>
              <button class="action-btn delete" @click="confirmDeleteTask(task)" title="Delete">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                </svg>
              </button>
            </div>
          </div>
        </div>

        <div v-if="filteredTasks.length === 0" class="empty-state">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
          </svg>
          <h3>No tasks found</h3>
          <p>Try adjusting your filters or create a new task</p>
          <button class="btn btn-primary mt-4" @click="showTaskForm = true">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6" />
            </svg>
            Add Task
          </button>
        </div>
      </div>
    </main>

    <!-- Task Modal -->
    <div v-if="showTaskForm" class="modal-overlay">
      <div class="modal">
        <div class="modal-header">
          <h3>{{ editingTask ? 'Edit Task' : 'Add New Task' }}</h3>
          <button class="modal-close" @click="closeModal">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>
        <div class="modal-body">
          <form @submit.prevent="saveTask">
            <div class="form-group">
              <label for="task-title">Title</label>
              <input id="task-title" type="text" v-model="currentTask.title" required>
            </div>
            <div class="form-group">
              <label for="task-description">Description</label>
              <textarea id="task-description" v-model="currentTask.description" rows="3"></textarea>
            </div>
            <div class="form-row">
              <div class="form-group">
                <label for="task-category">Category</label>
                <select id="task-category" v-model="currentTask.category_id" required>
                  <option v-for="category in categories" :key="category.id" :value="category.id">
                    {{ category.name }}
                  </option>
                </select>
              </div>
              <div class="form-group">
                <label for="task-priority">Priority</label>
                <select id="task-priority" v-model="currentTask.priority" required>
                  <option value="high">High</option>
                  <option value="medium">Medium</option>
                  <option value="low">Low</option>
                </select>
              </div>
            </div>
            <div class="form-row">
              <div class="form-group">
                <label for="task-due-date">Due Date</label>
                <input id="task-due-date" type="date" v-model="currentTask.due_date" required>
              </div>
              <div class="form-group">
                <label for="task-status">Status</label>
                <select id="task-status" v-model="currentTask.status" required>
                  <option value="pending">Pending</option>
                  <option value="in_progress">In Progress</option>
                  <option value="completed">Completed</option>
                </select>
              </div>
            </div>
            <div class="form-actions">
              <button type="button" class="btn btn-secondary" @click="closeModal">Cancel</button>
              <button type="submit" class="btn btn-primary">{{ editingTask ? 'Update' : 'Save' }} Task</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Dashboard',
  data() {
    return {
      showTaskForm: false,
      editingTask: null,
      currentTask: this.getDefaultTask(),
      filters: {
        category: '',
        status: '',
        priority: ''
      },
      tasks: [
        {
          id: 1,
          title: 'Complete project proposal',
          description: 'Finish the client project proposal document',
          due_date: '2023-06-15',
          status: 'pending',
          priority: 'high',
          category_id: 1,
          progress: 65
        },
        {
          id: 2,
          title: 'Team meeting',
          description: 'Weekly team sync meeting',
          due_date: '2023-06-10',
          status: 'completed',
          priority: 'medium',
          category_id: 1,
          progress: 100
        },
        {
          id: 3,
          title: 'Buy groceries',
          description: 'Milk, eggs, bread, fruits',
          due_date: '2023-06-08',
          status: 'pending',
          priority: 'low',
          category_id: 2,
          progress: 20
        },
        {
          id: 4,
          title: 'Fix critical bug',
          description: 'Investigate and fix the production bug',
          due_date: '2023-06-05',
          status: 'in_progress',
          priority: 'high',
          category_id: 3,
          progress: 45
        }
      ],
      categories: [
        { id: 1, name: 'Work', color: '#3b82f6' },
        { id: 2, name: 'Personal', color: '#10b981' },
        { id: 3, name: 'Urgent', color: '#ef4444' },
        { id: 4, name: 'Shopping', color: '#8b5cf6' }
      ]
    }
  },
  computed: {
    summary() {
      return {
        totalTasks: this.tasks.length,
        completedTasks: this.tasks.filter(t => t.status === 'completed').length,
        pendingTasks: this.tasks.filter(t => t.status === 'pending').length,
        overdueTasks: this.tasks.filter(t => this.isOverdue(t.due_date) && t.status !== 'completed').length
      }
    },
    filteredTasks() {
      return this.tasks.filter(task => {
        const categoryMatch = this.filters.category ? task.category_id == this.filters.category : true
        const statusMatch = this.filters.status ? task.status === this.filters.status : true
        const priorityMatch = this.filters.priority ? task.priority === this.filters.priority : true
        return categoryMatch && statusMatch && priorityMatch
      }).sort((a, b) => {
        // Sort by priority (high first) then by due date (earlier first)
        const priorityOrder = { high: 1, medium: 2, low: 3 }
        if (priorityOrder[a.priority] !== priorityOrder[b.priority]) {
          return priorityOrder[a.priority] - priorityOrder[b.priority]
        }
        return new Date(a.due_date) - new Date(b.due_date)
      })
    }
  },
  methods: {
    getDefaultTask() {
      return {
        id: null,
        title: '',
        description: '',
        due_date: new Date().toISOString().split('T')[0],
        status: 'pending',
        priority: 'medium',
        category_id: 1,
        progress: 0
      }
    },
    toggleTaskStatus(task) {
      task.status = task.status === 'completed' ? 'pending' : 'completed'
      task.progress = task.status === 'completed' ? 100 : 0
    },
    editTask(task) {
      this.editingTask = task
      this.currentTask = { ...task }
      this.showTaskForm = true
    },
    saveTask() {
      if (this.editingTask) {
        // Update existing task
        const index = this.tasks.findIndex(t => t.id === this.editingTask.id)
        if (index !== -1) {
          this.tasks.splice(index, 1, { ...this.currentTask })
        }
      } else {
        // Add new task
        const newId = Math.max(...this.tasks.map(t => t.id), 0) + 1
        this.tasks.push({
          ...this.currentTask,
          id: newId
        })
      }
      this.closeModal()
    },
    closeModal() {
      this.showTaskForm = false
      this.editingTask = null
      this.currentTask = this.getDefaultTask()
    },
    confirmDeleteTask(task) {
      if (confirm(`Are you sure you want to delete "${task.title}"?`)) {
        this.deleteTask(task.id)
      }
    },
    deleteTask(taskId) {
      this.tasks = this.tasks.filter(task => task.id !== taskId)
    },
    getCategoryName(categoryId) {
      const category = this.categories.find(c => c.id === categoryId)
      return category ? category.name : 'Uncategorized'
    },
    getCategoryColor(categoryId) {
      const category = this.categories.find(c => c.id === categoryId)
      return category ? category.color : '#9ca3af'
    },
    getContrastColor(hexColor) {
      // Convert hex to RGB
      const r = parseInt(hexColor.substr(1, 2), 16)
      const g = parseInt(hexColor.substr(3, 2), 16)
      const b = parseInt(hexColor.substr(5, 2), 16)
      
      // Calculate luminance
      const luminance = (0.299 * r + 0.587 * g + 0.114 * b) / 255
      
      // Return black for light colors, white for dark colors
      return luminance > 0.5 ? '#000000' : '#ffffff'
    },
    formatDate(dateString) {
      const options = { year: 'numeric', month: 'short', day: 'numeric' }
      return new Date(dateString).toLocaleDateString(undefined, options)
    },
    isOverdue(dateString) {
      return new Date(dateString) < new Date()
    },
    getProgressWidth(task) {
      if (task.status === 'completed') return '100%'
      return `${task.progress}%`
    },
    getProgressText(task) {
      if (task.status === 'completed') return 'Completed'
      return `${task.progress}% complete`
    },
    handleLogout() {
      // Implement logout logic
      this.$router.push('/login')
    }
  }
}
</script>

<style scoped>
/* Color Variables */
:root {
  --primary: #3b82f6;
  --primary-light: #eff6ff;
  --primary-dark: #2563eb;
  --secondary: #64748b;
  --success: #10b981;
  --danger: #ef4444;
  --warning: #f59e0b;
  --info: #06b6d4;
  --light: #f8fafc;
  --dark: #1e293b;
  --gray: #64748b;
  --light-gray: #f1f5f9;
  --dark-gray: #334155;
  --white: #ffffff;
  --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
  --shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
  --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
}

/* Base Styles */
* {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

body {
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
  line-height: 1.5;
  color: var(--dark);
}

/* Utility Classes */
.bg-blue-100 { background-color: #dbeafe; }
.text-blue-600 { color: #2563eb; }
.bg-green-100 { background-color: #d1fae5; }
.text-green-600 { color: #059669; }
.bg-yellow-100 { background-color: #fef3c7; }
.text-yellow-600 { color: #d97706; }
.bg-red-100 { background-color: #fee2e2; }
.text-red-600 { color: #dc2626; }
.mt-4 { margin-top: 1rem; }
.mr-2 { margin-right: 0.5rem; }
.h-5 { height: 1.25rem; }
.w-5 { width: 1.25rem; }
.h-6 { height: 1.5rem; }
.w-6 { width: 1.5rem; }
.inline { display: inline; }

/* Dashboard Container */
.dashboard-container {
  display: flex;
  min-height: 100vh;
  background-color: var(--light-gray);
}

/* Sidebar Styles */
.sidebar {
  width: 280px;
  background-color: var(--white);
  border-right: 1px solid #e2e8f0;
  display: flex;
  flex-direction: column;
  padding: 1.5rem 0;
  position: fixed;
  height: 100vh;
  z-index: 10;
}

.sidebar-header {
  padding: 0 1.5rem 1.5rem;
  border-bottom: 1px solid #e2e8f0;
}

.app-logo {
  font-size: 1.5rem;
  font-weight: 700;
  color: var(--primary);
  display: flex;
  align-items: center;
}

.sidebar-nav {
  flex: 1;
  padding: 1.5rem 0;
  overflow-y: auto;
}

.nav-item {
  display: flex;
  align-items: center;
  padding: 0.75rem 1.5rem;
  color: var(--gray);
  text-decoration: none;
  transition: all 0.2s;
  position: relative;
}

.nav-item:hover {
  background-color: var(--primary-light);
  color: var(--primary);
}

.nav-item.active {
  background-color: var(--primary-light);
  color: var(--primary);
  border-right: 3px solid var(--primary);
}

.nav-icon {
  width: 1.25rem;
  height: 1.25rem;
  margin-right: 0.75rem;
}

.badge {
  background-color: var(--primary);
  color: white;
  border-radius: 9999px;
  padding: 0.25rem 0.5rem;
  font-size: 0.75rem;
  margin-left: auto;
}

.sidebar-footer {
  padding: 1.5rem;
  border-top: 1px solid #e2e8f0;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.user-profile {
  display: flex;
  align-items: center;
  flex: 1;
}

.avatar {
  width: 2.5rem;
  height: 2.5rem;
  border-radius: 50%;
  margin-right: 0.75rem;
  overflow: hidden;
}

.avatar img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.user-info {
  display: flex;
  flex-direction: column;
  flex: 1;
  min-width: 0;
}

.user-name {
  font-weight: 600;
  color: var(--dark-gray);
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.user-email {
  font-size: 0.75rem;
  color: var(--gray);
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.logout-btn {
  background: none;
  border: none;
  cursor: pointer;
  color: var(--gray);
  transition: color 0.2s;
  padding: 0.5rem;
  border-radius: 0.375rem;
}

.logout-btn:hover {
  background-color: var(--light-gray);
  color: var(--primary);
}

.logout-icon {
  width: 1.25rem;
  height: 1.25rem;
}

/* Main Content Styles */
.main-content {
  flex: 1;
  padding: 2rem;
  margin-left: 280px;
  min-height: 100vh;
}

.main-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-bottom: 2rem;
}

.page-title {
  font-size: 1.75rem;
  font-weight: 700;
  color: var(--dark-gray);
  margin-bottom: 0.5rem;
}

.page-subtitle {
  color: var(--gray);
  font-size: 0.875rem;
}

/* Button Styles */
.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: 0.5rem 1rem;
  border-radius: 0.375rem;
  font-weight: 500;
  transition: all 0.2s;
  cursor: pointer;
  border: 1px solid transparent;
}

.btn-primary {
  background-color: var(--primary);
  color: white;
}

.btn-primary:hover {
  background-color: var(--primary-dark);
}

.btn-secondary {
  background-color: var(--light);
  color: var(--dark);
  border-color: #e2e8f0;
}

.btn-secondary:hover {
  background-color: #f1f5f9;
}

/* Summary Cards */
.summary-cards {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 1.5rem;
  margin-bottom: 2rem;
}

.card {
  background-color: var(--white);
  border-radius: 0.5rem;
  box-shadow: var(--shadow-sm);
  transition: transform 0.2s, box-shadow 0.2s;
}

.card:hover {
  transform: translateY(-2px);
  box-shadow: var(--shadow);
}

.card-body {
  padding: 1.5rem;
  position: relative;
}

.card-icon {
  width: 2.5rem;
  height: 2.5rem;
  border-radius: 0.375rem;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 1rem;
}

.card-icon svg {
  width: 1.25rem;
  height: 1.25rem;
}

.card-title {
  font-size: 0.875rem;
  color: var(--gray);
  margin-bottom: 0.5rem;
}

.card-value {
  font-size: 1.5rem;
  font-weight: 700;
  color: var(--dark-gray);
  margin-bottom: 0.25rem;
}

.card-change {
  font-size: 0.75rem;
}

.card-change.positive {
  color: var(--success);
}

.card-change.negative {
  color: var(--danger);
}

.card-change.neutral {
  color: var(--gray);
}

/* Task List */
.task-list-container {
  background-color: var(--white);
  border-radius: 0.5rem;
  box-shadow: var(--shadow-sm);
  padding: 1.5rem;
}

.task-list-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 1.5rem;
}

.section-title {
  font-size: 1.25rem;
  font-weight: 600;
  color: var(--dark-gray);
}

.task-filters {
  display: flex;
  gap: 1rem;
}

.filter-group {
  display: flex;
  flex-direction: column;
}

.filter-label {
  font-size: 0.75rem;
  color: var(--gray);
  margin-bottom: 0.25rem;
  font-weight: 500;
}

.filter-select {
  padding: 0.5rem 1rem;
  border: 1px solid #e2e8f0;
  border-radius: 0.375rem;
  background-color: var(--white);
  font-size: 0.875rem;
  min-width: 120px;
}

.task-list {
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
}

.task-item {
  display: flex;
  align-items: flex-start;
  padding: 1rem;
  border-radius: 0.375rem;
  transition: all 0.2s;
  border: 1px solid #e2e8f0;
  position: relative;
}

.task-item:hover {
  box-shadow: var(--shadow-sm);
}

.task-item.completed {
  opacity: 0.8;
  background-color: #f8fafc;
}

.task-item.priority-high {
  border-left: 3px solid var(--danger);
}

.task-item.priority-medium {
  border-left: 3px solid var(--warning);
}

.task-item.priority-low {
  border-left: 3px solid var(--success);
}

.task-checkbox {
  margin-right: 1rem;
  margin-top: 0.25rem;
}

.task-checkbox input {
  width: 1.25rem;
  height: 1.25rem;
  border-radius: 0.25rem;
  border: 1px solid #e2e8f0;
  cursor: pointer;
}

.task-content {
  flex: 1;
}

.task-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 0.25rem;
}

.task-title {
  font-weight: 600;
  color: var(--dark-gray);
  margin-bottom: 0.25rem;
}

.task-item.completed .task-title {
  text-decoration: line-through;
  color: var(--gray);
}

.task-priority {
  font-size: 0.75rem;
  padding: 0.25rem 0.5rem;
  border-radius: 9999px;
  text-transform: capitalize;
}

.task-priority.high {
  background-color: #fee2e2;
  color: var(--danger);
}

.task-priority.medium {
  background-color: #fef3c7;
  color: var(--warning);
}

.task-priority.low {
  background-color: #d1fae5;
  color: var(--success);
}

.task-description {
  color: var(--gray);
  font-size: 0.875rem;
  margin-bottom: 0.5rem;
}

.task-meta {
  display: flex;
  gap: 1rem;
  font-size: 0.75rem;
  margin-bottom: 0.5rem;
}

.task-category {
  padding: 0.25rem 0.5rem;
  border-radius: 9999px;
  font-weight: 500;
}

.task-due-date {
  display: flex;
  align-items: center;
  color: var(--gray);
}

.task-due-date.overdue {
  color: var(--danger);
}

.overdue-badge {
  background-color: #fee2e2;
  color: var(--danger);
  padding: 0.125rem 0.375rem;
  border-radius: 9999px;
  font-size: 0.625rem;
  margin-left: 0.25rem;
  font-weight: 500;
}

.task-progress {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  margin-top: 0.5rem;
}

.progress-bar {
  flex: 1;
  height: 0.375rem;
  background-color: #e2e8f0;
  border-radius: 9999px;
  overflow: hidden;
}

.progress {
  height: 100%;
  background-color: var(--primary);
  border-radius: 9999px;
  transition: width 0.3s ease;
}

.progress-text {
  font-size: 0.75rem;
  color: var(--gray);
  min-width: 5rem;
}

.task-actions {
  display: flex;
  gap: 0.5rem;
  margin-left: 1rem;
}

.action-btn {
  padding: 0.5rem;
  border-radius: 0.375rem;
  background: none;
  border: none;
  cursor: pointer;
  transition: background-color 0.2s;
  display: flex;
  align-items: center;
  justify-content: center;
}

.action-btn:hover {
  background-color: #e2e8f0;
}

.action-btn.edit {
  color: var(--primary);
}

.action-btn.delete {
  color: var(--danger);
}

.action-btn svg {
  width: 1.25rem;
  height: 1.25rem;
}

/* Empty State */
.empty-state {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 3rem 2rem;
  text-align: center;
}

.empty-state h3 {
  font-size: 1.125rem;
  font-weight: 600;
  color: var(--dark-gray);
  margin: 1rem 0 0.5rem;
}

.empty-state p {
  color: var(--gray);
  font-size: 0.875rem;
  max-width: 24rem;
}

/* Modal Styles */
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 100;
}

.modal {
  background-color: var(--white);
  border-radius: 0.5rem;
  box-shadow: var(--shadow-lg);
  width: 100%;
  max-width: 32rem;
  max-height: 90vh;
  overflow-y: auto;
}

.modal-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1.5rem;
  border-bottom: 1px solid #e2e8f0;
}

.modal-header h3 {
  font-size: 1.25rem;
  font-weight: 600;
  color: var(--dark-gray);
}

.modal-close {
  background: none;
  border: none;
  cursor: pointer;
  color: var(--gray);
  padding: 0.25rem;
  border-radius: 0.25rem;
}

.modal-close:hover {
  background-color: #f1f5f9;
}

.modal-body {
  padding: 1.5rem;
}

/* Form Styles */
.form-group {
  margin-bottom: 1rem;
}

.form-group label {
  display: block;
  font-size: 0.875rem;
  color: var(--dark-gray);
  margin-bottom: 0.25rem;
  font-weight: 500;
}

.form-group input,
.form-group select,
.form-group textarea {
  width: 100%;
  padding: 0.5rem 1rem;
  border: 1px solid #e2e8f0;
  border-radius: 0.375rem;
  font-size: 0.875rem;
  transition: border-color 0.2s;
}

.form-group input:focus,
.form-group select:focus,
.form-group textarea:focus {
  outline: none;
  border-color: var(--primary);
  box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
}

.form-group textarea {
  min-height: 5rem;
  resize: vertical;
}

.form-row {
  display: flex;
  gap: 1rem;
}

.form-row .form-group {
  flex: 1;
}

.form-actions {
  display: flex;
  justify-content: flex-end;
  gap: 0.75rem;
  margin-top: 1.5rem;
}

/* Responsive Styles */
@media (max-width: 1024px) {
  .summary-cards {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 768px) {
  .sidebar {
    width: 240px;
  }
  
  .main-content {
    margin-left: 240px;
    padding: 1.5rem;
  }
  
  .task-list-header {
    flex-direction: column;
    align-items: flex-start;
    gap: 1rem;
  }
  
  .task-filters {
    width: 100%;
    flex-wrap: wrap;
  }
  
  .filter-group {
    flex: 1;
    min-width: calc(50% - 0.5rem);
  }
}

@media (max-width: 640px) {
  .sidebar {
    width: 100%;
    height: auto;
    position: static;
    border-right: none;
    border-bottom: 1px solid #e2e8f0;
  }
  
  .main-content {
    margin-left: 0;
    padding: 1rem;
  }
  
  .summary-cards {
    grid-template-columns: 1fr;
  }
  
  .task-filters {
    flex-direction: column;
    gap: 0.75rem;
  }
  
  .filter-group {
    min-width: 100%;
  }
  
  .modal {
    margin: 1rem;
  }
}
</style>