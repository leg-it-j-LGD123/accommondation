var footerHTML = "<span style=\"margin-right: 36px\">©2020 计算机软件综合开发实训</span>" +
    "<span style=\"color:rgb(144, 145, 146)\">技术支持：https://www.layui.com/</span>";
var footerDOM = document.getElementById("sdms-footer");
if (typeof footerDOM !== "undefined" && footerDOM != null) {
    footerDOM.innerHTML = footerHTML;
}