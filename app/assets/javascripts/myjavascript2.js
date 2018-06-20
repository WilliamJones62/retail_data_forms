  function getData(data)
  {
    var p1 = data.replace('[', "");
    var p2 = p1.replace(']', "");
    p1 = p2.replace(/"/g, "");
    p2 = p1.replace(/,/g, "");
    var data_array = p2.split(" ");
    data_array.shift();
    data_array.pop();
    return data_array;
  }

  function shipToList()
    {
    //******* need to match ship to list to customer
    var shiptos = document.getElementById("shiptos").innerHTML;
    var customers = document.getElementById("customers").innerHTML;
    var shipto_array = getData(shiptos);
    var customer_array = getData(customers);
    var customer_list = document.getElementById("dontcall_customer");
    var customer = customer_list.options[customer_list.selectedIndex].text;
    var customerlength = customer_array.length;
    var shipto = document.getElementById("dontcall_shipto");
    var o = document.createElement("option");
    var sortarray = [];
    var i = 0;
    shipto.options.length = 0;

    for (i = 0; i < customerlength; i++) {
      if (customer_array[i] == customer) {
        sortarray[sortarray.length] = shipto_array[i];
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
