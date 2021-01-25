export class Image {

id: number;
name: string;
content: any;

constructor(obj?: any) {
this.id = obj && obj.id || null;
this.name = obj && obj.name || null;
this.content = obj && obj.content || null;
}
}

export class ImageDTO {

name?: string;
content?: any;

constructor(name: string, content: any) {
this.name = name;
this.content = content;
}
}
