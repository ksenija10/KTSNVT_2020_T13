import { Image } from "./image.model";

export class Comment {
    id: number;
    name: string;
    surname: string;
    culturalSiteName: string;
    text: string;
	approved: boolean;
	images: Image[]

	constructor(obj?: any){
		this.id = obj && obj.id || null;
		this.name = obj && obj.name || null;
		this.surname = obj && obj.surname || null;
		this.culturalSiteName = obj && obj.culturalSiteName || null;
		this.text = obj && obj.text || null;
		this.approved = obj && obj.country || null;
		this.images = obj && obj.images || null;
	}
}