<template>
    <div class="app-wrapper">
        <div class="sidebar-container">
            <div id="logo">
                <img src="@/icons/BU_Logo.png" alt="bu_logo">
            </div>
            <div class="operating_group">
                <el-button type="info" plain @click="goTo('Dashboard')"><i
                        class="el-icon-s-home"></i>Dashboard</el-button>
                <el-button type="info" plain @click="goTo('Course')"><i class="el-icon-menu"></i>Course
                    Management</el-button>
                <el-button type="info" plain @click="goTo('Student')"><i class="el-icon-s-custom"></i>Student
                    Management</el-button>
                <el-button type="info" plain @click="goTo('Attendance')"><i class="el-icon-s-order"></i>Attendance
                    Records</el-button>
                <el-button type="info" plain @click="goTo('Statistics')"><i class="el-icon-s-data"></i>Statistics &
                    Analysis</el-button>
                <el-button type="info" plain @click="goTo('User')"><i class="el-icon-s-platform"></i>User
                    Management</el-button>
                <el-button type="info" plain @click="goTo('Help')"><i class="el-icon-s-tools"></i>Help &
                    Support</el-button>
            </div>
            <el-button type="info" plain @click="goTo('Login')"><i class="el-icon-more"></i>Log Out</el-button>
        </div>
        <div class="main-container">
            <div class="navbar">
                <el-avatar :size="50" icon="el-icon-user-solid" style="margin-right: 20px;"></el-avatar>
            </div>
            <div class="main-content">
                <router-view />
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'MainLayout',
    methods: {
        goTo(routeName) {
            this.$router.push({ name: routeName });
        }
    }
}
</script>

<style scoped>
.app-wrapper {
    display: flex;
    height: 100vh;
    width: 100%;
}

.sidebar-container {
    display: flex;
    flex-direction: column;
    height: 100vh;
    width: 250px;
    background-color: #ffffff;
    color: #323b44;
    position: fixed;
    top: 0;
    left: 0;
}

.main-container {
    margin-left: 250px;
    height: 100vh;
    width: calc(100% - 250px);
    display: flex;
    flex-direction: column;
}


.navbar {
    height: 60px;
    width: calc(100% - 250px);
    position: fixed;
    top: 0;
    left: 250px;
    background-color: #ebebeb;
    display: flex;
    align-items: center;
    justify-content: flex-end;
}

.main-content {
    flex-grow: 1;
    overflow-y: auto;
    background-color: #f5f5f5;
    padding: 20px;
    margin-top: 60px;
}

#logo {
    height: 70px;
    background-color: #ffffff;
    display: flex;
    justify-content: center;
    align-items: center;
}

#logo img {
    margin-top: 10px;
    height: 60px;
    width: auto;
}

.operating_group {
    height: calc(100% - 60px);
    width: auto;
    margin-top: 20px;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
}

.sidebar-container .el-button {
    margin: 15px 20px;
    display: flex;
    align-items: center;
    justify-content: flex-start;
    border-radius: 12px;
    color: #656565;
    background-color: #ffffff;
    border-color: #ffffff;
    font-size: 15px;
}

.sidebar-container .el-button i {
    margin-right: 10px;
}
</style>