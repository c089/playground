= Videostore Kata (Legacy DOM edition) =

This is the videostore Kata from Martin Fowlers Refactoring book, but with most
string concatenation replaced by manual DOM node building to render it in the
same function. In the production system, which we don't have access to the
source code, the script is run by a PHP backend that renders the javascript
source and backend data right into the page. No fancy module loading or
anything. index.html is an example setup that mimics how this is working in
production (since 1999! ah, the golden days...).

Note the produced HTML is a total mess, but we're not allowed to change it since
other parts of the system are tightly coupled to this exact markup for now, so
we're going to need a good suite of tests before we touch this.

```
npm install
npm start
npm test
npm test -- --updateSnapshot
```

