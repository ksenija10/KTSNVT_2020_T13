export class UserUpdateDTO {
    
    constructor(
        public email?: string,
        public name?: string,
        public surname?: string,
        public dateOfBirth?: Date
    ) {}

}