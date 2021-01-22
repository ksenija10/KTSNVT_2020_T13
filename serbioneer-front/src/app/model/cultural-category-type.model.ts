export class CulturalCategoryType {

    public id: number;
    public name: string;

    constructor(name:string, id?: number) {
        this.id = id || 0;
        this.name = name;
    }
}
