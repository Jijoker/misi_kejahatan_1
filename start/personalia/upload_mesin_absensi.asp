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
                    Upload Mesin Absensi
                </h4>
            </div>

            <div class="columns">
                <div style="padding: .75rem;">
                    <article class="message is-info">
                        <div class="message-header">
                            Standard file XLS yang akan diupload
                        </div>
                        <div class="message-body">
                            <ul>
                                <li>1) Kolom Data yang diterima hanya 3 kolom, Kolom-1 = Nama Karyawan. Kolom-2 = No.Enroll. Kolom-3 = Tgl dan Jam Masuk/Keluar</li>
                                <li>2) Baris pertama Judul Kolom, baris selanjutnya tanpa baris kosong</li>
                                <li>3) Jumlah Sheet hanya 1 Sheet saja & Nama Sheet diberi nama : Sheet1</li>
                            </ul>
                        </div>
                    </article>
                </div>
                <div class="column is-3">
                    <label for="" class="label title-label is-small">Contoh Format Data yang benar</label>
                    <table class="table is-bordered is-narrow">
                        <tbody>
                            <tr>
                                <td style="font-size: 12px;">Name</td>
                                <td style="font-size: 12px;">AC-No.</td>
                                <td style="font-size: 12px;">Time</td>
                            </tr>
                            <tr>
                                <td style="font-size: 12px;">Yitno</td>
                                <td style="font-size: 12px;">5</td>
                                <td style="font-size: 12px;">1/23/2008 09:01:45</td>
                            </tr>
                            <tr>
                                <td style="font-size: 12px;">Yitno</td>
                                <td style="font-size: 12px;">5</td>
                                <td style="font-size: 12px;">1/23/2008 10:15:22</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="content-section">
                <label for="" class="label title-label">1. Upload Absensi Pegawai</label>
                <div class="columns">
                    <div class="column is-12">
                        <h5 class="title is-6">Cara-cara:</h5>
                        <p style="font-size: 12px; margin-bottom: 0.5rem;">Klik <strong>Browse</strong> untuk pilih file XLS yang ada di lokal PC yang akan di Upload, kemudian Click Upload to Server jika sudah pilih file yang akan di Upload</p>
                        <p style="font-size: 12px;">Kemudian jika file yang di-Upload sudah muncul di daftar file yang terupload, berarti proses upload selesai. Dan bisa dilanjutkan ke proses posting data yang sudah terupload</p>
                    </div>
                </div>
                <div class="columns">
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
                    <div class="column is-4">
                            <label for="" class="label is-small">Nama File Konversi</label>
                            <div class="field">
                                <div class="file is-small has-name">
                                    <label class="file-label">
                                    <input class="file-input" type="file" name="resume">
                                    <span class="file-cta">
                                        <span class="file-icon">
                                        <i class="fa fa-upload"></i>
                                        </span>
                                        <span class="file-label">
                                            Choose a file…
                                        </span>
                                    </span>
                                    <span class="file-name">
                                        Screen Shot 2017-07-29 at 15.54.25.png
                                    </span>
                                    </label>
                                </div>
                            </div>
                    </div>
                    <div class="column is-4">
                        <div style="height: 18px; margin-bottom: .5rem;"></div>
                        <input type="submit" class="button is-small is-link" value="Upload ke Server">
                    </div>
                </div>        
                <div class="columns">
                    <div class="column is-6">
                        <div class="notification is-info is-small">
                            <p style="font-size: 12px;">File yang telah ter-upload dapat dilihat disini <a>View File</a></p>
                        </div>
                    </div>
                </div>
            </div>    
            <div class="content-section">
                <label for="" class="label title-label">2. Posting Absensi Pegawai</label>
                <div class="columns columns-section">
                    <div class="column is-12">
                        <h5 class="title is-6">Cara-cara:</h5>
                        <p style="font-size: 12px; margin-bottom: 0.5rem;">Masukan Nama File Excel setelah File di-Upload ke server, isi nama file XLS yang sudah di Upload berikut extentionnya mis : HQFEB2008.XLS</p>
                        <p style="font-size: 12px;">Klik Browse untuk pilih file XLS yang ada di lokal PC yang akan di Upload, kemudian Click Upload to Server jika sudah pilih file yang akan di Upload</p>
                    </div>
                </div>
                <div class="columns">
                    <div class="column is-3">
                        <label for="" class="label is-small">Cabang Asal Mesin</label>
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
                        </div>
                    </div>
                    <div class="column is-2">
                        <label for="" class="label is-small">Nomor Mesin Absensi</label>
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
                        </div>
                    </div>
                    <div class="column is-3">
                        <label for="" class="label is-small">Nama File XLS Absensi</label>
                        <div class="control">
                            <input type="text" class="input is-small">
                            <small style="font-size: 10px;">Tulis Nama Lengkap, berikut extention filenya</small>
                        </div>
                    </div>
                    <div class="column is-4">
                        <div style="height: 18px; margin-bottom: .5rem;"></div>
                        <input type="submit" class="button is-small is-link" value="Posting Data">
                    </div>
                </div>
            </div>
        </main>
    </div>


<script src="../asset/js/script.js"></script>
</body>
</html>
