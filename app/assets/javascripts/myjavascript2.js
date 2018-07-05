  function getData(data) {
    var p1 = data.replace('[', "");
    var p2 = p1.replace(']', "");
    p1 = p2.replace(/"/g, "");
    p2 = p1.replace(/,/g, "");
    var data_array = p2.split(" ");
    data_array.shift();
    data_array.pop();
    return data_array;
  }

  function dontSellLists() {
    //******* need to match ship to and part list to customer
    var shiptos = document.getElementById("shiptos").innerHTML;
    var parts = document.getElementById("parts").innerHTML;
    var customers = document.getElementById("customers").innerHTML;
    var customersA = document.getElementById("customersA").innerHTML;
    var shipto_array = getData(shiptos);
    var part_array = getData(parts);
    var customer_array = getData(customers);
    var customerA_array = getData(customersA);
    var customer_list = document.getElementById("dontcall_customer");
    var customer = customer_list.options[customer_list.selectedIndex].text;
    var customerlength = customer_array.length;
    var customerAlength = customerA_array.length;
    var shipto = document.getElementById("dontcall_shipto");
    var o = document.createElement("option");
    var sortarray = [];
    var i = 0;
    shipto.options.length = 0;

    for (i = 0; i < customerlength; i++) {
      if (customer_array[i] == customer) {
        if (sortarray.includes(shipto_array[i]) == false) {
          sortarray[sortarray.length] = shipto_array[i];
        }
      }
    }
    sortarray.sort();
    var sortlength = sortarray.length;

    for (i = 0; i < sortlength; i++) {
      o.text = sortarray[i];
      shipto.options.add(o, shipto.options.length);
      o = document.createElement("option");
    }
    var part = document.getElementById("dontcall_part");
    var p = document.createElement("option");
    sortarray = [];
    i = 0;
    part.options.length = 0;

    for (i = 0; i < customerAlength; i++) {
      if (customerA_array[i] == customer) {
        if (sortarray.includes(part_array[i]) == false) {
          sortarray[sortarray.length] = part_array[i];
        }
      }
    }
    sortarray.sort();
    sortlength = sortarray.length;

    for (i = 0; i < sortlength; i++) {
      p.text = sortarray[i];
      part.options.add(p, part.options.length);
      p = document.createElement("option");
    }
  }

  function onSpecialLists() {
    //******* need to match part list to customer
    var parts = document.getElementById("parts").innerHTML;
    var customers = document.getElementById("customers").innerHTML;
    var part_array = getData(parts);
    var customer_array = getData(customers);
    var customer_list = document.getElementById("onspecial_customer");
    var customer = customer_list.options[customer_list.selectedIndex].text;
    var customerlength = customer_array.length;
    var part = document.getElementById("onspecial_part");
    var o = document.createElement("option");
    var sortarray = [];
    var i = 0;
    part.options.length = 0;

    for (i = 0; i < customerlength; i++) {
      if (customer_array[i] == customer || customer == 'ALL') {
        if (sortarray.includes(part_array[i]) == false) {
          sortarray[sortarray.length] = part_array[i];
        }
      }
    }
    sortarray.sort();
    var sortlength = sortarray.length;

    for (i = 0; i < sortlength; i++) {
      o.text = sortarray[i];
      part.options.add(o, part.options.length);
      o = document.createElement("option");
    }
  }
  function buildTable() {
    //******* build a call list for a CSR/Day combination
    $('#listtab').remove();
    var csr = document.getElementById("csrid").innerHTML;
    var csrid = getData(csr);
    var day = document.getElementById("dayid").innerHTML;
    var dayid = getData(day);
    var cust = document.getElementById("customer").innerHTML;
    var customer = getData(cust);
    var ship = document.getElementById("shipto").innerHTML;
    var shipto = getData(ship);
    var dpt = document.getElementById("dept").innerHTML;
    var dept = getData(dpt);
    var ph = document.getElementById("phone").innerHTML;
    var phone = getData(ph);
    var man = document.getElementById("manager").innerHTML;
    var manager = getData(man);
    var call = document.getElementById("called").innerHTML;
    var called = getData(call);
    var call_id = document.getElementById("call_list_id").innerHTML;
    var call_list_id = getData(call_id);
    var pickacsr = document.getElementById("pickacsr");
    var csrsel = pickacsr.options[pickacsr.selectedIndex].text;
    var daysel = pickaday.options[pickaday.selectedIndex].text;
    var listtable = document.getElementById('listtable');
    var tbl = document.createElement('table');
    tbl.setAttribute("id","listtab");
    var row = document.createElement('tr');
    var headerCell = document.createElement("th");
    var cellText = document.createTextNode('Customer');
    headerCell.appendChild(cellText);
    row.appendChild(headerCell);
    headerCell = document.createElement("th");
    cellText = document.createTextNode('Ship to');
    headerCell.appendChild(cellText);
    row.appendChild(headerCell);
    headerCell = document.createElement("th");
    cellText = document.createTextNode('Dept');
    headerCell.appendChild(cellText);
    row.appendChild(headerCell);
    headerCell = document.createElement("th");
    cellText = document.createTextNode('Phone');
    headerCell.appendChild(cellText);
    row.appendChild(headerCell);
    headerCell = document.createElement("th");
    cellText = document.createTextNode('Manager');
    headerCell.appendChild(cellText);
    row.appendChild(headerCell);
    headerCell = document.createElement("th");
    cellText = document.createTextNode('Called?');
    headerCell.appendChild(cellText);
    row.appendChild(headerCell);
    headerCell = document.createElement("th");
    cellText = document.createTextNode('Edit');
    headerCell.appendChild(cellText);
    row.appendChild(headerCell);
    tbl.appendChild(row);
    //Add the data rows.
    var length = customer.length;
    for (var i = 0; i < length; i++) {
      if (csrsel == csrid[i] && daysel == dayid[i]) {
        var row = document.createElement("tr");
        var cell = document.createElement("td");
        cellText = document.createTextNode(customer[i]);
        cell.appendChild(cellText);
        row.appendChild(cell);
        cell = document.createElement("td");
        cellText = document.createTextNode(shipto[i]);
        cell.appendChild(cellText);
        row.appendChild(cell);
        cell = document.createElement("td");
        cellText = document.createTextNode(dept[i]);
        cell.appendChild(cellText);
        row.appendChild(cell);
        cell = document.createElement("td");
        cellText = document.createTextNode(phone[i]);
        cell.appendChild(cellText);
        row.appendChild(cell);
        cell = document.createElement("td");
        cellText = document.createTextNode(manager[i]);
        cell.appendChild(cellText);
        row.appendChild(cell);
        cell = document.createElement("td");
        cellText = document.createTextNode(called[i]);
        cell.appendChild(cellText);
        row.appendChild(cell);
        cell = document.createElement("td");
        var link = document.createElement('a');
        var linkText = document.createTextNode("Edit");
        link.appendChild(linkText);
        link.setAttribute("href","/calllists/"+call_list_id[i]+"/edit");
        cell.appendChild(link);
        row.appendChild(cell);
        tbl.appendChild(row);
      }
    }
    listtable.appendChild(tbl);
  }
