import { Image } from './image.model';

export class CulturalSite {
    constructor(
        public name: string,
        public categoryId: number,
        public category: string,
        public categoryTypeId: number,
        public categoryType: string,
        public lat: number,
        public lng: number,
        public address: string,
        public city: string,
        public description: string,
        public rating: number,
        public images?: Image[],
        public id?: number
    ) {}
}

export class SubscribedCulturalSiteDTO {
    constructor(
        public subscribed: boolean,
        public userEmail: string,
        public culturalSiteId: number
    ) {}
}
