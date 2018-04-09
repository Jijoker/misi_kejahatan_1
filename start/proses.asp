<!-- #INCLUDE virtual="/hrd2/start/aspjson.asp" -->
<%
if request("action")= "ubahnama" then
	changeName()
elseif request("action")= "ambildataemp" then
	ambildataemp()
elseif request("action")= "tabelisigaji" then
	datatabelemp()
elseif request("action")= "KirimDataMenu" then
	inserdatamenu()
end if



function changeName()
	cab = request("cabang")
	jab = request("jabatan")
	sta = request("status")
	if trim(sta) = 1 then
		systa = " "
	elseif trim(sta) = 2 then
		systa = "and resign = 0"
	else
		systa = "and resign = 1"  
	end if
	if trim(jab) = 0 then
		syjab = " "
	else
		syjab = "and depcode = "&jab&""
	end if
	syarat = syjab &" "&systa
	set oconn = server.createobject("adodb.connection")
	Conn="Driver={Microsoft Visual FoxPro Driver}; SourceType=DBF ;BackgroundFetch=No ;SourceDB="& Server.Mappath( "/database/personel/data/personel/") 
	oConn.Open Conn
	Set data01=CreateObject("ADODB.RecordSet")
		sql01 = "select * from employee where cab = '"&cab&"' "&syarat&" order by nama"
		data01.OPEN sql01, oConn
		do while not data01.EOF
			response.write "<option value="&data01("empcode")&">"&data01("nama")&"</option>"
			data01.movenext
		loop
		data01.close
	oConn.close
end function

function ambildataemp()
	nip = request("empcode")
	set oconn = server.createobject("adodb.connection")
	Conn="Driver={Microsoft Visual FoxPro Driver}; SourceType=DBF ;BackgroundFetch=No ;SourceDB="& Server.Mappath( "/database/personel/data/personel/") 
	oConn.Open Conn
	Set data01=CreateObject("ADODB.RecordSet")
		sql01 = "select * from employee where empcode = '"&nip&"'"
		data01.OPEN sql01, oConn
			 Dim employe 
			 Set employe = jsObject()
				employe("name") = data01("nama") 
				employe("nip") = data01("empcode")
				employe("jab") = data01("jabcode")
				employe("dep") = data01("depcode")
				employe("gp") = data01("salary_rp")
				employe("ta") = data01("active_rp")
				employe("sc") = data01("sct_rp")
				employe("la") = data01("tunjt_rp")
				employe("tot") = cdbl(data01("salary_rp")) + cdbl(data01("active_rp")) + cdbl(data01("sct_rp")) + cdbl(data01("tunjt_rp"))
				employe("tgl") = Date()
			 employe.Flush
		data01.close
	oConn.close
end function

function datatabelemp()
	cabang = request("cabGA")
	dept = request("depGA")
	jenispeg = request("jenGA")
	nip = request("nipGA")
	nama = request("namaGA")
	resign = request("staGA")
	'response.write cabang &" "& dept&" "&jenispeg&" "&nip&" "&nama&" "&resign
	if trim(resign) = "1" then
		systa = " "
	elseif trim(resign) = "2" then
		systa = "and resign = 0"
	else
		systa = "and resign = 1"  
	end if
	if trim(dept) = "0" then
		syjab = " "
	else
		syjab = "and depcode = "&dept&""
	end if
	if trim(jenispeg) = "semua" then
		syjep = " "
	else
		syjep = "and status = '"&jenispeg&"'"  
	end if
	systajab = syjab &" "&systa &" "& syjep
	
	if trim(nip) <> "" then
		syarat="empcode = '"&nip&"'"
	elseif not trim(nama) = "" then
		syarat="nama = '"&nama&"'"
	else
		syarat="cab = '"&cabang&"' "&systajab&""
	end if
	set oconn = server.createobject("adodb.connection")
	Conn="Driver={Microsoft Visual FoxPro Driver}; SourceType=DBF ;BackgroundFetch=No ;SourceDB="& Server.Mappath( "/database/personel/data/personel/") 
	oConn.Open Conn
	Set data01=CreateObject("ADODB.RecordSet")
		sql01 = "select * from employee where "&syarat&" order by nama "
		'response.write sql01
		data01.OPEN sql01, oConn
		if not data01.EOF then
		do while not data01.EOF
			set oconn2 = server.createobject("adodb.connection")
			Conn2="Driver={Microsoft Visual FoxPro Driver}; SourceType=DBF ;BackgroundFetch=No ;SourceDB="& Server.Mappath( "/database/personel/data/" )
			oConn2.Open Conn2
			sql = "select * from cabang where cab = '"&data01("cab")&"'"
			Set oRec=CreateObject("ADODB.RecordSet")
			oRec.OPEN sql, oConn2
				cabang = trim(oRec("ket"))
			oRec.Close
			
			Set oRec=Nothing
			sql = "select * from department where id = "&data01("depcode")&""
			Set oRec=CreateObject("ADODB.RecordSet")
			oRec.OPEN sql, Conn
				department = trim(oRec("depname"))
			oRec.Close
			Set oRec=Nothing
			
			if trim(data01("lib_nas")) = 1 then
				pola = "Tetap"
			elseif trim(data01("lib_nas")) = 0 then
				pola = ""
			else
				pola = " "
			end if
			if data01("s_kerja") = cdate("12:00:00 AM") then
				skerja = "-"
			else
				skerja = trim(data01("s_kerja"))
			end if
			if data01("m_sampai") = cdate("12:00:00 AM") then
				msampai = "-"
			else
				msampai = trim(data01("m_sampai"))
			end if
			ada = DateDiff("m",trim(data01("s_kerja")),date())
			response.write "<tr><td>"&trim(data01("empcode"))&"</td>"&_
			"<td>"&trim(data01("nama"))&"</td>"&_
			"<td>"&trim(data01("pajak"))&"</td>"&_
			"<td>"&department&"</td>"&_
			"<td>"&skerja&"</td>"&_
			"<td>"&trim(data01("m_kerja"))&"</td>"&_
			"<td>"&msampai&"</td>"&_
			"<td>Machine "&trim(data01("machine"))&" - "&trim(data01("enroll"))&"</td>"&_
			"<td>"&trim(data01("pola_libur"))&"</td>"&_
			"<td>"&ada&"</td>"&_
			"<td>"&trim(data01("status"))&"</td>"&_
			"<td>"&trim(data01("acc_acc"))&"</td>"&_
			"<td>"&trim(data01("acc_acc2"))&"</td>"&_
			"<td><a onclick=getPage('data_karyawan/isi_karyawan_baru.asp?nipga="&trim(data01("empcode"))&"','url1')>Edit</a></td>"&_
			"</tr>"
			data01.movenext
		loop
		oConn2.close
		else
			response.write "<tr><td colspan='14' class='is-center'>DATA TIDAK ADA</td></tr>"
		end if
		data01.close
	oConn.close
end function

function inserdatamenu()
	pid = request("pidsub")
	name = request("namesub")
	link = request("urlsub")
	lvl0 = request("LvlSub0")
	lvl1 = request("LvlSub1")
	lvl2 = request("LvlSub2")
	lvl3 = request("LvlSub3")
	lvl4 = request("LvlSub4")
	lvl5 = request("LvlSub5")
	lvlsub = lvl0&","&lvl1&","&lvl2&","&lvl3&","&lvl4&","&lvl5
	
	set oconn = server.createobject("adodb.connection")
	Connstr="Driver={Microsoft Visual FoxPro Driver}; SourceType=DBF ;BackgroundFetch=No ;SourceDB="& Server.Mappath("/database/menu") 
	oConn.Open Connstr
	Set data01=CreateObject("ADODB.RecordSet")
	sql01 = "select * from menu_hrd where pid="&pid&" order by cid desc "
	data01.OPEN sql01, oConn
	lastcid = data01("cid")
	maxcid = cdbl(lastcid) + 1
	data01.close
	sqladd = "insert into menu_hrd (pid,cid,nama,url,status,lvl_user) values("&pid&","&maxcid&",'"&name&"','"&link&"',1,'"&lvlsub&"')"
	response.write sqladd
	oConn.execute sqladd
		response.write "SEND"
	
	oConn.close
end function
%>