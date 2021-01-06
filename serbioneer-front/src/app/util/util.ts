
export function onlyContainsLetters(myString: string) {
    return /^[a-zA-Z]+$/.test(myString);
}