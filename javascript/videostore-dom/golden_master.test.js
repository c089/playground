const jsdom = require('jsdom');
const fs = require('fs');
const source = fs.readFileSync('./index.js');

const buildFixture = (customerName, rentals) => {
    const html = `
            <!DOCTYPE html>
            <html>
            <head>
            <meta charset="utf-8">
            <title>JS Bin</title>
            <style>span.amount { float: right; }</style>
            </head>
            <body>
                <div id="rentals"></div>
                <script type="text/javascript">
                    ${source}
                    showStatement(${JSON.stringify(customerName)}, ${JSON.stringify(rentals)});
                </script>
            </body>
            </html>`;

    return new jsdom.JSDOM(html, { runScripts: "dangerously" });
};

test('verify', () => {
    const customerName = 'foo';
    const rentals = [
        {daysRented: 2, movie: { title: 'movie 1', priceCode: 'REGULAR' }},
        {daysRented: 1, movie: { title: 'other', priceCode: 'CHILDRENS'} },
        {daysRented: 5, movie: { title: 'nonsense', priceCode: 'NEW_RELEASE'}}];

    const dom = buildFixture(customerName, rentals);

    expect(dom.window.document.getElementById('rentals')).toMatchSnapshot();
});
