import React, { useState, useEffect, useRef } from "react";
import "./App.css";

import mapboxgl from "!mapbox-gl"; // eslint-disable-line import/no-webpack-loader-syntax

mapboxgl.accessToken =
  "pk.eyJ1IjoiZmxvYmF1IiwiYSI6ImNrdW1uYW12cDFlenUzM282Ym96N3pqYTEifQ.RH29qvuc6pkcbl5JxtDzVQ";

export default function App() {
  const [loaded, setLoaded] = useState(false);
  const mapContainer = useRef(null);
  const map = useRef(null);

  useEffect(() => {
    if (map.current) return; // initialize map only once
    map.current = new mapboxgl.Map({
      container: mapContainer.current,
      style: "mapbox://styles/mapbox/streets-v11",
      center: [13.811850882013132, 47.92356577261306],
      zoom: 9,
    });
    map.current.on("load", async () => {
      setLoaded(true);
    });
  }, []);

  return <div ref={mapContainer} className="mapContainer" />;
}
