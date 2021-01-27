import { AfterViewInit, Component, Input, OnChanges } from '@angular/core';
import { Router } from '@angular/router';
import Feature from 'ol/Feature';
import Point from 'ol/geom/Point';
import { Tile as TileLayer, Vector as VectorLayer } from 'ol/layer';
import Map from 'ol/Map';
import { transform } from 'ol/proj';
import VectorSource from 'ol/source/Vector';
import XYZ from 'ol/source/XYZ';
import { Icon, Style } from 'ol/style';
import IconAnchorUnits from 'ol/style/IconAnchorUnits';
import View from 'ol/View';
import { CulturalSite } from 'src/app/model/cultural-site.model';

@Component({
  selector: 'app-map-view',
  templateUrl: './map-view.component.html',
  styleUrls: ['./map-view.component.sass']
})
export class MapViewComponent implements AfterViewInit, OnChanges {

  @Input() dataSource: CulturalSite[] = [];
  @Input() divId = '';

  map!: Map;
  vectorLayer!: VectorLayer;

  iconStyle: Style = new Style({
    image: new Icon({
      anchor: [0.5, 528],
      anchorXUnits: IconAnchorUnits.FRACTION,
      anchorYUnits: IconAnchorUnits.PIXELS,
      src: '../../../assets/images/map_pin.png',
      opacity: 0.75,
      size: [336, 528],
      scale: 0.06
    })
  });

  constructor(
    private router: Router
  ) {}

  ngAfterViewInit(): void {
    this.createVectorLayer();
    // sloj mape
    const rasterLayer = new TileLayer({
      source: new XYZ({
        url: 'https://{a-c}.tile.openstreetmap.org/{z}/{x}/{y}.png'
      })
    });
    // inicijalizacija mape
    this.map = new Map({
      target: this.divId,
      layers: [rasterLayer, this.vectorLayer],
      view: new View({
        center: [0, 0],
        zoom: 2
      })
    });

    const that = this;
    this.map.on('click', (evt) => {
      const pixel = evt.pixel;
      // dokumentacija biblioteke preporucuje ovakav zapis
      that.map.forEachFeatureAtPixel(pixel, (feature: any, layer: any) => {
        that.onFeatureClicked(feature.values_.name);
      });
    });
  }

  onFeatureClicked(id: number): void {
    // navigacija na cultural site posle klika na row
    this.router.navigate(['cultural-site/' + id]);
  }

  ngOnChanges(): void {
    if (this.map) {
      this.map.removeLayer(this.vectorLayer);
      this.createVectorLayer();
      this.map.addLayer(this.vectorLayer);
    }
  }

  private createVectorLayer(): void {
    const markers = this.addMarkers();
    // sloj markera
    const vectorSource = new VectorSource();
    vectorSource.addFeatures(markers);
    this.vectorLayer = new VectorLayer({
      source: vectorSource,
    });
  }

  private addMarkers(): Feature[] {
    const markers: Feature[] = [];
    this.dataSource.map(
      (culturalSite: CulturalSite) => {
        if (culturalSite.lat && culturalSite.lng && culturalSite.id) {
          markers.push(this.createMarker(culturalSite.lat, culturalSite.lng, culturalSite.id));
        }
      }
    );
    return markers;
  }

  private createMarker(lat: number, lng: number, id: number): Feature {
    const iconFeature = new Feature({
      geometry: new Point(transform([lng, lat], 'EPSG:4326', 'EPSG:3857')),
      name: id
    });
    iconFeature.setStyle(this.iconStyle);
    return iconFeature;
  }
}
