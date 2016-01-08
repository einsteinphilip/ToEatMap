# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class InfoBoxBuilder extends Gmaps.Google.Builders.Marker


  create_infowindow: ->
    return null unless _.isString @args.infowindow

    boxText = document.createElement("div")
    boxText.setAttribute("class", 'custom_infowindow_container')
    boxText.innerHTML = @args.infowindow
    @infowindow = new InfoBox(@infobox(boxText))

  infobox: (boxText)->
    content: boxText
    maxWidth: 0
    pixelOffset: new google.maps.Size(-140, -36)
    alignBottom: true
    boxStyle: 
          width: "200px"
          


@buildMap = (markers)->
  handler = Gmaps.build 'Google', { builders: { Marker: InfoBoxBuilder} }
  
  handler.buildMap { internal: id: "map" }, ->
      markers = handler.addMarkers(markers)
      
      displayOnMap = (position) ->
      	marker = handler.addMarker({
            lat: position.coords.latitude,
            lng: position.coords.longitude
          })
      	handler.map.centerOn(marker)
      	handler.getMap().setZoom(13)
      if navigator.geolocation
      	navigator.geolocation.getCurrentPosition(displayOnMap)      

