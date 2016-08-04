var app = angular.module('app', []);

app.controller('PersonListCtrl', function($scope, $http) {

	$http.get('http://localhost:8080/CrudApp/webapi/persons/').success(
			function(data) {
				$scope.persons = data;
			});

	$scope.selectedPerson={};
	
	$scope.showPerson = function($person){
		
		$scope.selectedPerson=$person;
	}
	
	
	
	
	
	$scope.insertData = function() {
		$http.post('http://localhost:8080/CrudApp/webapi/persons/', {
			'tckn' : $scope.tckn,
			'firstname' : $scope.firstname,
			'surname' : $scope.surname,
			'adress' : $scope.adress
		})

		.success(function(data, status, headers, config) {
			$http.get('http://localhost:8080/CrudApp/webapi/persons/').success(
					function(data) {
						$scope.persons = data;
					});
			console.log("Veri başarıyla kaydedildi kardeş.");
		});
	}
	
	
	$scope.putData = function() {
		$http.put('http://localhost:8080/CrudApp/webapi/persons/', {
			'tckn' : $scope.selectedPerson.tckn,
			'firstname' : $scope.selectedPerson.firstname,
			'surname' : $scope.selectedPerson.surname,
			'adress' : $scope.selectedPerson.adress,
			'id' : $scope.selectedPerson.id

		})

		.success(function(data, status, headers, config) {
			$http.get('http://localhost:8080/CrudApp/webapi/persons/').success(
					function(data) {
						$scope.persons = data;
					});
			console.log("Veri başarıyla güncellendi kardeş.");
		});
	}
	
	
	
	
	
	$scope.deleteData = function() {
		$http.delete('http://localhost:8080/CrudApp/webapi/persons/'+$scope.selectedPerson.id, {
					'id' : $scope.selectedPerson.id

		})

		.success(function(data, status, headers, config) {
			$http.get('http://localhost:8080/CrudApp/webapi/persons/').success(
					function(data) {
						$scope.persons = data;
					});
			console.log("Veri başarıyla silindi kardeş.");
		});
	}
	
	
	$scope.reloadPage = function() {
		$http.get('http://localhost:8080/CrudApp/webapi/persons/').success(
				function(data) {
					$scope.persons = data;
				});
	}
	
	
});

