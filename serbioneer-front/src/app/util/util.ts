
export function onlyContainsLetters(myString: string) {
    return /^[a-zšđčćžA-ZŠĐČĆŽ]+$/.test(myString);
}

export function onlyContainsLettersAndSpaces(myString: string) {
    return /^[a-zšđčćžA-ZŠĐČĆŽ' ']+$/.test(myString);
}

export function smoothScroll() {
    let scrollToTop = window.setInterval(() => {
        let pos = window.pageYOffset;
        if (pos > 0) {
            window.scrollTo(0, pos - 20); // how far to scroll on each step
        } else {
            window.clearInterval(scrollToTop);
        }
    }, 16);
}

export function calculateLastPage(totalElements: number, pageSize: number, pageIndex: number): number {
    if (totalElements % pageSize !== 0) {
        return pageIndex + 1
    } else {
        return pageIndex
    }
}