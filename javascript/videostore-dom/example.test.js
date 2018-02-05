const test = require('ava');
const jsdom = require('jsdom');
const fs = require('fs');

const showStatementCode = fs.readFileSync('./index.js');

test("let's get it in a test harness", t => {
    const html = `
    <html>
      <body>
        <div id="rentals"></div>
        <script>
          ${showStatementCode}
          showStatement('john', []);
        </script>
      </body>
    </html>
    `;
    const dom = new jsdom.JSDOM(html, { runScripts: "dangerously" });
    const document = dom.window.document;

    const output = document.getElementById('rentals');
    t.snapshot(output.outerHTML);
});

test("can use showDocument as a module", t => {
    const showStatement = require('./index.js');
    const html = `
    <html>
      <body>
        <div id="rentals"></div>
      </body>
    </html>
    `;
    const dom = new jsdom.JSDOM(html, { runScripts: "dangerously" });
    const document = dom.window.document;
    const output = document.getElementById('rentals');

    showStatement(document, 'john', []);

    t.snapshot(output.outerHTML);
});
