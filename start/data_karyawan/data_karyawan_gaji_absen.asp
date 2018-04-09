<%
if not trim(request.cookies("userhrd")) = "" then
%>
            <nav class="breadcrumb is-small breadcrumb-navigation" style="margin-bottom: 5px;">
                <ul>
                    <li><a href="#">Home</a></li>
                    <li class="is-active"><a href="#">Data Karyawan</a></li>
                </ul>
            </nav>

            <div class="field column">
                <h4 class="title is-4">
                    Daftar Pegawai (Gaji + Absen)
                </h4>
            </div>

            <div class="dropdown-employee form-area">
                <div class="field column is-12" style="margin: 0;">
                    <label class="label is-small">Cabang Data</label>
                    <div class="select is-small">
                    <select id="cabGA">
                        <%
						set oconn2 = server.createobject("adodb.connection")
						Conn2="Driver={Microsoft Visual FoxPro Driver}; SourceType=DBF ;BackgroundFetch=No ;SourceDB="& Server.Mappath( "/database/personel/data/" )
						oConn2.Open Conn2
						sqlcb = "select * from cabang"
						Set oRec=CreateObject("ADODB.RecordSet")
						oRec.OPEN sqlcb,oConn2
							do while not oRec.EOF
							ketcab = trim(oRec("ket"))
							valcab = trim(oRec("cab"))
						  %>
						  	<option value="<%=valcab%>"><%=ketcab%></option>
						  <%
						  	oRec.movenext
							Loop
				  		oRec.Close
						  %>
                    </select>
                    </div>
                </div>
                <div class="field column is-12" style="margin: 0;">
                        <label class="label is-small">Departemen</label>
                        <div class="select is-small" style="margin-left: 12px; width: 198px;">
                        <select style="width: 198px;" id="depGA">
                        	<%
						  set oconn = server.createobject("adodb.connection")
						  Conn="Driver={Microsoft Visual FoxPro Driver}; SourceType=DBF ;BackgroundFetch=No ;SourceDB="& Server.Mappath( "/database/personel/data/personel/") 
						  oConn.Open Conn
							sql = "select * from department"
							Set oRec=CreateObject("ADODB.RecordSet")
							oRec.OPEN sql, Conn
							do while not oRec.EOF
								depname = trim(oRec("depname"))
								iddep = trim(oRec("id"))
						  %>
                              <option <%if deptGA = iddep then%> selected <%end if%> value="<%=iddep%>"><%=depname%></option>
						  <%
						  		oRec.movenext
							Loop
							oRec.Close
						  %>
                        	<option selected value="0">&lt;Semua&gt;</option>
                        </select>
                    </div>
                </div>
                <div class="field column is-12" style="margin: 0;">
                        <label class="label is-small">Jenis Pegawai</label>
                        <div class="select is-small" style="margin-left: 6px; width: 110px;">
                        <select style="width: 110px;" id="jenisGA">
                            <option value="semua">Semua Jenis</option>
                        	<option value="permanen">Permanen</option>
                        	<option value="kontrak">Kontrak</option>
                        	<option value="-">-</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="dropdown-employee form-area">
                <div class="field column is-12" style="margin: 0;">
                    <label class="label is-small">NIP Pegawai</label>
                      <div class="control" style="display: inline;">
                        <input class="input is-small" name="" value="" type="text" style="width: 198px;" id="nipGA">
                      </div>
                </div>
                <div class="field column is-12" style="margin: 0;">
                        <label class="label is-small">Nama Pegawai</label>
                        <div class="control" style="display: inline;">
                          <input class="input is-small" name="" value="" type="text" style="width: 198px;" id="namaGA">
                        </div>
                </div>
                <div class="field column is-12" style="margin: 0;">
                        <label class="label is-small">Status Pegawai</label>
                        <div class="select is-small">
                        <select id="statusGA">
                            <option value="1">Semua Status</option>
                        	<option selected="selected" value="2">Aktif</option>
                        	<option value="3">Resign</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="field column is-5">
                <input type="submit" class="button is-small is-link submit-button" value="Display Data" id="displayGA">
            </div>

            <div class="field column is-12">
                <a href="" class="button is-small is-warning" style="font-size: 0.6rem; float: right;">
                    <i class="fa fa-file-excel-o" aria-hidden="true" style="margin-right: 6px;"></i>
                    Export ke Excel
                </a>
                <table class="table is-bordered is-narrow is-fullwidth">
                    <thead>
                        <tr class="is-selected">
                            <th style="text-align: center; font-size: 12px;">NIP</th>
                            <th style="text-align: center; font-size: 12px;">Nama Karyawan</th>
                            <th style="text-align: center; font-size: 12px;">Pajak</th>
                            <th style="text-align: center; font-size: 12px;">Department</th>
                            <th style="text-align: center; font-size: 12px;">Awal Bekerja</th>
                            <th style="text-align: center; font-size: 12px;">Mulai Bekerja</th>
                            <th style="text-align: center; font-size: 12px;">Sampai Bekerja</th>
                            <th style="text-align: center; font-size: 12px;">Machine + Enroll</th>
                            <th style="text-align: center; font-size: 12px;">Pola Libur</th>
                            <th style="text-align: center; font-size: 12px;">Bulan Kerja</th>
                            <th style="text-align: center; font-size: 12px;">Jenis</th>
                            <th style="text-align: center; font-size: 12px;">No. Rek BCA</th>
                            <th style="text-align: center; font-size: 12px;">No.Rek Mandiri</th>
                            <th></th>
                        </tr>
                    </thead>
					<tbody id="trBody" style="font-size: 10px;">
						<!---script di proses.asp--->
                    </tbody>
                </table>
            </div>
<script src="../asset/js/cb.js"></script>
<%
else
%>
<!-- #INCLUDE virtual="/hrd2/start/restricted.asp" -->
<%
end if
%>