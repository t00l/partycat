root = exports ? this
root.Liquorstore = ( ->
	handler = ''
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
		  if navigator.geolocation
		    navigator.geolocation.getCurrentPosition displayOnMap
		  else
		    navigator.geolocation.getCurrentPosition displayOnMapError		  
		  return		 

	displayOnMap = (position) ->
	  marker2 = handler.addMarker(
	    lat: position.coords.latitude
	    lng: position.coords.longitude
	    picture:
	      url: 'http://www.petgroomerforums.com/chat/images/icons/grin_cat.png'
	      width: 36
	      height: 36
	    infowindow: 'usuario')
	  handler.map.centerOn marker2
	  handler.getMap().setZoom 17
	  return

	displayOnMapError = (position, handler) ->
	  marker2 = handler.addMarker(
	    lat: -33.469120
	    lng: -70.641997
	    picture:
	      url: 'http://www.petgroomerforums.com/chat/images/icons/grin_cat.png'
	      width: 36
	      height: 36)
	  handler.map.centerOn marker2
	  handler.getMap().setZoom 15
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
