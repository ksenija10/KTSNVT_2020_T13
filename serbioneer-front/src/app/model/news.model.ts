import { Image } from './image.model';

export class NewsDTO {
  constructor(
      public information : string,
      public dateTime : Date,
      public culturalSiteName : string,
      public images : Image[],
  ) {}
}

export interface NewsDTOInterface {
  id?: number;
  information?: string;
  dateTime?: Date;
  culturalSiteName?: string;
  images: Image[];
} 
