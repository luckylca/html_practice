<template>
  <div class="interface">
    <div class="exit" @click="exit"> x</div>        
    <div class="circlr" id="circlr"></div>
    <input v-model="qq" type="text" id="username" inputmode="numeric" placeholder="                    输入QQ号" @input="validateInput">
    <input v-model="pw" type="text" id="password" placeholder="                   输入QQ密码">


    <div class="agreement" ><input v-model="sta" type="checkbox" name="" id="">
      <span class="text">已阅读并同意<a href="https://bkimg.cdn.bcebos.com/pic/d4628535e5dde711b23510aea6efce1b9c166186?x-bce-process=image/format,f_jpg" target="_blank">服务协议</a>和<a href="https://rule.tencent.com/rule/3fd52bde-6555-453b-9ab8-c5f1f3d22c62" target="_blank">QQ隐私保护指引</a></span>
    </div>
    <div @click="submit" class="submit_button1" id="submit_button1">登录</div>
  </div>

</template>

<script>
  export default {
    data() {
      return {
        link1: "https://q4.qlogo.cn/g?b=qq&nk=",
        link2: "&s=100",
        linktest: "https://q4.qlogo.cn/g?b=qq&nk=2777581179&s=100",
        qq: "",
        link_full: "",
        qq1: "2777581179",
        pw1: "abc123456",
        pw: "",
        sta: false,
      };
    },

    watch: {
      qq: function() {
        this.link_full = this.link1 + this.qq + this.link2;
        const circleElement = document.getElementById('circlr');
        circleElement.style.backgroundImage = `url(${this.link_full})`;
        if(this.qq && this.pw){
          document.getElementById('submit_button1').style.opacity = 1;
        }
        else{
          document.getElementById('submit_button1').style.opacity = 0.1;
        }
      },
      pw: function() {
        if(this.qq && this.pw){
          document.getElementById('submit_button1').style.opacity = 1;
        }
        else{
          document.getElementById('submit_button1').style.opacity = 0.1;
        }
      },
    },
    methods: {
      validateInput() {
        this.qq = this.qq.replace(/\D/g, '');
    },
      containsLetter(str) {
        return /[a-zA-Z]/.test(str);
      },  
      containsDigit(str) {
        return /\d/.test(str);
      },
      exit(){
        window.close();
      },

      submit() {
      if(this.sta == false){
        alert("请同意服务协议和隐私保护指引");
      }
      else{
        if((this.pw.length < 8 || this.qq.length > 16) || !this.containsLetter(this.pw) || !this.containsDigit(this.pw)){
          alert("密码长度为8-16个位且需要包含字母和数字");
        }
        else{
          if(this.qq == this.qq1 && this.pw == this.pw1){
            alert("登录成功");
          }
          else{
            alert("登录失败");
          }

        }

      }
    },
    }
  }
</script>

<style>
    .interface {
            width: 315px;
            height: 450px;
            background: linear-gradient(135deg, rgba(255,182,193,0.5), rgba(173,216,230,0.5)); /* 淡粉色和淡蓝色渐变 */
            border-radius: 5px;
            position: relative;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            animation: colorShift 10s infinite ease-in-out; /* 使用ease-in-out平滑过渡 */
            margin: auto;
            margin-top: 90px;
        }
    @keyframes colorShift {
            0% {
                background: linear-gradient(135deg, rgba(255,182,193,0.5), rgba(173,216,230,0.5));
            }
            25% {
                background: linear-gradient(135deg, rgba(173,216,230,0.5), rgba(255,182,193,0.5));
            }
            50% {
                background: linear-gradient(135deg, rgba(255,182,193,0.5), rgba(173,216,230,0.5));
            }
            75% {
                background: linear-gradient(135deg, rgba(173,216,230,0.5), rgba(255,182,193,0.5));
            }
            100% {
                background: linear-gradient(135deg, rgba(255,182,193,0.5), rgba(173,216,230,0.5));
            }
        }
    #username{
        width: 250px;
        height: 36px;
        border-radius: 5px;
        margin-top: 30px;
        margin-left: 31px;
        border: 1px solid transparent;
    }
    #password{
        width: 250px;
        height: 36px;
        border-radius: 5px;
        margin-top: 17px;
        margin-left: 31px;
        border: 1px solid transparent;
    }
    .agreement{
        width: 250px;
        height: 10px;
        font-size: 12px;
        margin-top: 15px;
        margin-left: 31px;
        color: #666;
        vertical-align: bottom;
    }
    .agreement a {
        color: #007BFF; /* 超链接的颜色 */
        text-decoration: none; /* 去掉下划线 */
    }
    .submit_button1{
        width: 250px;
        height: 30px;
        border-radius: 5px;
        margin-top: 32px;
        margin-left: 31px;
        background-color: #007BFF;
        color: #fff;
        text-align: center;
        line-height: 30px;
        font-size: 15px;
        opacity: 0.1;
    }
    .circlr {
            width: 80px;
            height: 80px;
            border-radius: 50%; /* 创建圆形 */
            background-size: cover; /* 确保图片覆盖整个圆形 */
            background-position: center; /* 图片居中 */
            display: inline-block;
            margin-top: 30px;
            margin-left: 120px;
            
        }
    input::placeholder {
            font-size: 16px; /* 更大的字体 */
            font-weight: normal; /* 更宽的字体 */
            color: #999; /* 占位符文字颜色 */
        }
      .exit{
        width: 20px;
        height: 20px;
        margin-top: 0;
        margin-left: 300px;
      }

</style>
