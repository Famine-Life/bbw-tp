
$(function () {


    let oBtn_login = $("a#login")
    console.log(oBtn_login)
    let oBtn_regist = $("a#regist");
    let section_login = $("#section_login")     //获取登录部分div
    let section_regist = $("#section_regist")    //获取注册部分div
    section_regist.toggle()

    oBtn_regist.click(function () {
        console.log("regist btn~~~~")
        oBtn_login.removeClass('disabled').addClass('active')
        oBtn_regist.removeClass('active').addClass('disabled')
        section_regist.toggle()     //注册部分显示/隐藏
        section_login.toggle()      //登录部分显示/隐藏
    })
    oBtn_login.click(function () {
        console.log("login btn~~~~")
        oBtn_regist.removeClass('disabled').addClass('active')
        oBtn_login.removeClass('active').addClass('disabled')
        section_regist.toggle()     //注册部分显示/隐藏
        section_login.toggle()      //登录部分显示/隐藏
    })

    /*
    $("#registrationForm").on("submit",function (ev) {
        //console.log($("#registrationForm").attr('action'))
        let that = $(this);
        console.log(that.attr('action'))
        $.ajax({
            type: 'post',
            url:that.attr('action'),
            data:that.serialize(),
            dataType:'json',    //预期后台返回类型
            success:function (res) {
                alert("success!"+res);

            },
            error:function () {
                alert("error")
            }

        })
       //  console.log(ev);
       //  console.log(window.ev)
       // ev.preventDefault();    //阻止表单默认提交
        return false;
    })



 */



});