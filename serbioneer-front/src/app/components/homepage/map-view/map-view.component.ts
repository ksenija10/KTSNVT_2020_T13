import { AfterViewInit, Component, Input, IterableDiffer, IterableDiffers } from '@angular/core';
import { CulturalSiteData } from 'src/app/services/cultural-site.service';
import Feature from 'ol/Feature';
import Map from 'ol/Map';
import XYZ from 'ol/source/XYZ';
import Point from 'ol/geom/Point';
import VectorSource from 'ol/source/Vector';
import View from 'ol/View';
import {Icon, Style} from 'ol/style';
import {Tile as TileLayer, Vector as VectorLayer} from 'ol/layer';
import IconAnchorUnits from 'ol/style/IconAnchorUnits';
import { CulturalSite } from 'src/app/model/cultural-site.model';
import { transform } from 'ol/proj';

@Component({
  selector: 'app-map-view',
  templateUrl: './map-view.component.html',
  styleUrls: ['./map-view.component.sass']
})
export class MapViewComponent implements AfterViewInit {
  
  @Input() dataSource: CulturalSite[] = [];
  @Input() divId: string = '';
  
  //iterableDiffer: IterableDiffer<any>;

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
  })

  constructor() {}

  ngAfterViewInit() {
    this.createVectorLayer();
    // sloj mape
    let rasterLayer = new TileLayer({
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
  }

  ngOnChanges() {
    if (this.map) {
      this.map.removeLayer(this.vectorLayer);
      this.createVectorLayer();
      this.map.addLayer(this.vectorLayer);
    }
  }

  private createVectorLayer() {
    let markers = this.addMarkers();
    // sloj markera
    let vectorSource = new VectorSource();
    vectorSource.addFeatures(markers);
    this.vectorLayer = new VectorLayer({
      source: vectorSource,
    });
  }

  private addMarkers(): Feature[] {
    let markers: Feature[] = []
    this.dataSource.map(
      (culturalSite: CulturalSite) => {
        if (culturalSite.lat && culturalSite.lng && culturalSite.id) {
          markers.push(this.createMarker(culturalSite.lat, culturalSite.lng, culturalSite.id))
        }
      }
    )
    return markers;
  }

  private createMarker(lat: number, lng: number, id: number): Feature {
    let iconFeature = new Feature({
      geometry: new Point(transform([lng, lat], 'EPSG:4326', 'EPSG:3857')),
      name: id
    });
    iconFeature.setStyle(this.iconStyle);
    return iconFeature;
  }
}
