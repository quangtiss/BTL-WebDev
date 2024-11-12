<template>
  <div id="app">
    <div class="signup-container">
      <div class="form-header">
        <img src="/nikelogo.jpg" alt="Nike Logo" class="logo" />
        <h2>Now let's make you a Nike Member.</h2>
      </div>
      <form @submit.prevent="createAccount">
        <div class="input-group">
          <label for="first-name">First Name*</label>
          <input
            type="text"
            id="first-name"
            v-model="form.firstName"
            required
          />
        </div>
        <div class="input-group">
          <label for="last-name">Last Name*</label>
          <input type="text" id="last-name" v-model="form.lastName" required />
        </div>
        <div class="input-group">
          <label for="password">Password*</label>
          <input
            type="password"
            id="password"
            v-model="form.password"
            required
          />
          <p class="password-criteria">
            Minimum of 8 characters<br />
            Uppercase, lowercase letters, and one number
          </p>
        </div>
        <div class="input-group">
          <label for="shopping-preference">Shopping Preference*</label>
          <select
            id="shopping-preference"
            v-model="form.shoppingPreference"
            required
          >
            <option value="">Choose</option>
            <option value="mens">Men's</option>
            <option value="womens">Women's</option>
            <option value="kids">Kids'</option>
          </select>
        </div>
        <div class="input-group dob-group">
          <label>Date of Birth*</label>
          <input
            type="number"
            v-model="form.birthMonth"
            placeholder="Month"
            required
          />
          <input
            type="number"
            v-model="form.birthDay"
            placeholder="Day"
            required
          />
          <input
            type="number"
            v-model="form.birthYear"
            placeholder="Year"
            required
          />
        </div>
        <div class="checkbox-group">
          <div class="checkbox">
            <input type="checkbox" v-model="form.signUpForUpdates" />
            <label
              >Sign up for emails to get updates from Nike on products, offers
              and your Member benefits.</label
            >
          </div>
          <div class="checkbox">
            <input type="checkbox" v-model="form.agreeToTerms" required />
            <label
              >I agree to Nike’s <a href="#">Privacy Policy</a> and
              <a href="#">Terms of Use</a>.</label
            >
          </div>
        </div>
        <button type="submit" class="btn-create-account">Create Account</button>
      </form>
    </div>
  </div>
</template>

<script>
const app = Vue.createApp({
  data() {
    return {
      form: {
        firstName: "",
        lastName: "",
        password: "",
        shoppingPreference: "",
        birthMonth: "",
        birthDay: "",
        birthYear: "",
        signUpForUpdates: false,
        agreeToTerms: false,
      },
      errors: {},
      isSubmitting: false,
    };
  },
  methods: {
    validateForm() {
      this.errors = {};
      let isValid = true;

      // Check for empty fields
      if (!this.form.firstName) {
        this.errors.firstName = "First name is required.";
        isValid = false;
      }

      if (!this.form.lastName) {
        this.errors.lastName = "Last name is required.";
        isValid = false;
      }

      if (!this.form.password || this.form.password.length < 8) {
        this.errors.password = "Password must be at least 8 characters long.";
        isValid = false;
      }

      if (!this.form.shoppingPreference) {
        this.errors.shoppingPreference = "Please select a shopping preference.";
        isValid = false;
      }

      if (
        !this.form.birthMonth ||
        !this.form.birthDay ||
        !this.form.birthYear
      ) {
        this.errors.dob = "Please enter a valid date of birth.";
        isValid = false;
      }

      if (!this.form.agreeToTerms) {
        this.errors.agreeToTerms = "You must agree to the terms.";
        isValid = false;
      }

      return isValid;
    },

    async createAccount() {
      if (!this.validateForm()) {
        return;
      }

      this.isSubmitting = true;

      // Simulate submitting form
      setTimeout(() => {
        alert("Account created successfully!");
        this.isSubmitting = false;
        this.resetForm();
      }, 2000);
    },

    resetForm() {
      this.form = {
        firstName: "",
        lastName: "",
        password: "",
        shoppingPreference: "",
        birthMonth: "",
        birthDay: "",
        birthYear: "",
        signUpForUpdates: false,
        agreeToTerms: false,
      };
      this.errors = {};
    },
  },
});

app.mount("#app");
</script>

<style scoped>
/* Reset body and html */
html,
body {
  height: 100%;
  margin: 0;
  font-family: Arial, sans-serif;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #f4f4f4; /* Màu nền nhẹ */
}

/* Đảm bảo app sẽ chiếm toàn bộ không gian */
#app {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  width: 100%;
}

/* Thiết kế khung form đăng ký */
.signup-container {
  width: 600px;
  padding: 20px;
  border: 1px solid #ddd;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  background-color: white;
}

/* Header của form đăng ký */
.form-header {
  text-align: center;
  margin-bottom: 20px;
}

.form-header img.logo {
  width: 100px;
}

/* Các nhóm input */
.input-group {
  margin-bottom: 15px;
}

.input-group label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}

.input-group input,
.input-group select {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

.password-criteria {
  font-size: 12px;
  color: #888;
}

/* Nhóm các checkbox */
.checkbox-group {
  margin-bottom: 15px;
}

.checkbox {
  display: flex;
  align-items: center;
}

.checkbox input {
  margin-right: 10px;
}

/* Nút tạo tài khoản */
.btn-create-account {
  display: block;
  width: 100%;
  padding: 12px;
  background-color: #000;
  color: #fff;
  font-weight: bold;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.btn-create-account:hover {
  background-color: #333;
}

/* Responsive cho các màn hình nhỏ */
@media (max-width: 480px) {
  .signup-container {
    width: 90%;
  }

  .form-header img.logo {
    width: 80px;
  }
}
</style>
