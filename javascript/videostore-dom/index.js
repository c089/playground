function showStatement(customerName, rentals) {
    showStatementReplacement(customerName, rentals);
}

function showStatementReplacement(customerName, rentals) {
    var totalAmount = 0;
    var frequentRenterPoints = 0;

    var node = document.getElementById('rentals');
    var result = "Rental Record for: " + customerName + "\n";
    var i = 0;
    var rental = rentals[0];

    node.style = 'width: 500px';
    node.append(result);

    while (i < rentals.length) {
        var li = document.createElement('div');
        var left = document.createElement('span');
        var right = document.createElement('span');
        var thisAmount = 0;
        var each = rentals[i];

        switch(each.movie.priceCode) {
        case 'REGULAR':
            thisAmount += 2;
            if (each.daysRented > 2)
                thisAmount += (each.daysRented - 2) * 1.5;
            break;
        case 'NEW_RELEASE':
            thisAmount += each.daysRented * 3;
            break;
        case 'CHILDRENS':
            thisAmount += 1.5;
            if (each.daysRented > 3)
                thisAmount += (each.daysRented - 3) * 1.5;
            break;
        }

        // add frequent renter points
        frequentRenterPoints++;

        // add bonus for a two day new release rental
        if (each.movie.priceCode == 'NEW_RELEASE' && each.daysRented > 1) frequentRenterPoints++;

        //show figures for this rental
        right.className = 'amount';
        left.append(each.movie.title)
        right.append(thisAmount.toString() + ' EUR');
        li.appendChild(left);
        li.appendChild(right);
        node.appendChild(li)

        totalAmount += thisAmount;
        i+=1;
    }

    // add footer lines
    var footerEl = document.createElement('div');
    result = "Amount owed is " + totalAmount.toString() + " EUR";
    footerEl.append(result);
    node.appendChild(footerEl);
    result = "You earned " + frequentRenterPoints.toString() + " frequent renter points";
    footerEl = document.createElement('div');
    footerEl.append(result);
    node.appendChild(footerEl);
}

 if (typeof require !== 'undefined') {
     module.exports = showStatementReplacement;
 }
