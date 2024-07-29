<template>
  <div class="signUp_page">
    <div class="formPart">
      <div class="formHead">
        <img src="@/icons/BU_Logo.png" alt="BU_Logo">
        <h1>Welcome</h1>
        <p>Sign up to BU Attendance System</p>
      </div>
      <div class="inputGroup">
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm">
          <el-form-item prop="userType">
            <el-radio v-model="ruleForm.userType" label="1">Professor</el-radio>
            <el-radio v-model="ruleForm.userType" label="2">Teaching Assistant</el-radio>
          </el-form-item>
          <el-form-item prop="emailAddress">
            <el-input v-model="ruleForm.emailAddress" placeholder="Email address"></el-input>
          </el-form-item>
          <el-form-item prop="password">
            <el-input v-model="ruleForm.password" placeholder="Password" show-password></el-input>
          </el-form-item>
          <el-form-item prop="confirmPassword">
            <el-input v-model="ruleForm.confirmPassword" placeholder="Confirm Password" show-password></el-input>
          </el-form-item>
        </el-form>
        <el-button id="submitButton" type="info" @click="submitForm('ruleForm')">Continue</el-button>
        <div id="signin">
          <p>Already hava an account?</p>
          <p id="logIn" @click="goToLogin">Log in</p>
        </div>
      </div>
    </div>
    <div class="imagePart">
      <img src="@/icons/SignInPage.jpg" alt="BU">
    </div>
  </div>
</template>

<script>
export default {
  name: 'LoginView',
  data() {
    return {
      ruleForm: {
        emailAddress: '',
        password: '',
        confirmPassword: '',
        userType: '1'
      },
      rules: {
        emailAddress: [
          { required: true, type: 'email', message: 'Please enter a valid email address', trigger: 'blur' }
        ],
        password: [
          {
            required: true, trigger: 'blur', validator: (rule, value, callback) => {
              if (value === '') {
                callback(new Error('Please enter password'));
              } else {
                const minLength = value.length >= 8;
                const maxLength = value.length >= 100;
                const hasLowerCase = /[a-z]/.test(value);
                const hasUpperCase = /[A-Z]/.test(value);
                const hasNumber = /[0-9]/.test(value);
                const hasSpecialChar = /[!@#$%^&*.]/.test(value);

                if (!minLength) {
                  callback(new Error('Password must be at least 8 characters'));
                } else if (!hasLowerCase) {
                  callback(new Error('Password must contain at least one lower case letter'));
                } else if (!hasUpperCase) {
                  callback(new Error('Password must contain at least one upper case letter'));
                } else if (!hasNumber) {
                  callback(new Error('Password must contain at least one number'));
                } else if (!hasSpecialChar) {
                  callback(new Error('Password must contain at least one special character'));
                } else if (maxLength) {
                  callback(new Error('Password must be less than 100 characters'));
                } else {
                  callback();
                }
              }
            }
          }
        ],
        confirmPassword: [
          {
            required: true, trigger: 'blur', validator: (rule, value, callback) => {
              if (value === '') {
                callback(new Error('Please confirm your password'));
              } else if (value !== this.ruleForm.password) {
                callback(new Error('Passwords do not match'));
              } else {
                callback();
              }
            }
          }
        ]
      }
    }
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          alert('submit!');
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    goToLogin() {
      this.$router.push({ name: 'Login' });
    },

  }
};
</script>

<style scoped>
.signUp_page {
  height: 100vh;
  width: 100%;
  display: flex;
  flex-direction: row;
  font-family: "Poppins", sans-serif;
  font-style: normal;
}

.formPart {
  height: 100vh;
  width: 35%;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.formHead {
  margin-top: 140px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.formHead img {
  width: auto;
  height: 80px;
}

.formHead h1 {
  font-size: 24px;
  font-weight: 600;
  margin: 10px 0;
}

.formHead p {
  font-size: 12px;
  font-weight: 400;
  margin: 0;
}

.inputGroup {
  margin-top: 20px;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
}

.el-input /deep/ .el-input__inner {
  width: 300px;
  height: 50px;
}

#submitButton {
  margin-top: 0px;
  font-size: 14px;
  font-weight: 600;
  padding: 16px 60px;
  width: 300px;
  background-color: #000000;
  color: #ffffff;
}

#signin {
  display: flex;
  flex-direction: row;
}

#signin p {
  font-size: 12px;
  font-weight: 400;
}

#signin #logIn {
  margin-left: 8px;
  font-size: 12px;
  font-weight: 600;
}

.imagePart {
  height: 100vh;
  width: 65%;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
}

.imagePart img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
</style>