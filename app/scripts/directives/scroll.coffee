angular.module('portv2App', []).directive 'scrollPosition', ($window) ->
  {
    scope: scroll: '=scrollPosition'
    link: (scope, element, attrs) ->
      windowEl = angular.element($window)

      handler = ->
        scope.scroll = windowEl.scrollTop()
        return

      windowEl.on 'scroll', scope.$apply.bind(scope, handler)
      handler()
      return

  }