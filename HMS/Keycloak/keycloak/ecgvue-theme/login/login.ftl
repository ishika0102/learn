<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat&family=Mulish:wght@500&display=swap" rel="stylesheet">
        <link href="${url.resourcesPath}/img/favicon.png" rel="icon"/>
        <script>
            function togglePassword() {
                var x = document.getElementById("password");
                var v = document.getElementById("vi");
                if (x.type === "password") {
                    x.type = "text";
                    v.src = "${url.resourcesPath}/img/hide.svg";
                } else {
                    x.type = "password";
                    v.src = "${url.resourcesPath}/img/view.svg";
                }
            }
        </script>
    <#elseif section = "form">
        <div>
            <img class="logo" src="${url.resourcesPath}/img/ecg-vue-logo.svg" alt="Alfresco">
        </div>
        <div class="box-container">
        <#if realm.password>
            <div>     
               <form id="kc-form-login" class="form" onsubmit="return true;" action="${url.loginAction}" method="post">
               <#--  <label class = "loginText EmailText">EMAIL ID / PHONE NO.</label>  -->
                    <input id="username" class="login-field emailInputField" placeholder="${msg("Email ID / Phone no.")}" type="text" name="username" tabindex="1">
                    <#--  <div class="visibilityDiv">
                        <label class="visibility" id="v" onclick="togglePassword()"><img id="vi" src="${url.resourcesPath}/img/eye-off.png"></label>
                    </div>  -->
                <#--  <label class = "loginText passwordText">PASSWORD</label>  -->
                <input id="password" class="login-field" placeholder="${msg("password")}" type="password" name="password" tabindex="2">
                <div class="visibilityDiv">
                    <label class="visibility" id="v" onclick="togglePassword()"><img id="vi" src="${url.resourcesPath}/img/view.svg"></label>
                </div>
                <input class="submit" type="submit" value="LOGIN" tabindex="3">
                </form>
            </div>   
        </#if>
        <#if social.providers??> 
            <p class="para">${msg("selectAlternative")}</p>
            <div id="social-providers">
                <#list social.providers as p>
                <input class="social-link-style" type="button" onclick="location.href='${p.loginUrl}';" value="${p.displayName}"/>
                </#list>
            </div>
        </#if>
                
        </div>
    </#if>
</@layout.registrationLayout>
