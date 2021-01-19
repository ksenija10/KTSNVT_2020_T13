import { Image } from './image.model';

export class NewsDTO {
  constructor(
      public information : string,
      public dateTime : Date,
      public culturalSiteName : string,
      public images: Image[],
      public id?: number
  ) {}
}
