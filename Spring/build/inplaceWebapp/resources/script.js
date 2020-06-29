var numer = Math.floor(Math.random()*5)+1;


      function multi()
      {
          zmienslajd();
          zmienslajd1();
          zmienslajd2();

      }

    function zmienslajd()
    {
        numer++;
        if(numer>5)
        {
            numer=1;
        }
        var plik = "<img src=\"slajdy/slajd" + numer + ".jpg\"/>";
        document.getElementById("slider").innerHTML = plik;

        setTimeout("zmienslajd()",10000);
    }

    function zmienslajd1()
    {
        numer++;
        if(numer>5)
        {
            numer=1;
        }
        var plik = "<img src=\"slajdy/slajd" + numer + ".jpg\"/>";
        document.getElementById("slider1").innerHTML = plik;

        setTimeout("zmienslajd1()",10000);
    }
    function zmienslajd2()
    {
        numer++;
        if(numer>5)
        {
            numer=1;
        }
        var plik = "<img src=\"slajdy/slajd" + numer + ".jpg\"/>";
        document.getElementById("slider2").innerHTML = plik;

        setTimeout("zmienslajd2()",10000);
    }

