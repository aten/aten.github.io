[1mdiff --git a/index.html b/index.html[m
[1mindex 20e5b82..cbe6313 100644[m
[1m--- a/index.html[m
[1m+++ b/index.html[m
[36m@@ -47,30 +47,38 @@[m
         image = new MarvinImage();[m
         image.load("resources/gray.png", imageLoaded);[m
 [m
[31m-        function imageLoaded() {[m
[31m-            // show a marker on the map[m
[31m-            marker = L.marker({ lon: 0, lat: 0 }).addTo(map);[m
[31m-            marker.bindTooltip("60",[m
[31m-                {[m
[31m-                    permanent: true,[m
[31m-                    direction: 'right'[m
[31m-                })[m
[32m+[m[32m        let marker = null;[m
 [m
[31m-            // update the marker when the map image is clicked[m
[32m+[m[32m        function imageLoaded() {[m
             const imgWidth = 3079, imgHeight = 5000;[m
[32m+[m
             colorOverlay.on('click', (leafletEvent) => {[m
[31m-                // see https://stackoverflow.com/a/42111623/1071630[m
                 var e = leafletEvent.originalEvent;[m
                 var rect = e.target.getBoundingClientRect();[m
[31m-                var zoomedX = e.clientX - rect.left; //x position within the element.[m
[31m-                var zoomedY = e.clientY - rect.top;  //y position within the element[m
[32m+[m[32m                var zoomedX = e.clientX - rect.left;[m
[32m+[m[32m                var zoomedY = e.clientY - rect.top;[m
 [m
                 const x = Math.round(zoomedX * imgWidth / rect.width);[m
                 const y = Math.round(zoomedY * imgHeight / rect.height);[m
[31m-                marker.setLatLng(leafletEvent.latlng)[m
[31m-                var value = image.getIntComponent0(x, y) / 2.55[m
[31m-                var rounded = Math.round(value * 10) / 10[m
[31m-                marker.setTooltipContent(rounded.toString())[m
[32m+[m[32m                const latlng = leafletEvent.latlng;[m
[32m+[m[32m                const value = image.getIntComponent0(x, y) / 2.55;[m
[32m+[m[32m                const rounded = Math.round(value * 10) / 10;[m
[32m+[m
[32m+[m[32m                if (!marker) {[m
[32m+[m[32m                    marker = L.marker(latlng).addTo(map);[m
[32m+[m[32m                    marker.bindTooltip(rounded.toString(), {[m
[32m+[m[32m                        permanent: true,[m
[32m+[m[32m                        direction: 'right'[m
[32m+[m[32m                    });[m
[32m+[m
[32m+[m[32m                    marker.on('click', function () {[m
[32m+[m[32m                        map.removeLayer(marker);[m
[32m+[m[32m                        marker = null;[m
[32m+[m[32m                    });[m
[32m+[m[32m                } else {[m
[32m+[m[32m                    marker.setLatLng(latlng);[m
[32m+[m[32m                    marker.setTooltipContent(rounded.toString());[m
[32m+[m[32m                }[m
             });[m
         }[m
     </script>[m
