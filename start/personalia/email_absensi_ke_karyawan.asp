<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../asset/css/bulma.css">
    <link rel="stylesheet" href="../asset/css/style.css">
    <link rel="stylesheet" href="../asset/css/font-awesome.min.css">
    <link rel="shortcut icon" href="../asset/image/cb_favicon.png">
    <script src="../asset/js/jquery.min.js"></script>
    <title>HRD Sistem</title>
</head>
<body>
  <nav class="navbar has-shadow menu-fixed">
          <div class="navbar-brand">
              <a class="navbar-item" href="#">
                  <img src="../asset/image/hrd_sistem_logo.png" alt="Club Bali Logo"/>
              </a>
          </div>
          <div class="navbar-end">
              <div class="navbar-link dropdown is-hoverable" style="cursor: pointer;">
                  <img class="nav-user-photo" src="../asset/image/cb_logo.png" alt="User Avatar">
                  <span class="dropdown-trigger user-info">
                      <small>Welcome,</small>
                      Administrator
                  </span>
                  <div class="dropdown-menu is-boxed">
                      <div class="dropdown-content">
                          <div class="dropdown-item user-menu">
                              <a href="#">
                                  <i class="hrd-icon fa fa-cog"></i>
                                  Setting
                              </a>
                          </div>
                          <div class="dropdown-item user-menu">
                              <a href="#">
                                  <i class="hrd-icon fa fa-user"></i>
                                  Profile
                              </a>
                          </div>
                          <hr class="dropdown-divider">
                          <div class="dropdown-item user-menu">
                              <a href="#">
                                  <i class="hrd-icon fa fa-power-off"></i>
                                  Log Out
                              </a>
                          </div>
                      </div><!-- /.dropdown-content -->
                  </div><!-- /.dropdown-menu -->
              </div><!-- /.navbar-link -->
          </div><!-- /.navbar-end -->
  </nav><!-- /.navbar -->

  <div class="columns app-body">
      <aside class="menu column hero aside-menu-fixed">
            <ul class="menu-list">
                <li>
                    <a class="hrd-link" href="javascript:void(0)">
                        <i class="fa fa-user-o menu-icon"></i>
                        Data Karyawan
                        <i class="arrow fa fa-angle-down"></i>
                    </a>
                    <ul class="hrd-sub-menu">
                        <li><a href="../data_karyawan/isi_karyawan_baru.htm">Isi Karyawan Baru</a></li>
                        <li><a href="../data_karyawan/isi_perubahan_status_pegawai_baru.htm">Isi Perubahan Status Pegawai Baru</a></li>
                        <li><a href="../data_karyawan/data_karyawan_gaji_absen.htm">Data Karyawan (Gaji + Absen)</a></li>
                        <li><a href="../data_karyawan/data_perubahan_status_pegawai.htm">Data Perubahan Status Pegawai</a></li>
                        <li><a href="../data_karyawan/data_karyawan_pribadi.htm">Data Karyawan (Pribadi)</a></li>
                        <li><a href="../data_karyawan/status_karyawan_resign.htm">Status Karyawan (Resign)</a></li>
                        <li><a href="../data_karyawan/mutasi_karyawan.htm">Mutasi Karyawan</a></li>
                        <li><a href="../data_karyawan/sertifikasi_karyawan.htm">Sertifikasi Karyawan</a></li>
                    </ul>
                </li>

                <li>
                    <a class="hrd-link" href="javascript:void(0)">
                        <i class="fa fa-users menu-icon"></i>
                        Personalia
                        <i class="arrow fa fa-angle-down"></i>
                    </a>
                    <ul class="hrd-sub-menu">
                        <li><a href="#" class="is-active">Ijin/Sakit/Cuti</a></li>
                        <li><a href="#">Upload Mesin Absensi</a></li>
                        <li><a href="#">List Absen Mesin Karyawan</a></li>
                        <li><a href="#">List Absen Mesin Cabang</a></li>
                        <li><a href="#">Isi Absen Manual</a></li>
                        <li><a href="#">Hari Libur Karyawan</a></li>
                        <li><a href="#">CrossCroll</a></li>
                        <li><a href="#">Saldo Cuti Karyawan</a></li>
                        <li><a href="#">Email Absensi ke Karyawan</a></li>
                        <li><a href="#">Evaluasi Karyawan</a></li>
                        <li><a href="#">Track Record Karyawan Absensi</a></li>
                        <li><a href="#">History Karyawan</a></li>
                    </ul>
                </li>

                <li>
                    <a class="hrd-link" href="javascript:void(0)">
                        <i class="fa fa-money menu-icon"></i>
                        Keuangan
                        <i class="arrow fa fa-angle-down"></i>
                    </a>
                    <ul class="hrd-sub-menu">
                        <li><a href="../keuangan/summaries_absensi.htm">Summaries Absensi</a></li>
                        <li><a href="../keuangan/gaji_karyawan.htm">Gaji Karyawan</a></li>
                        <li><a href="../keuangan/list_gaji_bank.htm">List Gaji (Bank)</a></li>
                        <li><a href="../keuangan/daftar_bonus_bulanan.htm">Daftar Bonus Bulanan</a></li>
                        <li><a href="../keuangan/daftar_bonus_tahunan.htm">Daftar Bonus Tahunan</a></li>
                        <li><a href="../keuangan/bayar_bulanan_non_gaji.htm">Bayar Bulanan Non Gaji</a></li>
                        <li><a href="../keuangan/bayar_tahunan_non_gaji.htm">Bayar Tahunan Non Gaji</a></li>
                        <li><a href="../keuangan/uang_kesehatan.htm">Uang Kesehatan</a></li>
                        <li><a href="../keuangan/jamsostek_list.htm">Jamsostek List</a></li>
                        <li><a href="../keuangan/list_default_data.htm">List Default Data</a></li>
                        <li><a href="../keuangan/thr_karyawan.htm">THR Karyawan</a></li>
                     </ul>
                </li>

                <li>
                    <a class="hrd-link" href="javascript:void(0)">
                        <i class="fa fa-cog menu-icon"></i>
                        Maintenance Sistem
                        <i class="arrow fa fa-angle-down"></i>
                    </a>
                    <ul class="hrd-sub-menu">
                        <li><a href="ganti_password_login.htm">Ganti Password Login</a></li>
                        <li><a href="tabel_fungsi_jabatan.htm">Tabel Fungsi Jabatan</a></li>
                        <li><a href="bahan_grup_sertifikasi.htm">Bahan Grup Sertifikasi</a></li>
                        <li><a href="bahan_sertifikasi.htm">Bahan Sertifikasi</a></li>
                        <li><a href="posting_close_data.htm">Posting / Close Data</a></li>
                        <li><a href="user_log.htm">User Log</a></li>
                    </ul>
                </li>
            </ul>
        </aside>

        <main class="column main-content">
            <nav class="breadcrumb is-small breadcrumb-navigation" style="margin-bottom: 5px;">
                <ul>
                    <li><a href="#">Home</a></li>
                    <li class="is-active"><a href="#">Personalia</a></li>
                </ul>
            </nav>

            <div class="field column">
                <h4 class="title is-4">
                    Kirim Notifikasi ke Karyawan
                </h4>
            </div>

            <div class="columns columns-section">
                <div class="column is-3">
                    <label for="" class="label is-small">Periode Gaji</label>
                    <div class="field is-horizontal">
                        <div class="select is-small dropdown-list" style="margin-right: 8px;">
                            <select name="" id="">
                                <option value="">Lorem, ipsum.</option>
                                <option value="">Lorem, ipsum.</option>
                                <option value="">Lorem, ipsum.</option>
                                <option value="">Lorem, ipsum.</option>
                                <option value="">Lorem, ipsum.</option>
                            </select>
                        </div>
                        <div class="control">
                            <input type="text" class="input is-small">
                        </div>
                    </div>
                </div>
                <div class="column is-3">
                    <label for="" class="label is-small">Cabang</label>
                    <div class="select is-small dropdown-list">
                        <select name="" id="">
                            <option value="">Lorem, ipsum.</option>
                            <option value="">Lorem, ipsum.</option>
                            <option value="">Lorem, ipsum.</option>
                            <option value="">Lorem, ipsum.</option>
                            <option value="">Lorem, ipsum.</option>
                        </select>
                    </div>
                </div>
                <div class="column is-3">
                    <label for="" class="label is-small">Department</label>
                    <div class="select is-small dropdown-list">
                        <select name="" id="">
                            <option value="">Lorem, ipsum.</option>
                            <option value="">Lorem, ipsum.</option>
                            <option value="">Lorem, ipsum.</option>
                            <option value="">Lorem, ipsum.</option>
                            <option value="">Lorem, ipsum.</option>
                        </select>
                    </div>
                </div>
                <div class="column is-3">
                    <label for="" class="label is-small">Karyawan</label>
                    <div class="select is-small dropdown-list">
                        <select name="" id="">
                            <option value="">Lorem, ipsum.</option>
                            <option value="">Lorem, ipsum.</option>
                            <option value="">Lorem, ipsum.</option>
                            <option value="">Lorem, ipsum.</option>
                            <option value="">Lorem, ipsum.</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="columns">
                <div class="column is-2">
                    <div style="height: 18px; margin-bottom: 0.5rem;"></div>
                    <input type="submit" class="button is-small is-link sbm-btn" value="Proses Sekarang">
                </div>
            </div>
        </main>
    </div>


<script src="../asset/js/script.js"></script>
</body>
</html>
