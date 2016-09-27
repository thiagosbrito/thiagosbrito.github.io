'use strict'

angular.module('portv2App').controller('MainCtrl',[
  '$scope', 
  ($scope) ->

    $scope.result = 'hidden'
    $scope.resultMessage
    $scope.formData
    #formData is an object holding the name, email, subject, and message
    $scope.submitButtonDisabled = false
    $scope.submitted = false
    #used so that form errors are shown only after the form has been submitted

    $scope.submit = (contactform) ->
      $scope.submitted = true
      $scope.submitButtonDisabled = true
      if contactform.$valid
        $http(
          method: 'POST'
          url: 'contact-form.php'
          data: $.param($scope.formData)
          headers: 'Content-Type': 'application/x-www-form-urlencoded').success (data) ->
          console.log data
          if data.success
            #success comes from the return json object
            $scope.submitButtonDisabled = true
            $scope.resultMessage = data.message
            $scope.result = 'bg-success'
          else
            $scope.submitButtonDisabled = false
            $scope.resultMessage = data.message
            $scope.result = 'bg-danger'
          return
      else
        $scope.submitButtonDisabled = false
        $scope.resultMessage = 'Failed :( Please fill out all the fields.'
        $scope.result = 'bg-danger'
      return

    return

])