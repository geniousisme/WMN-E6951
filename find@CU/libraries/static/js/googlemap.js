    var locations = [
        ['Science and Engineering Library', 40.810055, -73.962005],
        ['Pupin Hall', 40.810050, -73.961360],
        ['Joe Caffe', 40.810263, -73.961835],
        ['Schapiro Center for Engineering and Physical Science Research', 40.809627, -73.960819],
        ['Davis Auditorium', 40.809563, -73.960734],
        ['Mudd Building', 40.809318, -73.959900],
        ['CS Department', 40.809011, -73.959790],
        ['Engineering Terrace Garage', 40.808877, -73.959949],
        ['Columbia Business School', 40.809005, -73.961248],
        ['Uris Hall', 40.808926, -73.961360],
        ['Butler Library', 40.806396, -73.963218],
        ['Lerner Hall', 40.806999, -73.964025]
    ];

    var location_cord_hash = {
        'Science and Engineering Library': [40.810055, -73.962005],
        'Pupin Hall': [40.810050, -73.961360],
        'Joe Caffe': [40.810263, -73.961835],
        'Schapiro Center for Engineering and Physical Science Research': [40.809627, -73.960819],
        'Davis Auditorium': [40.809563, -73.960734],
        'Mudd Building': [40.809318, -73.959900],
        'CS Department': [40.809011, -73.959790],
        'Engineering Terrace Garage': [40.808877, -73.959949],
        'Columbia Business School': [40.809005, -73.961248],
        'Uris Hall': [40.808926, -73.961360],
        'Butler Library': [40.806396, -73.963218],
        'Lerner Hall': [40.806999, -73.964025]
    };

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 16,
      center: new google.maps.LatLng(40.807544, -73.962583),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;

    for (i = 0; i < locations.length; i++) { 
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));
    }