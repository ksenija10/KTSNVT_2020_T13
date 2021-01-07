export class FilterDTO {

    constructor(
        public categoryNames: string[] = [],
        public culturalSiteName: string = '',
        public location: string = ''
    ) {}

}