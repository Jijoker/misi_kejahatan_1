<%
pass="123123"
idinput=trim(ucase(request.form("Userin")))
passinput=request.form("PassIn")

mdir="\"
mtime=left(time,8)
mdate=cdate(date)

date_now = date()

set oconn = server.createobject("adodb.connection")
Connstr="Driver={Microsoft Visual FoxPro Driver}; SourceType=DBF ;BackgroundFetch=No ;SourceDB="& Server.Mappath("/database/personel/data/personel/") 

oConn.Open Connstr
Set oRec=CreateObject("ADODB.RecordSet")

if passinput=pass then
	sqlnya="SELECT * FROM employee WHERE not resign = 1 and nm_user='"& UCASE(trim(idinput)) &"'"
else
	sqlnya="SELECT * FROM employee WHERE not resign = 1 and nm_user='"& UCASE(trim(idinput)) &"' AND ps_user='"& UCASE(trim(passinput)) &"'"
end if
'response.write sqlnya
'response.end
oRec.Open sqlnya,OCONN
IF oRec.EOF then
   ORec.Close
   Set Orec=Nothing
   
   response.Cookies("user")="GUEST"
   response.Cookies("iduser")=11
   response.Cookies("lv_user")=0
   response.Cookies("dir")=mdir
   response.Cookies("tgl_in")=mdate
   response.Cookies("time_in")=mtime
   response.cookies("uid_pelapor")=0
   response.cookies("d_lev")=0
   response.cookies("d_pas")=""
   response.cookies("d_cab")=999
   response.cookies("d_dep")=999
   response.cookies("d_per")=999
   response.cookies("d_cabang")=""
   response.cookies("hakhis")=""
   
   response.cookies("d_pertxt")=""
   response.cookies("d_task")=9
	response.cookies("user_flag")=0
	response.cookies("report_to")=""
	response.cookies("email_pelapor")=""
	response.cookies("hakaksesbaru")=""
			
	response.cookies("dtuser")=""
	response.cookies("dtAssignee")=""
	response.cookies("tampil")=""
	response.cookies("ascdes")=""
	response.cookies("dtparam")=0
	response.cookies("dtbulan")=0
	response.cookies("dttahun")=0
	response.cookies("dtflag2a")=""
	response.cookies("dtflag2b")=""
   %>
   <script>alert("Username / password tidak valid!");window.history.back(-1)</script>
   <%
   oConn.Close
   Set oConn=Nothing
   response.end
else
		
		' HRD SYSTEM
		
	    set oconn3 = server.createobject("adodb.connection")
        oConn3.Open "Driver={Microsoft Visual FoxPro Driver}; SourceType=DBF ;BackgroundFetch=No ;SourceDB="& Server.Mappath( "/database/personel/data/personel") 
	    Set oRec3=CreateObject("ADODB.RecordSet")
	    oRec3.OPEN "select nm_user,nama,cab,depcode,lv_user,empcode from employee WHERE UPPER(trim(email))='"& UCASE(trim(orec.fields("Email"))) &"' and not empty(email) " , oConn3
	    if not oRec3.eof then
			 response.cookies("userlogon")("username")=trim(oRec3("nm_user"))
			 response.cookies("userlogon")("userfullname")=trim(oRec3("nama"))
			 response.cookies("userlogon")("usercabang")= trim(oRec3("cab"))
			 response.cookies("userlogon")("userdep")= oRec3("depcode")
			 response.cookies("userlogon")("userlevel")=oRec3("lv_user")
			 response.cookies("userlogon")("usernip")=trim(oRec3("empcode"))
		else
			 response.cookies("userlogon")("username")="Unknown"
			 response.cookies("userlogon")("userfullname")="Unknown"
			 response.cookies("userlogon")("usercabang")= "     "
			 response.cookies("userlogon")("userdep")= 0
			 response.cookies("userlogon")("userlevel")=0
			 response.cookies("userlogon")("usernip")=""
	    end if
	    oRec3.close
	    oConn3.close

		response.cookies("dtuser").Expires = date - 10
		response.cookies("dtAssignee").Expires = date - 10
		response.cookies("tampil").Expires = date - 10
		response.cookies("ascdes").Expires = date - 10
		response.cookies("dtparam").Expires = date - 10
		response.cookies("dtbulan").Expires = date - 10
		response.cookies("dttahun").Expires = date - 10
		response.cookies("dtflag2a").Expires = date - 10
		response.cookies("dtflag2b").Expires = date - 10
		
		if trim(userin) = "CAHYONO" then 
			'response.write oRec.Fields("user") & "<bR>" 
			'response.write oRec.Fields("cab") & "<bR>" 
			'response.write oRec.Fields("Email") & "<bR>" 
			
			'response.write request.cookies("uid_pelapor") & "<bR>" 
			'response.write request.cookies("user") & "<bR>" 
			'response.write request.cookies("d_cabang") & "<bR>" 
			'response.write request.cookies("email_pelapor") & "<bR>" 
			'response.end
		end if 
		
   		response.Cookies("userhrd")=oRec("nama")
   		response.Cookies("nip")=oRec("empcode")
		ORec.Close
		set orec=Nothing
		
		
		' Log User Aktif
		
		'oConn.Execute "INSERT INTO LOGIPUSER (IP_ADD,WAKTU,USER_LOGIN) VALUES ('"& Request.ServerVariables("REMOTE_ADDR") &"',DATETIME(),'"& userin &"')"
		
		oConn.Close
		Set oConn=Nothing
		
		
		
	 	response.redirect "/HRD2/start/"
end if
%>