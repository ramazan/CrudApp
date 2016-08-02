<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html ng-app="app">
<head>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
				
		<script type="text/javascript" src="jquery.validate.js"></script>
		<!-- Latest compiled JavaScript -->
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

		<script src="js/script.js"></script>
		
		<style type="text/css">
		 td,th,input{ 
		  text-align: center;
		 
		     }
	
		</style>
</head>
<body>

	<div class="container" style="padding-top:100px;">
   <div class="row">
        <div class="panel panel-primary" >
         <br>
           
      <!-- Yenile Butonu -->
	<button class="btn btn-primary"><span class="glyphicon glyphicon-refresh"></span> Yenile</button>
	 <!-- Ekle butonu Butonu -->
    <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#login-modal" ><span class="glyphicon glyphicon-plus"></span> Ekle</button>
             <br>
            <br>
            <div class="panel-heading">
            <br>
                     
                <h3 class="panel-title">Kişiler Listesi</h3>
                <div class="pull-right">
<!--                     <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filtrele</button> -->
                </div>
            </div>
            <br>
            <div id="shoppingList" ng-controller="PersonListCtrl">
            <table class="table">
                <thead>
                    <tr class="filters">
                        <th><input type="text" class="form-control" placeholder="TCKN" disabled></th>
                        <th><input type="text" class="form-control" placeholder="AD" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Soyad" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Detay" disabled></th>
                    </tr>
                </thead>
                
                <tbody>
                
                   <tr ng-repeat="person in persons">
			           <td>{{person.tckn}}</td>
			            <td>{{person.firstname}}</td>
			             <td>{{person.surname}}</td>
                  		 </tr>
                  		 
                </tbody>
            </table>
            </div>
        </div>
    </div>
</div>

	<!-- BEGIN # MODAL LOGIN -->
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<h4>Kapat</h4>
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h3>Kisi ekle</h3>
					
				</div>
                
                <!-- Begin # DIV Form -->
                <div id="div-forms">
                                 
                    <!-- Begin | Register Form -->
                    <form id="register-form" action="" method="post" role="form">
            		    <div class="modal-body">
		    				<div id="div-register-msg">
                                <div id="icon-register-msg" class="glyphicon glyphicon-chevron-right"></div>
                                <span id="text-register-msg">Lütfen Gerekli Alanları Eksiksiz Doldurunuz.</span>
                            </div>
		    				<input id="register_tckn" class="form-control" type="text" placeholder="T.C Kimlik Numarası" required>
                            <input id="register_username" class="form-control" type="text" placeholder="Ad" required>
                            <input id="register_lastname" class="form-control" type="text" placeholder="Soyad" required>
                            <input id="register_adress" class="form-control" type="text" placeholder="Adres" required>
<!--                             <input id="register_password" class="form-control" type="password" placeholder="Password" required> -->
            			</div>
		    		    <div class="modal-footer">
                            <div>
                                   <button type="button" class="btn btn-primary btn-lg " data-dismiss="modal">İptal</button>
                               	   <button type="submit" class="btn btn-primary btn-lg">Kaydet</button>
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
    
     <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular.min.js"></script>
    <script src="js/angular.js"></script>
  
  </body>
</html>
