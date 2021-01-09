import { Image } from './image.model';

export class NewsDTO{

    constructor(
        public information : string,
        public images : Image[]
    ) { }

}