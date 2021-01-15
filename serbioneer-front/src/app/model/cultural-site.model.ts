import { Image } from './image.model';

export interface CulturalSite {
  id?: number;
  name?: string;
  categoryId?: number;
  category?: string;
  categoryTypeId?: number;
  categoryType?: string;
  lat?: number;
  lng?: number;
  address?: string;
  city?: string;
  description?: string;
  rating?: number;
}

export class SubscribedCulturalSiteDTO {
  constructor(
    public subscribed: boolean,
    public userEmail: string,
    public culturalSiteId: number
  ) {}

  isSubscribed() {
    return this.subscribed;
  }
}

export class CulturalSite implements CulturalSite {
  constructor(
    public id?: number,
    public name?: string,
    public categoryId?: number,
    public category?: string,
    public categoryTypeId?: number,
    public categoryType?: string,
    public lat?: number,
    public lng?: number,
    public address?: string,
    public city?: string,
    public description?: string,
    public rating?: number
  ) {}
}

export interface CulturalSiteView {
  id?: number;
  name?: string;
  categoryId?: number;
  category?: string;
  categoryTypeId?: number;
  categoryType?: string;
  lat?: number;
  lng?: number;
  address?: string;
  city?: string;
  description?: string;
  rating?: number;
  images?: Image[];
}
