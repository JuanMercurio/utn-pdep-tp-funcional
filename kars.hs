module TP where

import Text.Show.Functions -- esto permite que las funciones sean mostrables
import Data.List -- esto me da la funcion genericLength, usar esta en vez de length

-- Poner aqui la solucion:

type Nombre = String
type Velocidad = Float 
type NivelNafta = Float 
type NombreEnamorade = String
type Truco = Auto -> Auto

data Auto = UnAuto {
    nombre :: Nombre, 
    nivelNafta :: NivelNafta,
    velocidad :: Velocidad,
    nombreEnamorade :: NombreEnamorade,
    trucoFavorito :: Truco
} deriving (Show)


aumentarPorNombre :: Nombre -> Velocidad -> Velocidad
aumentarPorNombre nombre velocidad = velocidad + genericLength nombre

impresionar :: Auto -> Auto
impresionar (UnAuto nombre nivelNafta velocidad nombreEnamorade trucoFavorito) =
    UnAuto nombre  nivelNafta (aumentarPorNombre nombre velocidad) nombreEnamorade trucoFavorito

nitro :: Auto -> Auto
nitro (UnAuto nombre nivelNafta velocidad nombreEnamorade trucoFavorito ) = 
    UnAuto nombre nivelNafta (velocidad + 15)  nombreEnamorade trucoFavorito
 
    
fingirAmor :: String -> Auto -> Auto
fingirAmor nombreNuevoEnamorade auto = 
   auto {nombreEnamorade = nombreNuevoEnamorade}

pista = 1000

deReversa :: Auto -> Auto
deReversa (UnAuto nombre  nivelNafta velocidad nombreEnamorade trucoFavorito) =
    UnAuto nombre (nivelNafta + pista/5) velocidad nombreEnamorade trucoFavorito 

rochaMcQueen :: Auto
rochaMcQueen = UnAuto "rochaMcQueen" 300 0 "Ronco"  deReversa
biankerr :: Auto
biankerr = UnAuto  "biankerr" 500 20 "Tinch"  impresionar
gushtav :: Auto
gushtav = UnAuto "gushtav"  200  130 "PetiLaLinda"  nitro
rodra :: Auto
rodra = UnAuto "rodra" 0 50 "Taisa" (fingirAmor "gushtav")

-- trucoFavorito rodra 

nombrePalindromo nombre = head nombre == last nombre

aumentarVelocidad nombre velocidad | nombrePalindromo nombre = velocidad + 50
                                   | genericLength nombre <= 2 = velocidad + 15
                                   | genericLength nombre <= 4 = velocidad + 20
                                   | genericLength nombre > 4 = velocidad + 30
                                   

incrementarVelocidad (UnAuto nombre nivelNafta velocidad nombreEnamorade trucoFavorito ) = 
    UnAuto nombre nivelNafta (aumentarVelocidad nombreEnamorade velocidad) nombreEnamorade trucoFavorito









