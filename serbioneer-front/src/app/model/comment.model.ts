import { Image } from './image.model';

export class Comment {
    constructor(
        public name: string,
        public surname: string,
        public username: string,
        public culturalSiteName: string,
        public text: string,
        public approved: boolean,
        public images: Image[],
        public id: number
    ) {}
}
