$(document).ready(function(){
	/*START MODUL isi perubahan status pegawai*/
	/*Untuk mendapatkan nama di field nama pegawai dengan mengganti cabang department dan status*/
	$("#cabangPrb").change(function(){
		changeNamePrb();
	});
	$("#jabatanPrb").change(function(){
		changeNamePrb();
	});
	$("#statusPrb").change(function(){
		changeNamePrb();
	});
	function changeNamePrb(){
		$.ajax({
			url:"proses.asp",
			type:"POST",
			data:{
				action:  "ubahnama",
				cabang: $("#cabangPrb").val(),
				jabatan: $("#jabatanPrb").val(),
				status: $("#statusPrb").val()
			},
			dataType: 'text',
			success: function(data){
				$("#nama_pegawaiPrb").html(data);
			}
		});
	}
	
	
	/*Untuk mendapatkan data dari nama yang di pilih*/
	$("#displayNama").click(function(){
		getDataEmp();
	});
	function getDataEmp(){
		$.ajax({
			url:"proses.asp",
			type:"POST",
			data:{
				action:  "ambildataemp",
				empcode: $("#nama_pegawaiPrb").val()
			},
			dataType: 'text',
			success: function(data){
			var a = JSON.parse(data);
				$("#nipPrb").val(a.nip);
				$("#namaPrb").val(a.name);
				$("#jablama").val(a.jab);
				$("#deplama").val(a.dep);
				$("#gplama").val(a.gp);
				$("#talama").val(a.ta);
				$("#sclama").val(a.sc);
				$("#lalama").val(a.la);
				$("#totlama").val(a.tot);
				$("#tglberlaku").val(a.tgl);
			}
		});
	}
	
	/*END MODUL isi perubahan status pegawai*/
	/***************************************/
	/*START MODUL data karyawan gaji absen*/
	/*Menampilkan data ke tabel*/
	$("#displayGA").click(function(){
		isiTableEmp();
	});
	function isiTableEmp(){
		$.ajax({
			url:"proses.asp",
			type:"POST",
			data:{
				action:  "tabelisigaji",
				cabGA: $("#cabGA").val(),
				depGA: $("#depGA").val(),
				jenGA: $("#jenisGA").val(),
				nipGA: $("#nipGA").val(),
				namaGA: $("#namaGA").val(),
				staGA: $("#statusGA").val()
			},
			dataType: 'text',
			success: function(data){
				//alert(data);
				$("#trBody").html(data);
			}
		});
	}
	
	/*END MODUL data karyawan gaji absen */
	/************************************/
	/***START MODUL Maintenance Menu ***/
	$("#TableMenu").on('click', '.Add', function() {
      var currentRow = $(this).closest("tr");

      var col1 = currentRow.find("td:eq(0)").html(); // get current row 1st table cell TD value
      var col2 = currentRow.find("td:eq(2)").html(); // get current row 3nd table cell TD value
      var data = col1 + "\n" + col2 ;//+ "\n" + col3;

		$("#addMenu").addClass("is-active")
		$("#pNameModal").val(col2);
		$("#idNameModal").val(col1);
		
    });
	
	$(".Edit").click(function(){
		$("#editMenu").addClass("is-active")
	});
	
	$(".close-modal").click(function(){
		$(".modal").removeClass("is-active")
	});
	
	$("#SaveSubMenu").click(function(e){
		e.preventDefault();
		sendDataMenu();
	});
	function sendDataMenu(){
		alert($('.LvlSub:checked').serialize());
		/*$.ajax({
			url:"proses.asp",
			type:"POST",
			data:{
				$('.LvlSub:checked').serialize(),
				action:  "KirimDataMenu",
				pidsub: $("#idNameModal").val(),
				namesub: $("#SubMenuName").val(),
				urlsub: $("#SubMenuURL").val()
			},
			dataType: 'text',
			success: function(data){
			alert(data);
			}
		});*/
	}
});