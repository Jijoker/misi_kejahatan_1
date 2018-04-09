<%
   Response.CacheControl = "no-cache"
   Response.AddHeader "Pragma", "no-cache"
   Response.Expires = -1
%>
<html>
<head>
    <link rel="stylesheet" href="../asset/css/bulma.css">
    <link rel="stylesheet" href="../asset/css/style.css">
    <link rel="stylesheet" href="../asset/css/font-awesome.min.css">
    <link rel="shortcut icon" href="../asset/image/cb_favicon.png">
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="Fri, 01 Jan 1999 1:00:00 GMT" />
	<meta http-equiv="Last-Modified" content="0" />
	<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
    <script src="../asset/js/jquery.min.js"></script>
	<title>HRD Sistem</title>
</head>
<%
if trim(request.cookies("userhrd")) = "" then
%>
<!-- #INCLUDE virtual="/hrd2/start/restricted.asp" -->
<%
else
%>
<body onload="getPage('dashboard.asp')">
  <!-- #INCLUDE virtual="/hrd2/start/navbar.asp" -->
  <div id="loading" class="loader-overlay">
     <div class="loaderSahid">
          <div class="dot accent-pink"></div>
          <div class="dot accent-orange"></div>
          <div class="dot accent-green"></div>
          <div class="dot accent-cyan"></div>
          <div class="dot accent-blue"></div>
          <div class="dot accent-purple"></div>
     </div>
  </div>
  <div class="columns app-body">
	<aside class="menu column hero aside-menu-fixed">
        <!-- #INCLUDE virtual="/hrd2/start/menu_list.asp" -->
    </aside>
    <div class="column main-content" id="main"></div>
  </div>
<script src="../asset/js/cb.js"></script>
  <script src="../asset/js/script.js"></script>
</body>
<%end if%>
</html>
