---
title: "Hastings boats"
output: html_document
---

<style>
    body .main-container {
        max-width: 1000px;
    }
</style>



# Summary tables

## Still on Stade and still fishing


|still_fishing |   n|   percent| valid_percent|
|:-------------|---:|---------:|-------------:|
|Not fishing   | 749| 0.9385965|     0.9677003|
|Still fishing |  25| 0.0313283|     0.0322997|
|NA            |  24| 0.0300752|            NA|


|reg_full |boat_name         | date_built|location_built | weight_tons| length_m|
|:--------|:-----------------|----------:|:--------------|-----------:|--------:|
|RX60     |Alfie Elliot      |       1969|Tankerton      |       10.10|     9.20|
|RX389    |Bethan Louise     |       1997|Newhaven       |       13.02|     9.95|
|RX37     |Bloodaxe 1/2      |       1985|Newhaven       |        2.30|     6.80|
|RX11     |Christine         |       2010|Shoreham       |        3.49|     7.11|
|NN736    |Danny Boy [b]     |       2003|Kent           |        1.62|     6.80|
|PH5590   |Fair Trade        |       1982|NA             |        1.50|     6.50|
|RX58     |Felicity          |         NA|NA             |          NA|       NA|
|RX77     |Four Brothers [b] |       2002|Newhaven       |       13.58|     9.96|
|NN201    |Frederick Rose    |       1987|Newhaven       |        3.82|     8.40|
|RX256    |Girl Kayla 2/2    |       1999|Plymouth       |        7.99|     9.10|
|RX89     |Kaya              |       1974|Cardiff        |        6.30|     9.43|
|RX439    |Kittiwake         |       2007|Brighton       |        7.13|     7.98|
|RX442    |Lucky Lucy        |       2007|Rottingdean    |        7.54|     7.95|
|RX258    |Mona Lisa         |       1975|Newhaven       |        2.59|     6.00|
|RX10     |Moonraker         |       2006|E Sussex       |        1.93|     6.44|
|RX118    |Moonshine         |       1967|Newhaven       |        3.19|     6.28|
|RX142    |My Ronda          |       1976|Newhaven       |        2.55|     6.20|
|RX419    |My Sara           |       2002|Hastings       |       11.84|     9.95|
|RX427    |Oliver Henry      |         NA|Falmouth       |        5.47|     8.30|
|RX55     |Our Holly         |       2011|Sussex         |        3.44|     7.26|
|RX16     |Our Lady [a]      |       1957|Whitstable     |        9.66|     8.84|
|NN200    |Pioneer [b]       |       1988|Kent           |        3.93|     7.94|
|RX150    |Roy's Boys        |       2000|Sussex         |        8.65|     9.40|
|RX1066   |Senlac Jack       |       2005|Colchester     |       16.30|     9.83|
|RX445    |Tia Lily          |       2008|NA             |        3.48|     6.65|




|still_on_stade |   n|   percent| valid_percent|
|:--------------|---:|---------:|-------------:|
|Not on Stade   | 756| 0.9473684|     0.9767442|
|On Stade       |  18| 0.0225564|     0.0232558|
|NA             |  24| 0.0300752|            NA|


|reg_full |boat_name           | date_built|location_built | weight_tons|
|:--------|:-------------------|----------:|:--------------|-----------:|
|DR171    |Amethyst            |       1995|Cornwall       |        1.97|
|RX55     |Conqueror II 3/3    |       1974|Rye            |        3.19|
|RX74     |Edward and Mary 1/4 |       1919|Hastings       |        7.56|
|RX150    |Grace Georgina 1/2  |       1962|Newhaven       |        6.80|
|RX403    |Jack Henry          |       1999|Newhaven       |       10.84|
|RX273    |Jamie               |       1981|Rye            |        3.15|
|RX10     |Jimmy Boy           |       1968|Rye            |        1.68|
|RX304    |Katy Jane           |       1979|Newhaven       |        3.20|
|RX327    |Mandy Ann           |       1981|Newhaven       |        4.38|
|RX310    |Paula Lee II [b]    |       1991|Rye            |        2.49|
|RX405    |PGK                 |         NA|Eastbourne     |          NA|
|DR169    |Plover              |       1996|Isle of Wight  |        0.90|
|NA       |Que Sera Sera       |         NA|NA             |          NA|
|NA       |Rebecca May         |       1904|NA             |          NA|
|RX83     |Sandra 2/2          |       1955|Rye            |        4.38|
|RX134    |Stacey Marie 4/4    |       1945|Newhaven?      |        7.48|
|RX90     |Valiant 1/4         |       1953|Newhaven       |       22.90|
|RX73     |Young Flying Fish   |       1958|Newhaven       |        3.12|


## Registration port


|reg_port |reg_port_name     |   n|   percent| valid_percent|
|:--------|:-----------------|---:|---------:|-------------:|
|RX       |Rye               | 503| 0.6303258|     0.9805068|
|NA       |NA                | 285| 0.3571429|            NA|
|NN       |Newhaven          |   4| 0.0050125|     0.0077973|
|DR       |Dover             |   2| 0.0025063|     0.0038986|
|FE       |Folkestone        |   1| 0.0012531|     0.0019493|
|PH       |Plymouth          |   1| 0.0012531|     0.0019493|
|RE       |Rye (before 1868) |   1| 0.0012531|     0.0019493|
|SM       |Shoreham          |   1| 0.0012531|     0.0019493|


![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6-1.png)


## Propulsion


|propulsion       |   n|   percent| valid_percent|
|:----------------|---:|---------:|-------------:|
|Lugger           | 264| 0.3308271|     0.3333333|
|Engine           | 229| 0.2869674|     0.2891414|
|Auxiliary        | 130| 0.1629073|     0.1641414|
|Lugger/Auxiliary | 113| 0.1416040|     0.1426768|
|Lugger (big)     |  47| 0.0588972|     0.0593434|
|NA               |   6| 0.0075188|            NA|
|Gaff/Auxiliary   |   5| 0.0062657|     0.0063131|
|Oars only        |   2| 0.0025063|     0.0025253|
|Spritsail        |   2| 0.0025063|     0.0025253|

![plot of chunk unnamed-chunk-8](figure/unnamed-chunk-8-1.png)

## Construction material


|construction_material |   n|   percent| valid_percent|
|:---------------------|---:|---------:|-------------:|
|Wood                  | 739| 0.9260652|     0.9414013|
|GRP (fibre glass)     |  25| 0.0313283|     0.0318471|
|Metal                 |  20| 0.0250627|     0.0254777|
|NA                    |  13| 0.0162907|            NA|
|Concrete              |   1| 0.0012531|     0.0012739|

![plot of chunk unnamed-chunk-10](figure/unnamed-chunk-10-1.png)

## Deck type


|deck_type |   n|   percent| valid_percent|
|:---------|---:|---------:|-------------:|
|NA        | 335| 0.4197995|            NA|
|Open      | 233| 0.2919799|     0.5032397|
|Decked    | 230| 0.2882206|     0.4967603|

![plot of chunk unnamed-chunk-12](figure/unnamed-chunk-12-1.png)

## Length


|reg_full |boat_name             | length_m|
|:--------|:---------------------|--------:|
|RX3      |Alfred Colebrooke 1/2 |    21.37|
|RX3      |Alfred Colebrooke 2/2 |    21.37|
|RX62     |Kent Colebrooke       |    20.73|
|RX26     |AEFA                  |    15.24|
|RX15     |Claude                |    11.80|
|RX33     |Arthur 1/3            |    11.58|
|RX33     |Arthur 2/3            |    11.58|
|RX33     |Arthur 3/3            |    11.58|
|RX87     |Alexandra 1/2         |    10.36|
|RX87     |Alexandra 2/2         |    10.36|
|RX178    |John's Model 1/4      |    10.30|
|RX178    |John's Model 2/4      |    10.30|
|RX178    |John's Model 3/4      |    10.30|
|RX178    |John's Model 4/4      |    10.30|
|RX176    |Jeanne d'Arc IV       |    10.09|

![plot of chunk unnamed-chunk-14](figure/unnamed-chunk-14-1.png)

## Weight


|reg_full |boat_name             | weight_tons|
|:--------|:---------------------|-----------:|
|RX3      |Alfred Colebrooke 1/2 |       56.45|
|RX3      |Alfred Colebrooke 2/2 |       56.45|
|RX62     |Kent Colebrooke       |       52.66|
|NA       |British Queen [b] 1/2 |       29.00|
|NA       |British Queen [b] 2/2 |       29.00|
|NA       |Swan [b]              |       29.00|
|NA       |Sarah Ann             |       27.44|
|RE65     |Ocean Queen           |       27.00|
|RX13     |Happy Return [a] 1/2  |       25.70|
|NA       |Happy Return [a] 2/2  |       25.70|
|NA       |Favourite [a]         |       25.50|
|NA       |Jane [d]              |       25.25|
|NA       |Fanny                 |       25.20|

![plot of chunk unnamed-chunk-16](figure/unnamed-chunk-16-1.png)
