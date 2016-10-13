module Main where

import Data.Vector (fromList)

import Layer
import Network (mkLiteralNetwork, feedForward)

main :: IO ()
main = do
    let hidden  = mkLiteralLayer [ [0.15, 0.2]
                                 , [0.25, 0.3]
                                 ] [0.35, 0.35]
        output  = mkLiteralLayer [ [ 0.4, 0.45]
                                 , [ 0.5, 0.55]
                                 ] [0.6, 0.6]
        network = mkLiteralNetwork hidden output

    print $ feedForward network $ fromList [ 0.05, 0.1 ]
