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

  function altcsrLists() {
    //******* need to match customer to csr and day
    var csrs = document.getElementById("usualcsrs").innerHTML;
    var days = document.getElementById("altcsrs_days").innerHTML;
    var shiptos = document.getElementById("shiptos").innerHTML;
    var customers = document.getElementById("customers").innerHTML;
    var csr_array = getData(csrs);
    var day_array = getData(days);
    var shipto_array = getData(shiptos);
    var customer_array = getData(customers);
    var csr_list = document.getElementById("altcsr_usualcsr");
    var csr = csr_list.options[csr_list.selectedIndex].text;
    var day_list = document.getElementById("altcsr_altcsrs_day");
    var day = day_list.options[day_list.selectedIndex].text;
    var customerlength = customer_array.length;
    var customer = document.getElementById("altcsr_custcode");
    var customer_id = ' ';
    var o = document.createElement("option");
    var sortarray = [];
    var i = 0;
    customer.options.length = 0;

    for (i = 0; i < customerlength; i++) {
      if (csr_array[i] == csr && day_array[i] == day) {
        if (sortarray.includes(customer_array[i]) == false) {
          sortarray[sortarray.length] = customer_array[i];
        }
      }
    }
    sortarray.sort();
    var sortlength = sortarray.length;
    o.selected = true;
    customer_id = sortarray[0];
    for (i = 0; i < sortlength; i++) {
      o.text = sortarray[i];
      customer.options.add(o, customer.options.length);
      o.selected = false;
      o = document.createElement("option");
    }

    var shipto = document.getElementById("altcsr_shipto");
    o = document.createElement("option");
    sortarray = [];
    i = 0;
    shipto.options.length = 0;

    for (i = 0; i < customerlength; i++) {
      if (csr_array[i] == csr && day_array[i] == day && customer_array[i] == customer_id) {
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
  }

  function altcsrShiptos() {
    //******* need to match shipto to customer
    var csrs = document.getElementById("usualcsrs").innerHTML;
    var days = document.getElementById("altcsrs_days").innerHTML;
    var shiptos = document.getElementById("shiptos").innerHTML;
    var customers = document.getElementById("customers").innerHTML;
    var csr_array = getData(csrs);
    var day_array = getData(days);
    var shipto_array = getData(shiptos);
    var customer_array = getData(customers);
    var csr_list = document.getElementById("altcsr_usualcsr");
    var csr = csr_list.options[csr_list.selectedIndex].text;
    var day_list = document.getElementById("altcsr_altcsrs_day");
    var day = day_list.options[day_list.selectedIndex].text;
    var customer_list = document.getElementById("altcsr_custcode");
    var customer = customer_list.options[customer_list.selectedIndex].text;
    var customerlength = customer_array.length;
    var shipto = document.getElementById("altcsr_shipto");
    o = document.createElement("option");
    sortarray = [];
    i = 0;
    shipto.options.length = 0;

    for (i = 0; i < customerlength; i++) {
      if (csr_array[i] == csr && day_array[i] == day && customer_array[i] == customer) {
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
