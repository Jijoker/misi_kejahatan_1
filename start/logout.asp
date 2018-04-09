<SCRIPT LANGUAGE="JavaScript">
function createCookie(name,value,days) {
	if (days) {
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = "; expires="+date.toGMTString();
	}
	else var expires = "";
	document.cookie = name+"="+value+expires+"; path=/";
}

function eraseCookie(name) {
	createCookie(name,"",-1);
}

eraseCookie('dtUser');
eraseCookie('dtAssignee');
eraseCookie('tampil');
eraseCookie('ascdes');
eraseCookie('dtbulan');
eraseCookie('dttahun');
eraseCookie('dtparam');
eraseCookie('dtflag2a');
eraseCookie('dtflag2b');

</script>
<%
Response.Cookies("userhrd") = "" 
Response.Cookies("userhrd").Expires = Date() - 1

response.cookies("level")=4

response.cookies("dtUser")="all"
response.cookies("dtAssignee")="all"
response.cookies("tampil")="done"
response.cookies("ascdes")="asc"

response.cookies("dtbulan")=month(date())
response.cookies("dttahun")=year(date())
response.cookies("dtparam")=0
response.cookies("dtflag2a")=""
response.cookies("dtflag2b")=""



%>
<meta http-equiv="Content-Language" content="en-us">
<!DOCTYPE html>
<head>
    <title>HRD Sistem</title>
    <link rel="stylesheet" href="../asset/css/bulma.css">
    <link rel="stylesheet" href="../asset/css/style.css">
    <link rel="stylesheet" href="../asset/css/font-awesome.min.css">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
    <section class="hero is-fullheight">
        <div class="hero-body">
            <div class="container has-text-centered">
                <div class="column is-4 is-offset-4">
                    <h3 class="title has-text-grey">HRD Sistem</h3>
                    <p class="subtitle has-text-grey">PT. Loka Wisata Asri</p>
                    <div class="box">
                        <figure class="image is-128x128">
                            <img src="../asset/image/cb_logo.png">
                        </figure>    
                        <form>
                            <div class="notification is-warning">
                                Terima Kasih Telah Menggunakan Fasilitas HRD Club Bali<br>© IT Dept <%=year(date())%> 
                               </div>
                            <div class="field">
                                <div class="control">
                                    <!-- <input type="submit" class="button is-block button-custom" value="Login">
                                    <a href="../../hrd2" class="button is-block button-custom"><i class="fa fa-arrow-left is-pulled-left" aria-hidden="true" style="line-height: 26px;"></i>To Login Area</a> -->
                                </div>
                            </div> 
                        </form>
                    </div><!-- /.box -->
                </div><!-- /.column -->
            </div><!-- /.container -->
        </div><!-- /.hero-body -->
    </section>
</body>
</html>
<script language="JavaScript">
eraseCookie('dtUser');
eraseCookie('dtAssignee');
eraseCookie('tampil');
eraseCookie('ascdes');
eraseCookie('dtbulan');
eraseCookie('dttahun');
eraseCookie('dtparam');
eraseCookie('dtflag2a');
eraseCookie('dtflag2b');
</script>

<script>window.close()</script>

<script>swal("Anda Sudah Keluar dari HRD System")</script>

<SCRIPT LANGUAGE="JavaScript">
{//top.location="/hrd2" }
</SCRIPT>
