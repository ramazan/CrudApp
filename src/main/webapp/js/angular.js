var app = angular.module('app', []);

app.controller('PersonListCtrl', function($scope,$http) {

	
	$http.get('http://localhost:8080/CrudApp/webapi/persons/').
    success(function(data) {
        $scope.persons = data;
    });
	

});


app.controller('postDataController',function($scope,$http){	
    $scope.insertData=function(){		
    $http.post('http://localhost:8080/CrudApp/webapi/persons/', {
		'tckn':$scope.tckn,
		'firstname':$scope.firstname,
		'lastname':$scope.lastname,
		'adress':$scope.adress})
    
    .success(function(data,status,headers,config){
    console.log("Data Inserted Successfully");
    });
        }
         });

