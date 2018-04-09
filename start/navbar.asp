 <nav class="navbar has-shadow menu-fixed">
          <div class="navbar-brand">
              <a class="navbar-item" onclick="getPage('dashboard.asp')">
                  <img src="../asset/image/hrd_sistem_logo.png" alt="Club Bali Logo"/>
              </a>
          </div>
          <div class="navbar-end">
              <div class="navbar-link dropdown is-hoverable" style="cursor: pointer;">
                  <img class="nav-user-photo" src="../asset/image/cb_logo.png" alt="User Avatar">
                  <span class="dropdown-trigger user-info">
                      <small>Welcome,</small>
                      <%response.write request.cookies("userhrd")%>
                  </span>
                  <div class="dropdown-menu is-boxed">
                      <div class="dropdown-content">
                          <div class="dropdown-item user-menu">
                              <a onclick="getPage('maintenance_sistem/ganti_password_login.asp')">
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
                              <a href="logout.asp">
                                  <i class="hrd-icon fa fa-power-off"></i>
                                  Log Out
                              </a>
                          </div>
                      </div><!-- /.dropdown-content -->
                  </div><!-- /.dropdown-menu -->
              </div><!-- /.navbar-link -->
          </div><!-- /.navbar-end -->
  </nav><!-- /.navbar -->