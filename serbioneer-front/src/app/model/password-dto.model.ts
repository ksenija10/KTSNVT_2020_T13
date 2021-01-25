export class PasswordDTO {

    constructor(
        public oldPassword: string,
        public newPassword: string,
        public repeatedPassword: string
    ) {}

}
