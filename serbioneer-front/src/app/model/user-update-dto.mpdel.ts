export class UserUpdateDTO {

    constructor(
        public name?: string,
        public surname?: string,
        public dateOfBirth?: Date,
        public email?: string
    ) {}

}
