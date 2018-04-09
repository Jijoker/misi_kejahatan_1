<%
if not trim(request.cookies("userhrd")) = "" then

nip = trim(request("nipga"))
if not nip = "" then
	readonly = "readonly"
	set oconn = server.createobject("adodb.connection")
	Conn="Driver={Microsoft Visual FoxPro Driver}; SourceType=DBF ;BackgroundFetch=No ;SourceDB="& Server.Mappath( "/database/personel/data/personel/") 
	oConn.Open Conn
	Set data01=CreateObject("ADODB.RecordSet")
		sql01 = "select * from employee where empcode = '"&nip&"'"
		data01.OPEN sql01, oConn
		nipGA = trim(data01("empcode"))
		namaGA = trim(data01("nama"))
		cabaGA = trim(data01("cab"))
		deptGA = trim(data01("depcode"))
		jabGA = trim(data01("jabcode"))
		atsGA = trim(data01("atasan"))
		stasGA = trim(data01("status"))
		skGA = data01("s_kerja")
		if skGA = cdate("12:00:00 AM") then
			skGA = ""
		else
			skGA = skGA
		end if
		mkGA = data01("m_kerja")
		if mkGA = cdate("12:00:00 AM") then
			mkGA = ""
		else
			mkGA = mkGA
		end if
		msGA = data01("m_sampai")
		if msGA = cdate("12:00:00 AM") then
			msGA = ""
		else
			msGA = msGA
		end if
		mailGA = trim(data01("email"))
		bosGA = trim(data01("bos"))
		mrollGA1 = trim(data01("machine"))
		enrollGA1 = trim(data01("enroll"))
		cabrollGA1 = trim(data01("cabenroll"))
		mrollGA2 = trim(data01("machine2"))
		enrollGA2 = trim(data01("enroll2"))
		cabrollGA2 = trim(data01("cabenroll2"))
		mrollGA3 = trim(data01("machine3"))
		enrollGA3 = trim(data01("enroll3"))
		cabrollGA3 = trim(data01("cabenroll3"))
		mrollGA4 = trim(data01("machine4"))
		enrollGA4 = trim(data01("enroll4"))
		cabrollGA4 = trim(data01("cabenroll4"))
		kerjaGA = trim(data01("hr_kerja"))
		pola_lbrGA = trim(data01("pola_libur"))
		if isnumeric(pola_lbrGA)  = True then
			pola_numGA = pola_lbrGA
			polburGA = ""
		else
			pola_numGA = ""
			polburGA = split(pola_lbrGA,",")
			kiw = ubound(polburGA) - 1 %>
			<script>
			<%for i=0 to kiw%>
				$("#<%=polburGA(i)%>").attr('checked', true);
			<%next%>
			</script>
		<%	
		end if
		libnasGA = trim(data01("lib_nas"))
		gapokGA = trim(data01("salary_rp"))
		tpgapokGA = trim(data01("salary_tp"))
		taGA = trim(data01("active_rp"))
		tptaGA = trim(data01("active_tp"))
		transGA = trim(data01("trans_rp"))
		tptransGA = trim(data01("trans_tp"))
		mdcGA = trim(data01("medic_rp"))
		tpmdcGA = trim(data01("medic_tp"))
		insGA = trim(data01("inscut_rp"))
		tpinsGA = trim(data01("inscut_tp"))
		tjtGA = trim(data01("tunjt_rp"))
		tptjtGA = trim(data01("tunjt_tp"))
		sctGA = trim(data01("sct_rp"))
		tpsctGA = trim(data01("sct_tp"))
		jamcGA = trim(data01("jamcut_rp"))
		tpjamcGA = trim(data01("jamcut_tp"))
		pjkGA = trim(data01("pajak"))
		bcaGA = trim(data01("bank_acc"))
		nobcaGA = trim(data01("acc_acc"))
		mdrGA = trim(data01("bank_acc2"))
		nomdrGA = trim(data01("acc_acc2"))
		bkesGA = trim(data01("id_bpjskes"))
		btkGA = trim(data01("id_bpjsten"))
		disable = "disabled"
		data01.close
	oConn.close
else
	nipGA = "-"
	gapokGA = 0
	taGA = 0 
	transGA = 0
	mdcGA = 0
	insGA = 0 
	tjtGA = 0 
	sctGA = 0
	disable = ""
end if
%>
			<nav class="breadcrumb is-small breadcrumb-navigation" style="margin-bottom: 5px;">
                <ul>
                    <li><a href="">Home</a></li>
                    <li class="is-active"><a href="#">Data Karyawan</a></li>
                </ul>
            </nav>

            <div class="field column">
                <h4 class="title is-4">
                    Data Pegawai / Karyawan
                </h4>
            </div>

            <div class="content-section first-section">
              <div class="field is-horizontal">
                <label class="label is-small identity">No Induk Pegawai</label>
                <div class="control">
                  <input type="text" id="nipikb" class="input is-small is-noborder" readonly  value="<%=nipGA%>">
                </div>
              </div>

              <div class="field is-horizontal">
                <label class="label is-small identity">Nama Karyawan</label>
                <div class="control">
                  <input type="text" id="namaikb" class="input is-small" value="<%=namaGA%>">
                </div>
              </div>
                <div class="columns">
                  <div class="column is-3">
                    <label for="" class="label is-small">Cabang Data</label>
                      <div class="control">
                        <div class="select is-small dropdown-list">
                          <select name="" id="cabikb">
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
                  </div>
                  <div class="column is-3">
                    <label for="" class="label is-small">Department</label>
                      <div class="control">
                        <div class="select is-small dropdown-list">
                          <select name="" id="deptikb">
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
                          </select>
                        </div>
                      </div>
                  </div>
                  <div class="column is-3">
                    <label for="" class="label is-small">Jabatan</label>
                      <div class="control">
                        <div class="select is-small dropdown-list">
                          <select name="" id="jabikb">
						  <%
							sql = "select * from jabatan"
							Set oRec=CreateObject("ADODB.RecordSet")
							oRec.OPEN sql, Conn
							do while not oRec.EOF
								jabname = trim(oRec("jabname"))
								idjab = trim(oRec("id"))
						  %>
                              <option <%if jabGA = idjab then%> selected <%end if%> value="<%=idjab%>"><%=jabname%></option>
						  <%
						  		oRec.movenext
							Loop
							oRec.Close
						  %>
                          </select>
                        </div>
                      </div>
                  </div>
                  <div class="column is-3">
                    <label for="" class="label is-small">Atasan/Penanggung Jawab</label>
                      <div class="control">
                        <div class="select is-small dropdown-list">
                          <select name="" id="atasanikb">
                              <option value="">None.</option>
						  <%
							sql = "select * from employee where resign = 0 AND bos = 1"
							Set oRec=CreateObject("ADODB.RecordSet")
							oRec.OPEN sql, Conn
							do while not oRec.EOF
								atsname = trim(oRec("nama"))
								atsnip = trim(oRec("empcode"))
						  %>
                              <option <%if atsGA = atsnip then%> selected <%end if%> value="<%=atsnip%>"><%=atsname%></option>
						  <%
						  		oRec.movenext
							Loop
							oRec.Close
						  %>
                          </select>
                        </div>
                      </div>
                  </div>
                </div><!-- /.columns -->

                <div class="columns">
                  <div class="column is-3">
                    <label for="" class="label is-small">Status Karyawan</label>
                      <div class="control">
                        <div class="select is-small dropdown-list">
                          <select name="" id="stakarikb">
                              <option <%if stasGA = "Permanen" then%> selected <%end if%> value="Permanen">Permanen</option>
                              <option <%if stasGA = "Kontrak" then%> selected <%end if%> value="Kontrak">Kontrak</option>
                              <option <%if stasGA = "-" then%> selected <%end if%> value="-">Percobaan</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  <div class="column is-3">
                    <label for="" class="label is-small">Awal Mulai Bekerja</label>
                      <div class="control">
                        <input type="text" class="input is-small datepick" placeholder="mm/dd/yyyy" id="skerjaikb" value="<%=skGA%>">
                      </div>
                    </div>
                  <div class="column is-6">
                    <label for="" class="label is-small">Periode Mulai Bekerja</label>
                      <div class="control is-horizontal">
                        <input type="text" class="input is-small period datepick" placeholder="mm/dd/yyyy" id="mkerjaikb" value="<%=mkGA%>">
						<small>sampai</small>
                        <input type="text" class="input is-small period datepick" placeholder="mm/dd/yyyy" id="msampaiikb" value="<%=msGA%>">
                      </div>
                    </div>
                </div><!-- /.columns -->

                <div class="columns">
                  <div class="column is-3">
                    <label class="label is-small" for="">Email Company</label>
                    <div class="control">
                      <input type="text" class="input is-small" id="mailikb" value="<%=mailGA%>">
                    </div>
                  </div>
                  <div class="column is-3">
                    <label class="label is-small" for="">Memiliki Bawahan/Anak Buah</label>
                    <div class="control">
                      <div class="select is-small dropdown-list">
                        <select class="" id="bawahikb">
                            <option <%if bosGA = 0 then%> selected <%end if%> value="0">Tidak</option>
                            <option <%if bosGA = 1 then%> selected <%end if%> value="1">Ya</option>
                        </select>
                      </div>
                    </div>
                  </div>
                </div><!-- /.columns -->
            </div><!-- /.First-Section -->

            <div class="content-section second-section">
              <label for="" class="label is-small title-label">Finger Print ID</label>
              <div class="columns main-column">
                <div class="column is-2">
                  <label class="label is-small" for=""><strong>1. </strong>No. Machine</label>
                  <div class="control">
                    <div class="select is-small dropdown-list">
                      <select class="" id="mrollikb1">
                          <option <%if mrollGA1 = 0 then%> selected <%end if%> value="0">Machine-1</option>
                          <option <%if mrollGA1 = 1 then%> selected <%end if%> value="1">Machine-2</option>
                          <option <%if mrollGA1 = 2 then%> selected <%end if%> value="2">Machine-3</option>
                          <option <%if mrollGA1 = 3 then%> selected <%end if%> value="3">Machine-4</option>
                          <option <%if mrollGA1 = 4 then%> selected <%end if%> value="4">Machine-5</option>
                          <option <%if mrollGA1 = 5 then%> selected <%end if%> value="5">Machine-6</option>
                          <option <%if mrollGA1 = 6 then%> selected <%end if%> value="6">Machine-7</option>
                          <option <%if mrollGA1 = 7 then%> selected <%end if%> value="7">Machine-8</option>
                          <option <%if mrollGA1 = 8 then%> selected <%end if%> value="8">Machine-9</option>
                          <option <%if mrollGA1 = 9 then%> selected <%end if%> value="9">Machine-10</option>
                          <option <%if mrollGA1 = 10 then%> selected <%end if%> value="10">Machine-11</option>
                          <option <%if mrollGA1 = 11 then%> selected <%end if%> value="11">Machine-12</option>
                          <option <%if mrollGA1 = 12 then%> selected <%end if%> value="12">Machine-13</option>
                          <option <%if mrollGA1 = 13 then%> selected <%end if%> value="13">Machine-14</option>
                          <option <%if mrollGA1 = 14 then%> selected <%end if%> value="14">Machine-15</option>
                          <option <%if mrollGA1 = 15 then%> selected <%end if%> value="15">Machine-16</option>
                        </select>
                    </div>
                  </div>
                </div>
                <div class="column is-1">
                  <label class="label is-small" for="">No. Enroll</label>
                  <div class="control">
                    <input type="text" class="input is-small" id="noenroll1" value="<%=enrollGA1%>">
                  </div>
                </div>
                <div class="column is-2">
                  <label class="label is-small" for="">Cabang terdaftar</label>
                  <div class="control">
                    <div class="select is-small dropdown-list">
                      <select class="" id="cabroll1">
                         <%
						sqlcb = "select * from cabang"
						Set oRec=CreateObject("ADODB.RecordSet")
						oRec.OPEN sqlcb,oConn2
							do while not oRec.EOF
							ketcab = trim(oRec("ket"))
							valcab = trim(oRec("cab"))
						  %>
						  	<option <%if cabrollGA1 = valcab then%> selected <%end if%> value="<%=valcab%>"><%=ketcab%></option>
						  <%
						  	oRec.movenext
							Loop
				  		oRec.Close
						  %>
                       </select>
                    </div>
                  </div>
                </div>
                <div class="column is-3">
                  <label class="label is-small" for="">Card ID</label>
                  <div class="control">
                    <input type="text" class="input is-small">
                  </div>
                </div>
              </div><!-- /.Main-Column -->

              <div class="columns-wrapper">
                <article class="message is-warning">
                  <div class="message-header">
                    Note
                  </div>
                  <div class="message-body">
                    Multi Finger ID (Diisi jika Pegawai terdaftar dalam Mesin Cabang Lain)
                  </div>
                </article>
                <div class="columns sub-columns">
                  <div class="column is-2">
                    <label class="label is-small" for=""><strong>2. </strong>No. Machine</label>
                    <div class="control">
                      <div class="select is-small dropdown-list">
                        <select class="" id="mrollikb2">
                          <option <%if mrollGA2 = 0 then%> selected <%end if%> value="0">Machine-1</option>
                          <option <%if mrollGA2 = 1 then%> selected <%end if%> value="1">Machine-2</option>
                          <option <%if mrollGA2 = 2 then%> selected <%end if%> value="2">Machine-3</option>
                          <option <%if mrollGA2 = 3 then%> selected <%end if%> value="3">Machine-4</option>
                          <option <%if mrollGA2 = 4 then%> selected <%end if%> value="4">Machine-5</option>
                          <option <%if mrollGA2 = 5 then%> selected <%end if%> value="5">Machine-6</option>
                          <option <%if mrollGA2 = 6 then%> selected <%end if%> value="6">Machine-7</option>
                          <option <%if mrollGA2 = 7 then%> selected <%end if%> value="7">Machine-8</option>
                          <option <%if mrollGA2 = 8 then%> selected <%end if%> value="8">Machine-9</option>
                          <option <%if mrollGA2 = 9 then%> selected <%end if%> value="9">Machine-10</option>
                          <option <%if mrollGA2 = 10 then%> selected <%end if%> value="10">Machine-11</option>
                          <option <%if mrollGA2 = 11 then%> selected <%end if%> value="11">Machine-12</option>
                          <option <%if mrollGA2 = 12 then%> selected <%end if%> value="12">Machine-13</option>
                          <option <%if mrollGA2 = 13 then%> selected <%end if%> value="13">Machine-14</option>
                          <option <%if mrollGA2 = 14 then%> selected <%end if%> value="14">Machine-15</option>
                          <option <%if mrollGA2 = 15 then%> selected <%end if%> value="15">Machine-16</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="column is-1">
                    <label class="label is-small" for="">No. Enroll</label>
                    <div class="control">
                      <input type="text" class="input is-small" id="noenroll2" value="<%=enrollGA2%>">
                    </div>
                  </div>
                  <div class="column is-2">
                    <label class="label is-small" for="">Cabang terdaftar</label>
                    <div class="control">
                      <div class="select is-small dropdown-list">
                        <select class="" id="cabroll2">
                            <%
						sqlcb = "select * from cabang"
						Set oRec=CreateObject("ADODB.RecordSet")
						oRec.OPEN sqlcb,oConn2
							do while not oRec.EOF
							ketcab = trim(oRec("ket"))
							valcab = trim(oRec("cab"))
						  %>
						  	<option <%if cabrollGA2 = valcab then%> selected <%end if%> value="<%=valcab%>"><%=ketcab%></option>
						  <%
						  	oRec.movenext
							Loop
				  		oRec.Close
						  %>
                          </select>
                      </div>
                    </div>
                  </div>
                </div><!-- /.Sub-Columns -->

                <div class="columns sub-columns">
                  <div class="column is-2">
                    <label class="label is-small" for=""><strong>3. </strong>No. Machine</label>
                    <div class="control">
                      <div class="select is-small dropdown-list">
                        <select class="" id="mrollikb3">
                          <option <%if mrollGA3 = 0 then%> selected <%end if%> value="0">Machine-1</option>
                          <option <%if mrollGA3 = 1 then%> selected <%end if%> value="1">Machine-2</option>
                          <option <%if mrollGA3 = 2 then%> selected <%end if%> value="2">Machine-3</option>
                          <option <%if mrollGA3 = 3 then%> selected <%end if%> value="3">Machine-4</option>
                          <option <%if mrollGA3 = 4 then%> selected <%end if%> value="4">Machine-5</option>
                          <option <%if mrollGA3 = 5 then%> selected <%end if%> value="5">Machine-6</option>
                          <option <%if mrollGA3 = 6 then%> selected <%end if%> value="6">Machine-7</option>
                          <option <%if mrollGA3 = 7 then%> selected <%end if%> value="7">Machine-8</option>
                          <option <%if mrollGA3 = 8 then%> selected <%end if%> value="8">Machine-9</option>
                          <option <%if mrollGA3 = 9 then%> selected <%end if%> value="9">Machine-10</option>
                          <option <%if mrollGA3 = 10 then%> selected <%end if%> value="10">Machine-11</option>
                          <option <%if mrollGA3 = 11 then%> selected <%end if%> value="11">Machine-12</option>
                          <option <%if mrollGA3 = 12 then%> selected <%end if%> value="12">Machine-13</option>
                          <option <%if mrollGA3 = 13 then%> selected <%end if%> value="13">Machine-14</option>
                          <option <%if mrollGA3 = 14 then%> selected <%end if%> value="14">Machine-15</option>
                          <option <%if mrollGA3 = 15 then%> selected <%end if%> value="15">Machine-16</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="column is-1">
                    <label class="label is-small" for="">No. Enroll</label>
                    <div class="control">
                      <input type="text" class="input is-small" id="noenroll3" value="<%=enrollGA3%>">
                    </div>
                  </div>
                  <div class="column is-2">
                    <label class="label is-small" for="">Cabang terdaftar</label>
                    <div class="control">
                      <div class="select is-small dropdown-list">
                        <select class="" id="cabroll3">
                            <%
						sqlcb = "select * from cabang"
						Set oRec=CreateObject("ADODB.RecordSet")
						oRec.OPEN sqlcb,oConn2
							do while not oRec.EOF
							ketcab = trim(oRec("ket"))
							valcab = trim(oRec("cab"))
						  %>
						  	<option <%if cabrollGA3 = valcab then%> selected <%end if%> value="<%=valcab%>"><%=ketcab%></option>
						  <%
						  	oRec.movenext
							Loop
				  		oRec.Close
						  %>
                          </select>
                      </div>
                    </div>
                  </div>
                </div><!-- /.Sub-Columns -->

                <div class="columns sub-columns">
                  <div class="column is-2">
                    <label class="label is-small" for=""><strong>4. </strong>No. Machine</label>
                    <div class="control">
                      <div class="select is-small dropdown-list">
                        <select class="" id="mrollikb4">
                          <option <%if mrollGA4 = 0 then%> selected <%end if%> value="0">Machine-1</option>
                          <option <%if mrollGA4 = 1 then%> selected <%end if%> value="1">Machine-2</option>
                          <option <%if mrollGA4 = 2 then%> selected <%end if%> value="2">Machine-3</option>
                          <option <%if mrollGA4 = 3 then%> selected <%end if%> value="3">Machine-4</option>
                          <option <%if mrollGA4 = 4 then%> selected <%end if%> value="4">Machine-5</option>
                          <option <%if mrollGA4 = 5 then%> selected <%end if%> value="5">Machine-6</option>
                          <option <%if mrollGA4 = 6 then%> selected <%end if%> value="6">Machine-7</option>
                          <option <%if mrollGA4 = 7 then%> selected <%end if%> value="7">Machine-8</option>
                          <option <%if mrollGA4 = 8 then%> selected <%end if%> value="8">Machine-9</option>
                          <option <%if mrollGA4 = 9 then%> selected <%end if%> value="9">Machine-10</option>
                          <option <%if mrollGA4 = 10 then%> selected <%end if%> value="10">Machine-11</option>
                          <option <%if mrollGA4 = 11 then%> selected <%end if%> value="11">Machine-12</option>
                          <option <%if mrollGA4 = 12 then%> selected <%end if%> value="12">Machine-13</option>
                          <option <%if mrollGA4 = 13 then%> selected <%end if%> value="13">Machine-14</option>
                          <option <%if mrollGA4 = 14 then%> selected <%end if%> value="14">Machine-15</option>
                          <option <%if mrollGA4 = 15 then%> selected <%end if%> value="15">Machine-16</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="column is-1">
                    <label class="label is-small" for="">No. Enroll</label>
                    <div class="control">
                      <input type="text" class="input is-small" id="noenroll4" value="<%=enrollGA4%>">
                    </div>
                  </div>
                  <div class="column is-2">
                    <label class="label is-small" for="">Cabang terdaftar</label>
                    <div class="control">
                      <div class="select is-small dropdown-list">
                        <select class="" id="cabroll4">
                            <%
						sqlcb = "select * from cabang"
						Set oRec=CreateObject("ADODB.RecordSet")
						oRec.OPEN sqlcb,oConn2
							do while not oRec.EOF
							ketcab = trim(oRec("ket"))
							valcab = trim(oRec("cab"))
						  %>
						  	<option <%if cabrollGA4 = valcab then%> selected <%end if%> value="<%=valcab%>"><%=ketcab%></option>
						  <%
						  	oRec.movenext
							Loop
				  		oRec.Close
						oConn2.close
						  %>
                          </select>
                      </div>
                    </div>
                  </div>
                </div><!-- /.Sub-Columns -->
              </div><!-- /.Columns-Wrapper -->
            </div><!-- /.Second-Section -->

            <div class="content-section third-section">
              <label for="" class="label is-small title-label">Model Jam Kerja & Hari Libur</label>
              <div class="columns choose-columns">
                <div class="column is-2">
                  <label for="" class="label is-small">Jenis Libur Karyawan</label>
                </div>
                <div class="column is-1">
                  <label class="radio label-mhrWork"><input type="radio" name="mhrKerja" <%if kerjaGA = "1" then%>checked<%end if%> value="1" onclick="disableFunc('1')">Libur Tetap</label>
                </div>
                <div class="column is-9">
                  <label class="checkbox chk-mhrWork"><input type="checkbox" id="Sa" value="Sa" >Sabtu</label>
                  <label class="checkbox chk-mhrWork"><input type="checkbox" id="Su" value="Su" >Minggu</label>
                  <label class="checkbox chk-mhrWork"><input type="checkbox" id="Mo" value="Mo" >Senin</label>
                  <label class="checkbox chk-mhrWork"><input type="checkbox" id="Tu" value="Tu" >Selasa</label>
                  <label class="checkbox chk-mhrWork"><input type="checkbox" id="We" value="We" >Rabu</label>
                  <label class="checkbox chk-mhrWork"><input type="checkbox" id="Th" value="Th" >Kamis</label>
                  <label class="checkbox chk-mhrWork"><input type="checkbox" id="Fr" value="Fr" >Jumat</label>
                </div>
              </div>
              <div class="columns choose-columns">
                <span class="column is-2"></span>
                <div class="column is-10">
                  <div class="field is-horizontal">
                    <label class="radio label-mhrWork"><input type="radio" name="mhrKerja" <%if kerjaGA = "2" then%>checked<%end if%> value="2" onclick="disableFunc('2')">Libur dalam Jumlah Hari</label><input type="text" class="input is-small input-mhrWork" value="<%=pola_numGA%>" id="dayWork"><span class="label-mhrWork">hari dalam satu periode penggajian</span>
                  </div>
                </div>
              </div>
              <div class="columns choose-columns">
                <span class="column is-2"></span>
                <div class="column is-10">
                  <div class="field is-horizontal">
                    <label class="radio label-mhrWork"><input type="radio" name="mhrKerja" <%if kerjaGA = "0" then%>checked<%end if%> value="0" onclick="disableFunc('0')">None (Semua hari masuk)</label>
                  </div>
                </div>
              </div>
              <div class="columns choose-columns">
                <div class="column is-2">
                  <label for="" class="label is-small">Terpengaruh Libur Nasional</label>
                </div>
                <div class="column is-2">
                  <label class="checkbox chk-mhrWork"><input type="checkbox" <%if libnasGA="1" then%> checked <%end if%> >Ya</label>
                </div>
              </div>
            </div><!-- /.Third-Section -->

            <div class="content-section fourth-section">
              <label for="" class="label is-small title-label">Gaji & Pendapatan</label>
              <div class="columns sub-fourth-columns">
                <div class="column is-1 label-mhrGP">
                  <label class="label is-small">Gaji Pokok</label>
                </div>
                <div class="column is-4 area-mhrGP">
                  <div class="field is-horizontal">
                    <input type="text" class="input is-small mhrGP" value="<%=gapokGA%>">
                    <label class="radio input-mhrGP"><input type="radio" name="mR1" <%if tpgapokGA= "1" then%>checked<%end if%> value="1">Per Bulan</label>
                    <label class="radio input-mhrGP"><input type="radio" name="mR1" <%if tpgapokGA= "2" then%>checked<%end if%> value="2">Per Hari Kerja</label>
                    <label class="radio input-mhrGP"><input type="radio" name="mR1" <%if tpgapokGA= "0" then%>checked<%end if%> value="0">None</label>
                  </div>
                </div>
                <div class="column is-7">
                  <div class="field is-horizontal">
                    <label class="label is-small label-mhrGP">BPJS Kesehatan (1%)</label>
                    <input type="text" class="input is-small sub-input-mhrGP" value="<%=insGA%>">
                  </div>
                </div>
              </div><!-- /.Sub-Fourth-Columns -->
              <div class="columns sub-fourth-columns">
                <div class="column is-1 label-mhrGP">
                  <label class="label is-small">Aktifitas</label>
                </div>
                <div class="column is-4 area-mhrGP">
                  <div class="field is-horizontal">
                    <input type="text" class="input is-small mhrGP" value="<%=taGA%>">
                    <label class="radio input-mhrGP"><input type="radio" name="mR2" <%if tptaGA= "1" then%>checked<%end if%> value="1">Per Bulan</label>
                    <label class="radio input-mhrGP"><input type="radio" name="mR2" <%if tptaGA= "2" then%>checked<%end if%> value="2">Per Hari Kerja</label>
                    <label class="radio input-mhrGP"><input type="radio" name="mR2" <%if tptaGA= "0" then%>checked<%end if%> value="0">None</label>
                  </div>
                </div>
                <div class="column is-7">
                  <div class="field is-horizontal">
                    <label class="label is-small label-mhrGP">BPJS Tenaga Kerja (3%)</label>
                    <input type="text" class="input is-small sub-input-mhrGP" id="bpjstk" value="<%=jamcGA%>">
                  </div>
                </div>
              </div><!-- /.Sub-Fourth-Columns -->
              <div class="columns sub-fourth-columns">
                <div class="column is-1 label-mhrGP">
                  <label class="label is-small">Makan</label>
                </div>
                <div class="column is-4 area-mhrGP">
                  <div class="field is-horizontal">
                    <input type="text" class="input is-small mhrGP" id="medicmakan" value="<%=mdcGA%>">
                    <label class="radio input-mhrGP"><input type="radio" name="mR3" <%if tpmdcGA= "1" then%>checked<%end if%> value="1">Per Bulan</label>
                    <label class="radio input-mhrGP"><input type="radio" name="mR3" <%if tpmdcGA= "2" then%>checked<%end if%> value="2">Per Hari Kerja</label>
                    <label class="radio input-mhrGP"><input type="radio" name="mR3" <%if tpmdcGA= "0" then%>checked<%end if%> value="0">None</label>
                  </div>
                </div>
                <div class="column is-7">
                  <div class="field is-horizontal">
                    <label class="label is-small label-mhrGP">Kelompok Pajak</label>
                    <div class="select is-small sub-input-mhrGP">
                      <select name="" id="kelpajak">
                          <option <%if pjkGA = "K" then%>selected<%end if%> value="K ">K</option>
                          <option <%if pjkGA = "K1" then%>selected<%end if%> value="K1">K1</option>
                          <option <%if pjkGA = "K2" then%>selected<%end if%> value="K2">K2</option>
                          <option <%if pjkGA = "K3" then%>selected<%end if%> value="K3">K3</option>
                          <option <%if pjkGA = "TK" then%>selected<%end if%> value="TK">TK</option>
                          <option <%if pjkGA = "XX" then%>selected<%end if%> value="XX">XX</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div><!-- /.Sub-Fourth-Columns -->
              <div class="columns sub-fourth-columns">
                <div class="column is-1 label-mhrGP">
                  <label class="label is-small">Tunjangan Harian</label>
                </div>
                <div class="column is-4 area-mhrGP">
                  <div class="field is-horizontal">
                    <input type="text" class="input is-small mhrGP" value="<%=transGA%>">
                    <label class="radio input-mhrGP"><input type="radio" name="mR4" <%if tptransGA= "1" then%>checked<%end if%> value="1">Per Bulan</label>
                    <label class="radio input-mhrGP"><input type="radio" name="mR4" <%if tptransGA= "2" then%>checked<%end if%> value="2">Per Hari Kerja</label>
                    <label class="radio input-mhrGP"><input type="radio" name="mR4" <%if tptransGA= "0" then%>checked<%end if%> value="0">None</label>
                  </div>
                </div>
                <div class="column is-7">
                  <div class="field is-horizontal">
                    <label class="label is-small label-mhrGP">Rekening BCA</label>
                    <input type="text" class="input is-small sub-input-mhrGP" id="nama_bank1" value="<%=bcaGA%>">
                    <label class="label is-small sub-label-mhrGP">No. Rek</label>
                    <input type="text" class="input is-small sub-input-mhrGP" id="norek_bank2" value="<%=nobcaGA%>">
                  </div>
                </div>
              </div><!-- /.Sub-Fourth-Columns -->
              <div class="columns sub-fourth-columns">
                <div class="column is-1 label-mhrGP">
                  <label class="label is-small">Tunjangan Tetap</label>
                </div>
                <div class="column is-4 area-mhrGP">
                  <div class="field is-horizontal">
                    <input type="text" class="input is-small mhrGP" value="<%=tjtGA%>">
                    <label class="radio input-mhrGP"><input type="radio" name="mR5" <%if tptjtGA= "1" then%>checked<%end if%> value="1">Per Bulan</label>
                    <label class="radio input-mhrGP"><input type="radio" name="mR5" <%if tptjtGA= "2" then%>checked<%end if%> value="2">Per Hari Kerja</label>
                    <label class="radio input-mhrGP"><input type="radio" name="mR5" <%if tptjtGA= "0" then%>checked<%end if%> value="0">None</label>
                  </div>
                </div>
                <div class="column is-7">
                  <div class="field is-horizontal">
                    <label class="label is-small label-mhrGP">Rekening Mandiri</label>
                    <input type="text" class="input is-small sub-input-mhrGP" id="nama_bank2" value="<%=mdrGA%>">
                    <label class="label is-small sub-label-mhrGP">No. Rek</label>
                    <input type="text" class="input is-small sub-input-mhrGP" id="norek_bank2" value="<%=nomdrGA%>">
                  </div>
                </div>
              </div><!-- /.Sub-Fourth-Columns -->
              <div class="columns sub-fourth-columns">
                <div class="column is-1 label-mhrGP">
                  <label class="label is-small label-mhrGP">Service Charge Min</label>
                </div>
                <div class="column is-4 area-mhrGP">
                  <div class="field is-horizontal">
                    <input type="text" class="input is-small mhrGP" value="<%=sctGA%>">
                    <label class="radio input-mhrGP"><input type="radio" name="mR6" <%if tpsctGA= "1" then%>checked<%end if%> value="1">Per Bulan</label>
                    <label class="radio input-mhrGP"><input type="radio" name="mR6" <%if tpsctGA= "2" then%>checked<%end if%> value="2">Per Hari Kerja</label>
                    <label class="radio input-mhrGP"><input type="radio" name="mR6" <%if tpsctGA= "0" then%>checked<%end if%> value="0">None</label>
                  </div>
                </div>
                <div class="column is-7">
                  <div class="field is-horizontal">
                    <label class="label is-small label-mhrGP">ID BPJS Kesehatan</label>
                    <input type="text" class="input is-small sub-input-mhrGP" id="bpjskes_id" value="<%=bkesGA%>">
                  </div>
                  <div class="field is-horizontal">
                      <label class="label is-small label-mhrGP">ID BPJS Tenaga Kerja</label>
                      <input type="text" class="input is-small sub-input-mhrGP" id="bpjstk_id" value="<%=btkGA%>">
                  </div>
                </div>
              </div><!-- /.Sub-Fourth-Columns -->
            </div><!-- /.Fourth-Section -->

            <div class="columns">
              <div class="column">
                <div class="field is-horizontal">
                  <input type="submit" class="button is-small custom-btn is-link" value="Simpan Data">
                  <input type="submit" class="button is-small custom-btn is-danger" value="Batal">
                  <input type="submit" class="button is-small custom-btn" value="Hapus" <%=disable%>>
                </div>
              </div>
            </div>
			
			<script src="../asset/js/cb.js"></script>
			<script src="../asset/js/jquery-ui.js"></script>
			<script>
				$(document).ready(function(){
					$(".datepick").each(function(){
						$(this).datepicker();
					});
					disableFunc('<%=kerjaGA%>');
				});
				/*untuk pilihan hari kerja*/
	function disableFunc(a){
		if (a == '1') {
			for (i=1; i<=7; i++){
				$("#daycheck"+i).removeAttr('disabled');
			} 
			$("#dayWork").val('');
			$("#dayWork").attr('disabled', true);
		}
		else if (a == '2'){
			$("#dayWork").removeAttr('disabled');
			for (i=1; i<=7; i++){
				$("#daycheck"+i).attr('disabled', true);
				$("#daycheck"+i).prop("checked", false);
			} 
		}
		else {
			for (i=1; i<=7; i++){
				$("#daycheck"+i).attr('disabled', true);
				$("#daycheck"+i).prop("checked", false);
			} 
			$("#dayWork").attr('disabled', true);
		}
	}
			</script>
<%
else
%>
<!-- #INCLUDE virtual="/hrd2/start/restricted.asp" -->
<%
end if
%>