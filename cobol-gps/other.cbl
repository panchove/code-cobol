      * ------------------------------------------
      *    geo sao paulo
           move "-23.550519" to temp
           compute lat1 = temp * (pi / 180)

           move "-46.633309" to temp
           compute long1 = temp * (pi / 180)
      *-------------------------------------------
      *    geo New York
           move "+40.7127837" to temp
           compute lat2 = temp * (pi / 180)

           move "-74.005941" to temp
           compute long2 = temp * (pi / 180)

           compute distancia-km = function acos(
                                function sin(lat1) * function sin(lat2)
                              + function cos(lat1) * function cos(lat2)
                              * function cos(long2 - long1))
                        * raio-da-terra

           compute distancia-m = distancia-km / km-por-milha

           compute distancia-km-dsp = distancia-km
           compute distancia-m-dsp  = distancia-m

           display "Spo Pauloto New York"
           display distancia-result

