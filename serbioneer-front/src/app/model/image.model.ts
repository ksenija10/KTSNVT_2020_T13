export class Image {

    constructor(
        public name: string,
        public content: string,
        public id?: number
    ) {}
}

export class SliderImage {

    constructor(
        public image: string,
        public thumbImage: string,
        public title: string
    ) {}
}
