= Videostore Kata (Legacy DOM edition) =

This is the videostore Kata from Martin Fowlers Refactoring book, but with most
string concatenation replaced by manual DOM node building to render it in the
same function. It also hides the inputs in global variables, another anti-pattern
commonly found in legacy web applications. Because of this, unlike the original
example, you will need to first create some seams to get this system under test
before applying refactoring steps. 

Note the produced HTML is a total mess, but we're not allowed to change it since
other parts of the system are tightly coupled to this exact markup for now.

```
npm install
npm start
```
