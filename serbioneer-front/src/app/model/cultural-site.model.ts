import { Image } from './image.model';

export interface CulturalSite {
    id?: number
    name?: string;
    categoryId?: number;
    category?: string;
    categoryTypeId?: number;
    categoryType?: string;
    lat?: number;
    lng?: number;
    address?: string;
    city?: string;
    description?: string
    rating?: number;
}

export class SubscribedCulturalSiteDTO{

    constructor(
        public subscribed : boolean,
        public userEmail : string,
        public culturalSiteId : number
    ){}

    isSubscribed(){
        return this.subscribed;
    }
}

export interface CulturalSiteView {
    id?: number
    name?: string;
    categoryId?: number;
    category?: string;
    categoryTypeId?: number;
    categoryType?: string;
    lat?: number;
    lng?: number;
    address?: string;
    city?: string;
    description?: string
    rating?: number;
    images?: Image[];
}