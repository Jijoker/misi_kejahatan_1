<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Maintenance Menu</title>
</head>

<body>
	<a href="" class="button is-info is-outlined is-small is-pulled-right">Add Parent Menu</a>
	<br/>
	<table class="table is-bordered is-striped is-hoverable is-narrow is-fullwidth" style="margin-top: 12px;" id="TableMenu">
		<tr>
			<th>PID</th>
			<th>CID</th>
			<th>Nama Menu</th>
			<th>URL Menu</th>
			<th>FA Icon</th>
			<th>Action</th>
		</tr>
<%
set oconn = server.createobject("adodb.connection")
Conn="Driver={Microsoft Visual FoxPro Driver}; SourceType=DBF ;BackgroundFetch=No ;SourceDB="& Server.Mappath( "/database/menu") 
oConn.Open Conn
Set data01=CreateObject("ADODB.RecordSet")
	sql01 = "select * from menu_hrd where cid = 0 order by pid asc"
	data01.OPEN sql01 , oConn
	do while not data01.EOF
%>
		<tr>
			<td style="font-size: 12px;"><%=data01("pid")%></td>
			<td style="font-size: 12px;"><%=data01("cid")%></td>
			<td style="font-size: 12px;"><%=data01("nama")%></td>
			<td style="font-size: 12px;">Parent don't have url</td>
			<td style="font-size: 12px;"><%=data01("icon")%></td>
			<td class="hrdm-icon" style="font-size: 12px;">
				<button class="button is-small is-link Add" title="Add Submenu" id="AddSubMenu"><i class="fa fa-plus-square-o fa-lg"></i></button>
				<button class="button is-small is-info Edit" title="Edit" id="EditSubMenu"><i class="fa fa-pencil-square-o fa-lg" ></i></button>
				<button class="button is-small is-danger Deleteicon" title="Delete" id="DelSubMenu"><i class="fa fa-trash-o fa-lg"></i></button>
		</tr>
<%
	pid = data01("pid")
	Set data02=CreateObject("ADODB.RecordSet")
		sql02 = "select * from menu_hrd where pid = "&pid&" and not cid = 0 order by cid asc"
		data02.OPEN sql02 , oConn
		do while not data02.EOF
%>
		<tr>
			<td style="font-size: 12px;"><%=data02("pid")%></td>
			<td style="font-size: 12px;"><%=data02("cid")%></td>
			<td style="font-size: 12px;">&nbsp;&nbsp;&nbsp;<%=data02("nama")%></td>
			<td style="font-size: 12px;"><%=data02("url")%></td>
			<td style="font-size: 12px;">Sub menu don't have icon</td>
			<td class="hrdm-icon" style="font-size: 12px;">
				<button class="button is-small is-info Edit" title="Edit"><i class="fa fa-pencil-square-o fa-lg" ></i></button>
				<button class="button is-small is-danger Deleteicon" title="Delete"><i class="fa fa-trash-o fa-lg"></i></button>
			</td>
		</tr>	
<%		
		data02.movenext
	loop
	data01.movenext
loop
%>
	</table>
<div id="addMenu" class="modal">
  <div class="modal-background"></div>
  <div class="modal-content">
  <form id="SubMenuModal">
    		<div class="columns">
			<div class="column is-12">
				<div class="field is-horizontal">
					<label for="" class="label is-small identity">Parent Name</label>
					<input type="text" id="pNameModal" class="input is-small is-noborder" value="" readonly>
					<input type="hidden" id="idNameModal" class="input is-small" value="" readonly>
				</div>
				<div class="field is-horizontal">
					<label for="" class="label is-small identity">Menu Name</label>
					<input type="text" class="input is-small" id="SubMenuName">
				</div>
				<div class="field is-horizontal">
					<label for="" class="label is-small identity">Menu URL</label>
					<input type="text" class="input is-small" id="SubMenuURL">
				</div>
				<div class="field is-horizontal">
					<label for="" class="label is-small identity">Level User</label>
				  <label class="checkbox chk-mhrWork"><input type="checkbox" class="LvlSub" name="LvlSub0" value="0">0</label>
                  <label class="checkbox chk-mhrWork"><input type="checkbox" class="LvlSub" name="LvlSub1" value="1">1</label>
                  <label class="checkbox chk-mhrWork"><input type="checkbox" class="LvlSub" name="LvlSub2" value="2">2</label>
                  <label class="checkbox chk-mhrWork"><input type="checkbox" class="LvlSub" name="LvlSub3" value="3">3</label>
                  <label class="checkbox chk-mhrWork"><input type="checkbox" class="LvlSub" name="LvlSub4" value="4">4</label>
                  <label class="checkbox chk-mhrWork"><input type="checkbox" class="LvlSub" name="LvlSub5" value="5">5</label>
				</div>
				<div class="field is-horizontal">
					<input type="submit" class="button is-small is-primary sbm-btn" value="Simpan" style="margin:0 10px;" id="SaveSubMenu">
					<input type="submit" class="button is-small is-warning sbm-btn close-modal" value="Batal" style="margin:0 10px;">
				</div>
			</div>
		</div>
	</form>
  </div>
</div>

<div id="editMenu" class="modal">
  <div class="modal-background"></div>
  <div class="modal-content">
    		<div class="columns">
			<div class="column is-12">
				<div class="field is-horizontal">
					<label for="" class="label is-small identity">Parent Name</label>
					<input type="text" class="input is-small" value="" readonly>
				</div>
				<div class="field is-horizontal">
					<label for="" class="label is-small identity">Menu Name</label>
					<input type="text" class="input is-small" value="">
				</div>
				<div class="field is-horizontal">
					<label for="" class="label is-small identity">Menu URL</label>
					<input type="text" class="input is-small">
				</div>
				<div class="field is-horizontal">
					<label for="" class="label is-small identity" style="width: 97.97px;">Menu URL</label>
					<div class="select is-small">
                        <select>
                            <option selected="selected" value="1">Active</option>
                            <option value="0">Not Active</option>
                        </select>
                    </div>
				</div>
				<div class="field is-horizontal">
					<input type="submit" class="button is-small is-primary sbm-btn" value="Simpan" style="margin:0 10px;">
					<input type="submit" class="button is-small is-warning sbm-btn close-modal" value="Batal" style="margin:0 10px;">
				</div>
			</div>
		</div>
  </div>
</div>
</body>
<script src="../asset/js/cb.js"></script>
</html>
