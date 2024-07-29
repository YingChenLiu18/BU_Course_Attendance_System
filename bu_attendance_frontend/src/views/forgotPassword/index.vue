<template>
  <div class="forgotPassword_page">
    <div class="formPart">
      <div class="formHead">
        <img src="@/icons/BU_Logo.png" alt="BU_Logo">
        <h1>Forgot Your Password?</h1>
        <p>Enter your emial address and we will send you</p>
        <p>instructions to reset your password.</p>
      </div>
      <div class="inputGroup">
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm">
          <el-form-item prop="emailAddress">
            <el-input v-model="ruleForm.emailAddress" placeholder="Email address"></el-input>
          </el-form-item>
        </el-form>
        <el-button id="submitButton" type="info" @click="submitForm('ruleForm')">Continue</el-button>
      </div>
      <p id="backToLogin" @click="goToLogin">Back to Login</p>
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
        password: ''
      },
      rules: {
        emailAddress: [
          { required: true, type: 'email', message: 'Please enter a valid email address', trigger: 'blur' }
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
    }
  }
};
</script>

<style scoped>
.forgotPassword_page {
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
  margin-top: 240px;
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
  font-size: 14px;
  font-weight: 600;
  padding: 16px 60px;
  width: 300px;
  background-color: #000000;
  color: #ffffff;
}

#backToLogin {
  margin-top: 30px;
  font-size: 14px;
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