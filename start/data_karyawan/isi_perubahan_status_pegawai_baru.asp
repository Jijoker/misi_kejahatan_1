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
                    Pemberitahuan Perubahan Status Pegawai
                </h4>
            </div>

            <div class="content-section first-section">
                <div class="columns">
                    <div class="column is-3">
                        <label for="" class="label is-small">Cabang Data</label>
                        <div class="select is-small dropdown-list">
                            <select name="" id="cabangPrb">
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
										<option <%if cabaGA = valcab then%> selected <%end if%> value="<%=valcab%>"><%=ketcab%></option>
									  <%
										oRec.movenext
										Loop
									oRec.Close
								  %>
                            </select>
                        </div>
                    </div>
                    <div class="column is-3">
                        <label for="" class="label is-small">Department</label>
                        <div class="select is-small dropdown-list">
                            <select name="" id="jabatanPrb">
									<%
										Set dbConn = server.createobject("ADODB.Connection")
										Conn="Driver={Microsoft Visual FoxPro Driver}; SourceType=DBF; BackgroundFetch=No; SourceDB="& Server.Mappath("/database/personel/data/personel")
										dbConn.Open Conn
										dbquery = "select * from department"
										Set dbRec = CreateObject("ADODB.RecordSet")
										dbRec.Open dbquery, dbConn
											do while not dbRec.EOF
											depId = trim(dbRec("Id"))
											depName = trim(dbRec("Depname"))
									%>
										<option <% if deptGA = depId then %> selected <%end if%> value="<%=depId%>"><%=depName%></option>
									<%
										dbRec.movenext
										Loop
										dbRec.close
									%>
                            </select>
                        </div>
                    </div>
                    <div class="column is-3">
                        <label for="" class="label is-small">Status Pegawai</label>
                        <div class="select is-small dropdown-list">
                            <select name="" id="statusPrb">
                                    <option value="1">Semua Status</option>
                                    <option selected="selected" value="2">Aktif</option>
                                    <option value="3">Resign</option>
                            </select>
                        </div>
                    </div>
                    
                </div>
                <div class="columns">
                    <div class="column is-3">
                        <label class="label is-small" for="">Nama Pegawai</label>
                        <div class="control is-horizontal">
                            <div class="select is-small dropdown-list">
                                <select name="" id="nama_pegawaiPrb">
                                    <option value=""></option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="column is-2">
                        <div style="height: 18px; margin-bottom: 0.5rem;"></div>
                        <input type="submit" class="button is-small is-link sbm-btn" value="Display Data" id="displayNama">
                    </div>
                </div>
            </div><!-- /.First_Section -->

            <hr class="hrd-divider">

            <div class="content-section second-section">
                <div class="field is-horizontal">
                    <label class="label is-small identity">NIP Karyawan</label>
                    <div class="control">
                        <input type="text" class="input is-small is-noborder" id="nipPrb" readonly>
                    </div>
                </div>

                <div class="field is-horizontal">
                    <label class="label is-small identity">Nama Karyawan</label>
                    <div class="control">
                        <input type="text" class="input is-small is-noborder" id="namaPrb" readonly>
                    </div>
                </div>

                <div class="field is-horizontal">
                    <label for="" class="label is-small identity">Jenis Perubahan</label>
                    <div class="control">
                        <label class="checkbox chk-mhrChange"><input type="checkbox">Gaji</label>
                        <label class="checkbox chk-mhrChange"><input type="checkbox">Demosi</label>
                        <label class="checkbox chk-mhrChange"><input type="checkbox">Mutasi</label>
                        <label class="checkbox chk-mhrChange"><input type="checkbox">Promosi</label>
                        <label class="checkbox chk-mhrChange"><input type="checkbox">Lain - Lain</label>
                    </div>
                </div>
            </div><!-- /.Second_Section -->

            <hr class="hrd-divider">

            <div class="content-section third-section">
                <div class="columns" style="margin-bottom: -1rem">
                    <div class="column is-3">
                        <label for="" class="label is-small">Hal</label>
                    </div>
                    <div class="column is-3">
                        <label for="" class="label is-small has-text-centered">Status Lama</label>
                    </div>
                    <div class="column is-3">
                        <label for="" class="label is-small has-text-centered">Status Baru</label>
                    </div>
                </div><!-- /.Columns -->
                <div class="columns" style="margin-bottom: -1rem">
                    <div class="column is-3">
                        <div class="field">
                            <label for="" class="label is-small">Jabatan</label>
                        </div>
                    </div>
                    <div class="column is-3">
                        <div class="control">
                            <div class="select is-small dropdown-list">
                                <select name="" id="jablama">
								<%
									Set jabConn = server.createobject("ADODB.Connection")
									ConnJab="Driver={Microsoft Visual FoxPro Driver}; SourceType=DBF; BackgroundFetch=No; SourceDB="& Server.Mappath("/database/personel/data/personel")
									jabConn.Open ConnJab
									jabquery = "select * from jabatan"
									Set jabRec = CreateObject("ADODB.RecordSet")
									jabRec.Open jabquery, jabConn
										do while not jabRec.EOF
										jabId = trim(jabRec("Id"))
										jabName = trim(jabRec("Jabname"))
								%>
									<option <% if jabGA = jabId then %> selected <%end if%> value="<%=jabId%>"><%=jabName%></option>
								<%
									jabRec.movenext
									Loop
									jabRec.close
								%>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="column is-3">
                        <div class="control">
                            <div class="select is-small dropdown-list">
                                <select name="" id="jabbaru">
								<%
									Set jabConn = server.createobject("ADODB.Connection")
									ConnJab="Driver={Microsoft Visual FoxPro Driver}; SourceType=DBF; BackgroundFetch=No; SourceDB="& Server.Mappath("/database/personel/data/personel")
									jabConn.Open ConnJab
									jabquery = "select * from jabatan"
									Set jabRec = CreateObject("ADODB.RecordSet")
									jabRec.Open jabquery, jabConn
										do while not jabRec.EOF
										jabId = trim(jabRec("Id"))
										jabName = trim(jabRec("Jabname"))
								%>
									<option <% if jabGA = jabId then %> selected <%end if%> value="<%=jabId%>"><%=jabName%></option>
								<%
									jabRec.movenext
									Loop
									jabRec.close
								%>
                                </select>
                            </div>
                        </div>
                    </div>
                </div><!-- /.Columns -->
                <div class="columns" style="margin-bottom: -1rem">
                    <div class="column is-3">
                        <div class="field">
                            <label for="" class="label is-small">Divisi</label>
                        </div>
                    </div>
                    <div class="column is-3">
                        <div class="control">
                            <div class="select is-small dropdown-list">
                                <select name="" id="deplama">
									<%
										Set dbConn = server.createobject("ADODB.Connection")
										Conn="Driver={Microsoft Visual FoxPro Driver}; SourceType=DBF; BackgroundFetch=No; SourceDB="& Server.Mappath("/database/personel/data/personel")
										dbConn.Open Conn
										dbquery = "select * from department"
										Set dbRec = CreateObject("ADODB.RecordSet")
										dbRec.Open dbquery, dbConn
											do while not dbRec.EOF
											depId = trim(dbRec("Id"))
											depName = trim(dbRec("Depname"))
									%>
										<option <% if deptGA = depId then %> selected <%end if%> value="<%=depId%>"><%=depName%></option>
									<%
										dbRec.movenext
										Loop
										dbRec.close
									%>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="column is-3">
                        <div class="control">
                            <div class="select is-small dropdown-list">
                                <select name="" id="depbaru">
									<%
										Set dbConn = server.createobject("ADODB.Connection")
										Conn="Driver={Microsoft Visual FoxPro Driver}; SourceType=DBF; BackgroundFetch=No; SourceDB="& Server.Mappath("/database/personel/data/personel")
										dbConn.Open Conn
										dbquery = "select * from department"
										Set dbRec = CreateObject("ADODB.RecordSet")
										dbRec.Open dbquery, dbConn
											do while not dbRec.EOF
											depId = trim(dbRec("Id"))
											depName = trim(dbRec("Depname"))
									%>
										<option <% if deptGA = depId then %> selected <%end if%> value="<%=depId%>"><%=depName%></option>
									<%
										dbRec.movenext
										Loop
										dbRec.close
									%>
                                </select>
                            </div>
                        </div>
                    </div>
                </div><!-- /.Columns -->
                <div class="columns" style="margin-bottom: -1rem">
                    <div class="column is-3">
                        <div class="field">
                            <label for="" class="label is-small">Gaji/Upah per bulan</label>
                        </div>
                    </div>
                    <div class="column is-3">
                        <div class="control">
                            <input type="text" class="input is-small" id="gplama">
                        </div>
                    </div>
                    <div class="column is-3">
                        <div class="control">
                            <input type="text" class="input is-small" id="gpbaru">
                        </div>
                    </div>
                </div><!-- /.Columns -->
                <div class="columns" style="margin-bottom: -1rem">
                    <div class="column is-3">
                        <div class="field">
                            <label for="" class="label is-small">Tunjangan Aktivitas per hari masuk</label>
                        </div>
                    </div>
                    <div class="column is-3">
                        <div class="control">
                            <input type="text" class="input is-small" id="talama">
                        </div>
                    </div>
                    <div class="column is-3">
                        <div class="control">
                            <input type="text" class="input is-small" id="tabaru">
                        </div>
                    </div>
                </div><!-- /.Columns -->
                <div class="columns" style="margin-bottom: -1rem">
                    <div class="column is-3">
                        <div class="field">
                            <label for="" class="label is-small">Service Charge</label>
                        </div>
                    </div>
                    <div class="column is-3">
                        <div class="control">
                            <input type="text" class="input is-small" id="sclama">
                        </div>
                    </div>
                    <div class="column is-3">
                        <div class="control">
                            <input type="text" class="input is-small" id="scbaru">
                        </div>
                    </div>
                </div><!-- /.Columns -->
                <div class="columns">
                    <div class="column is-3">
                        <div class="field">
                            <label for="" class="label is-small">Lain - Lain</label>
                        </div>
                    </div>
                    <div class="column is-3">
                        <div class="control">
                            <input type="text" class="input is-small" id="lalama">
                        </div>
                    </div>
                    <div class="column is-3">
                        <div class="control">
                            <input type="text" class="input is-small" id="labaru">
                        </div>
                    </div>
                </div><!-- /.Columns -->
                <div class="columns">
                    <div class="column is-3">
                        <div class="field">
                            <label for="" class="label is-small">Total Penerimaan</label>
                        </div>
                    </div>
                    <div class="column is-3">
                        <div class="control">
                            <input type="text" class="input is-small is-primary" id="totlama">
                        </div>
                    </div>
                    <div class="column is-3">
                        <div class="control">
                            <input type="text" class="input is-small is-primary" id="totbaru">
                        </div>
                    </div>
                </div><!-- /.Columns -->
                <div class="columns">
                    <div class="column is-3">
                        <div class="field">
                            <label for="" class="label is-small">Berlaku Mulai Tanggal</label>
                        </div>
                    </div>
                    <div class="column is-2">
                        <div class="control">
                            <input type="text" class="input is-small" placeholder="mm/dd/yyyy" id="tglberlaku">
                        </div>
                    </div>
                </div><!-- /.Columns -->

                <div class="columns">
                    <div class="column is-3">
                        <label for="" class="label is-small">Evaluasi oleh</label>
                        <div class="control">
                            <input type="text" class="input is-small" id="evaluasi_o">
                        </div>
                    </div>
                    <div class="column is-3">
                        <label for="" class="label is-small">Rekomendasi oleh</label>
                        <div class="control">
                            <input type="text" class="input is-small" id="rekomendasi_o">
                        </div>
                    </div>
                    <div class="column is-3">
                        <label for="" class="label is-small">Disetujui oleh</label>
                        <div class="control">
                            <input type="text" class="input is-small" id="setuju_o">
                        </div>
                    </div>
                </div>
            </div>

            <div class="columns">
              <div class="column">
                <div class="field is-horizontal">
                  <input type="submit" class="button is-small custom-btn is-link" value="Simpan Data">
                  <input type="submit" class="button is-small custom-btn is-danger" value="Batal">
                  <input type="submit" class="button is-small custom-btn" value="Hapus">
                </div>
              </div>
            </div>

<script src="../asset/js/cb.js"></script>
<%
else
%>
	<!-- #INCLUDE virtual="/hrd2/start/restricted.asp" -->
<%
end if
%>