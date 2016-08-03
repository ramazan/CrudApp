<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html ng-app="app">
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="js/style.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script src="js/script.js"></script>

	
	

	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular.min.js"></script>
	<script src="js/angular.js"></script>

</style>
</head>
<body>
	
	<div id="all" ng-controller="PersonListCtrl">

	<div id="page-modal" class="container" style="padding-top: 100px;">
		<div class="row">
			<div class="panel panel-primary">
				<br>
				<div ng-controller="refreshController" style="padding-left: 20px">
					<!-- Yenile Butonu -->
					<button class="btn btn-primary" ng-click="reloadPage();">
						<span class="glyphicon glyphicon-refresh"></span> Yenile
					</button>
					<!-- Ekle butonu Butonu -->
					<button class="btn btn-primary" data-toggle="modal"
						data-target="#login-modal">
						<span class="glyphicon glyphicon-plus"></span> Ekle
					</button>
				</div>
				<br>
				<div class="panel-heading">
					<h2 class="panel-title" style="text-align:center">Kişiler Listesi</h2>
				</div>
				<br>
				<div id="personsList" >
					<table class="table">
						<thead>
							<tr class="filters">
								<th><input type="text" class="form-control"
									placeholder="TCKN" disabled></th>
								<th><input type="text" class="form-control"
									placeholder="AD" disabled></th>
								<th><input type="text" class="form-control"
									placeholder="Soyad" disabled></th>
								<th><input type="text" class="form-control"
									placeholder="Detay" disabled></th>
							</tr>
						</thead>

						<tbody>

							<tr ng-repeat="person in persons">
<!-- 								<td display="none">{{person.id}}</td>				 -->
								<td>{{person.tckn}}</td>
								<td>{{person.firstname}}</td>
								<td>{{person.surname}}</td>
<!-- 								<td>index : {{$index}}</td> -->
								<td>
<!-- 								<td> -->
<!-- 								  <input type="text" ng-model="person.firstname"> -->
<!-- 								</td> -->
									<button class="btn btn-primary" data-toggle="modal"
						data-target="#detail-modal" ng-click="showPerson(person)">
										<span class="glyphicon glyphicon-th-list"></span> Detay
									</button>
								</td>
							</tr>

						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- BEGIN # MODAL LOGIN -->
	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<h4>Kapat</h4>
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h3>Kisi ekle</h3>

				</div>

				<!-- Begin # DIV Form -->
				<div id="div-forms" ng-controller="postDataController">

					<!-- Begin | Register Form -->
					<form id="register-form" method="post">
						<div class="modal-body">
							<div id="div-register-msg">
								<div id="icon-register-msg"
									class="glyphicon glyphicon-chevron-right"></div>
								<span id="text-register-msg"></span>
							</div>
							<br>
								<input class="form-control" type="text"
									placeholder="T.C Kimlik Numarası" ng-model="tckn" required><br>
									
								<input class="form-control" type="text" placeholder="Ad"
									ng-model="firstname" required><br>
									 
								 <input class="form-control" type="text" placeholder="Soyad"
									ng-model="surname" required><br> 
									
								<input class="form-control"
									type="text" placeholder="Adres" ng-model="adress" required>
						</div>
						<div class="modal-footer">
							<div>
								<button id="dismissButton" type="button" class="btn btn-primary btn-lg "
									data-dismiss="modal">İptal</button>
								<button value="submit" class="btn btn-primary btn-lg" data-dismiss="modal"
									ng-click="insertData()"  >Kaydet</button>
							</div>
						</div>
					</form>
					<!-- End | Register Form -->

				</div>
				<!-- End # DIV Form -->

			</div>
		</div>
	</div>
	<!-- END # MODAL LOGIN -->
	
	
	
	
	
	<!-- BEGIN # MODAL DETAIL -->
	<div class="modal fade" id="detail-modal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none;"  ng-controller="postDataController">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<h4>Kapat</h4>
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h3>Kisi Bilgileri</h3>

				</div>

				<!-- Begin # DIV Form -->
				<div id="div-forms">

					<!-- Begin | Register Form -->
					<form id="register-form" method="post">
						<div class="modal-body">
						
							<input style="display: none;" class="form-control" type="text"
								 ng-model="selectedPerson.id" required><br>
							<input class="form-control" type="text"
								 ng-model="selectedPerson.tckn" required><br>
							
							<input class="form-control" type="text"
								ng-model="selectedPerson.firstname" required><br> 
								
								<input
								class="form-control" type="text" 
								ng-model="selectedPerson.surname" required><br> 
								
								<input class="form-control"
								type="text"  ng-model="selectedPerson.adress" required>
						</div>
						<div class="modal-footer">
							<div>
								<button type="button" class="btn btn-primary btn-lg "
									data-dismiss="modal">İptal</button>
									
<!-- 									ng-click düzenlenecek -->
									<button value="submit" data-dismiss="modal" class="btn btn-primary btn-lg"
									ng-click="deleteData()">Sil</button>
								
								<button value="submit" data-dismiss="modal" class="btn btn-primary btn-lg"
									ng-click="putData()">Güncelle</button>
							</div>
						</div>
					</form>
					<!-- End | Register Form -->

				</div>
				<!-- End # DIV Form -->

			</div>
		</div>
	</div>
	<!-- END # MODAL DETAIL -->

	</div>
</body>
</html>
