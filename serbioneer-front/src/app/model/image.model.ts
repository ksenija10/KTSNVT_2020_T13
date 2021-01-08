
export class Image {
	_id: number;
    name: string;
    content: any;

	constructor(obj?: any){
		this._id = obj && obj._id || null;
		this.name = obj && obj.name || null;
		this.content = obj && obj.content || null;
	}
}