root = exports ? this
root.Utilities = ( ->
	calendar = ->
		$('.datetime').datetimepicker({ 
			format: 'LT'
		})
	return {
		calendar: calendar
	}
)()