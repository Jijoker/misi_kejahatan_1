<ul class="menu-list">
	<%
	set oconn = server.createobject("adodb.connection")
	Conn="Driver={Microsoft Visual FoxPro Driver}; SourceType=DBF ;BackgroundFetch=No ;SourceDB="& Server.Mappath( "/database/menu") 
	oConn.Open Conn
	Set oRec=CreateObject("ADODB.RecordSet")
	oRec.OPEN "SELE * FROM menu_hrd where cid = 0 order by pid,cid" , oConn
		no=0
		do while not oRec.EOF
	%>
        <li>
            <a class="hrd-link" href="javascript:void(0)">
                <i class="fa fa-<%=oRec("icon")%> menu-icon"></i>
                    <%=oRec("nama")%>
                <i class="arrow fa fa-angle-down"></i>
            </a>
            <ul class="hrd-sub-menu">
            <%
			Set oRec2=CreateObject("ADODB.RecordSet")
			oRec2.OPEN "SELE * FROM menu_hrd where not cid = 0 and pid = "&trim(oRec("pid"))&" order by pid,cid" , oConn
				do while not oRec2.EOF
				no = no + 1
			%>
				<li><a onclick ="getPage('<%=trim(oRec2("url"))%>','url<%=no%>')" id="url<%=no%>" class=""><%=oRec2("nama")%></a></li> 
			<%
				oRec2.movenext
				loop
			oRec2.close
			%>
            </ul>
        </li>
	<%	
		oRec.movenext
		loop
	oRec.close
	oConn.Close
	%>
</ul>