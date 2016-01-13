root = exports ? this
root.Liquorstore = ( ->
	init = (page,data) ->
		if page == 'index'
			gmaps_liquorstore_index(data)
		if page == 'show'
			gmaps_liquorstore_show(data)		

	gmaps_liquorstore_index = (data) ->
		handler = Gmaps.build('Google')
		handler.buildMap {
		  provider: {}
		  internal: id: 'map'
		}, ->
		  markers = handler.addMarkers(data);
		  handler.bounds.extendWith markers
		  handler.fitMapToBounds()
		  return

	gmaps_liquorstore_show = (data) ->
		handler = Gmaps.build('Google')
		handler.buildMap {
		  provider: {}
		  internal: id: 'map'
		}, ->
		  markers = handler.addMarkers(data);
		  handler.bounds.extendWith markers
		  handler.fitMapToBounds()
		  return

	{init: init}
	)()
