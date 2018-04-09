<%
   Response.CacheControl = "no-cache"
   Response.AddHeader "Pragma", "no-cache"
   Response.Expires = -1
if trim(request.cookies("userhrd")) = "" then 
%>
<!DOCTYPE html>
<head>
    <title>HRD Sistem</title>
    <link rel="stylesheet" href="asset/css/bulma.css">
    <link rel="stylesheet" href="asset/css/style.css">
    <link rel="stylesheet" href="asset/css/font-awesome.min.css">
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="Fri, 01 Jan 1999 1:00:00 GMT" />
	<meta http-equiv="Last-Modified" content="0" />
	<meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
</head>
<script language="javascript">
	function set_target(x)
	{
		switch (x)
		{
			case 1 : 
				document.myForm.action="cek_pass_hrd.asp";
				break;
			case 2 :
				document.myForm.action="cek_pass_hrd2.asp";
				break;
			default :
				document.myForm.action="cek_pass_hrd.asp";
		}
		document.myForm.submit();
	}
</script>
<body>
    <section class="hero is-fullheight">
        <div class="hero-body">
            <div class="container has-text-centered">
                <div class="column is-4 is-offset-4">
                    <h3 class="title has-text-grey">HRD Sistem</h3>
                    <p class="subtitle has-text-grey">PT. Loka Wisata Asri</p>
                    <div class="box">
                        <figure class="image is-128x128">
                            <img src="asset/image/cb_logo.png">
                        </figure>    
                        <form name="myForm" method="post" target="_top">
                            <div class="field">
                                <div class="control has-icons-left">
                                    <input class="input" type="text" placeholder="Username" name="userin">
                                    <span class="icon is-small is-left">
                                        <i class="fa fa-user-o"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="field">
                                <div class="control has-icons-left">
                                    <input class="input" type="password" placeholder="Password" name="passin">
                                    <span class="icon is-small is-left">
                                        <i class="fa fa-unlock-alt"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="field">
                                <div class="control">
                                    <input type="submit" class="button is-block button-custom" value="Login" onclick="javascript:set_target(1);">
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
<%
else
	response.redirect "start/"
end if
%>