export class AuthenticatedUser{

    constructor(
        public email: string,
        public password: string,
        public name: string, 
        public surname: string,
        public id?: number) {}

}